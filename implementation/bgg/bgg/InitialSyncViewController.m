//
//  InitialSyncViewController.m
//  bgg
//
//  Created by João Caxaria on 4/19/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "InitialSyncViewController.h"


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
    _hud = [[SSHUDView alloc] initWithTitle:@"Loading..."];
    [_hud show];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(loadedTop100:) 
                                                 name:[[[Globals sharedGlobals] remoteConnector] getTop100]
                                               object:nil];
}

-(void) loadedTop100:(NSNotification*) notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:[[notification object] objectForKey:@"key"] object:nil];
	
	NSArray* result = [[notification object] objectForKey:@"data"];
	
    
    [_hud completeWithTitle:@"Completed!"];
    [self performSelector:@selector(dismissPopup:) withObject:nil afterDelay:0.7];
}


- (void)dismissPopup:(id)sender {
	[_hud dismiss];
    [_hud release];
    _hud = nil;
}





@end
