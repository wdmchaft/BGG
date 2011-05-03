//
//  InitialSyncViewController.m
//  bgg
//
//  Created by João Caxaria on 4/19/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "InitialSyncViewController.h"
#import "BGGBoardGame.h"
#import "StorageHelper.h"
#import "DataAccess+BoardGame.h"

@interface InitialSyncViewController(Private)

-(void) doUpdateNextGame;
-(void) completed;
@end

@implementation InitialSyncViewController

-(id) init
{
    self = [super init];
    
    return self;
}

- (void)dealloc
{
    [_hud release];
    [super dealloc];
}


#pragma mark - View lifecycle

-(void)start
{
    _hud = [[SSHUDView alloc] initWithTitle:@"Loading games..."];
    [_hud show];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(loadedTop100:) 
                                                 name:[[[Globals sharedGlobals] remoteConnector] getTop100]
                                               object:nil];
}

-(void) loadedTop100:(NSNotification*) notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:[[notification object] objectForKey:@"key"] object:nil];
	
	results = [[[notification object] objectForKey:@"data"] retain];
    currentIndex = 0;    
    
    [self doUpdateNextGame];
}

-(void) doUpdateNextGame
{
    if([results count] <= currentIndex)
    {
        [self completed];
        return;
    }
    
    BGGBoardGame* currentGame = [results objectAtIndex:currentIndex];
    
    [_hud.textLabel setText:[NSString stringWithFormat:@"Getting %@ details", currentGame.primaryTitle]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(gotGameImage:) 
                                                 name:[[[Globals sharedGlobals] remoteConnector] getRawRequest:currentGame.imageURL]
                                               object:nil];

}

-(void) gotGameImage:(NSNotification*) notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:[[notification object] objectForKey:@"key"] object:nil];
	
	NSData* imageData = [[[notification object] objectForKey:@"data"] retain];
    BGGBoardGame* currentGame = [results objectAtIndex:currentIndex];
    
    NSString* filenamePath = [NSString stringWithFormat:@"/%@/preview.png", currentGame.gameId];
    [StorageHelper createDirectory:currentGame.gameId];
    
    [imageData writeToFile:[[StorageHelper baseStorageDirectory] stringByAppendingPathComponent:filenamePath] atomically:NO];
    
    DBBoardGame* game = [[[Globals sharedGlobals] dataAccess] createBoardGame];
    
    [game updateFromBGG:currentGame];
    
    [[[Globals sharedGlobals] dataAccess] saveChanges];
    
    currentIndex++;
    
    [self doUpdateNextGame];
}


-(void) completed
{
    [_hud completeWithTitle:@"Completed!"];
    [self performSelector:@selector(dismissPopup:) withObject:nil afterDelay:0.7];
}


- (void)dismissPopup:(id)sender {
	[_hud dismiss];
    [_hud release];
    _hud = nil;
}





@end
