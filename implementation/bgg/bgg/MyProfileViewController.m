//
//  MyProfileViewController.m
//  bgg
//
//  Created by João Caxaria on 5/15/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "MyProfileViewController.h"
#import "BoardGameController.h"
#import "DBPerson.h"
#import "DBBoardGame.h"
#import "BoardGameListCell.h"
#import "DataAccess+BoardGame.h"
#import "BGGBoardGame.h"
#import "Globals.h"
#import "PersonRemoteConnector.h"


@interface MyProfileViewController (Private)

-(void) showGameDetails:(DBBoardGame*) boardGame;
-(void) updateUIData;
-(void) doUpdateUIData;

@end

@implementation MyProfileViewController

@synthesize boardGames = _boardGames;

-(id) init
{
	self = [self initWithNibName:@"BoardGameListController" bundle:nil];
	
    
    ICAssert([[Globals sharedGlobals] bggUsername] != nil, @"Need a profile name");
    
    currentProfile = [[[[Globals sharedGlobals] dataAccess] getCreatePersonByUsername:[[Globals sharedGlobals] bggUsername]] retain];
    
    [self setTitle:currentProfile.username];
    
    currentStatus = MyProfileOwnedGames;
    
    return self;
}

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}


- (void)dealloc
{
    [currentProfile release];
    [_boardGames release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView setRowHeight:76.0];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    
    
    [self updateUIData];
    //    NSArray* products = [[[Globals sharedGlobals] dataAccess] getTop100];
    //    [self setBoardGames:products];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_boardGames == nil)
        return 0;
    return [_boardGames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    BoardGameListCell *cell = (BoardGameListCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[BoardGameListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    DBBoardGame* boardGame = [_boardGames objectAtIndex:[indexPath indexAtPosition:1]];
    
    [cell setBoardGame:boardGame];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DBBoardGame* boardGame = [_boardGames objectAtIndex:[indexPath indexAtPosition:1]];
    int secondsInDay = 86400;
    NSDate * today = [NSDate date];
    NSDate * refDate = [NSDate dateWithTimeInterval:secondsInDay sinceDate:boardGame.updated]; 
    NSComparisonResult compared = [refDate compare:today];
    
    if(compared < 0 || ![boardGame.hasDetails boolValue])
    {
        [[Globals sharedGlobals] showHUDWithMessage:@"Loading game..."]; 
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(gotGameDetails:) 
                                                     name:[[[Globals sharedGlobals] remoteConnector] getGameDetails:boardGame.gameId]
                                                   object:nil];
    }
    else
    {
        [self showGameDetails:boardGame];
    }
    
    
}

#pragma mark Private

-(void) updateUIData
{
    switch (currentStatus) {
        case MyProfileOwnedGames:
            if([currentProfile needsUpdateOwnedGames])
            {
                [[Globals sharedGlobals] showHUDWithMessage:@"Loading owned games..."];
                
                [[NSNotificationCenter defaultCenter] addObserver:self 
                                                         selector:@selector(gotUserCollection:) 
                                                             name:[[[Globals sharedGlobals] remoteConnector] getUserOwnedCollection:[currentProfile username]]
                                                           object:nil];
            }
            else
            {
                [self doUpdateUIData];
            }
            break;
        case MyProfilePlayedGames:
            if([currentProfile needsUpdatePlayedGames])
            {
                [[Globals sharedGlobals] showHUDWithMessage:@"Loading played games..."];
                
                [[NSNotificationCenter defaultCenter] addObserver:self 
                                                         selector:@selector(gotUserCollection:) 
                                                             name:[[[Globals sharedGlobals] remoteConnector] getUserPlayedCollection:[currentProfile username]]
                                                           object:nil];
            }
            else
            {
                [self doUpdateUIData];
            }
            break;
        case MyProfileWishedGames:
            if([currentProfile needsUpdateWishedGames])
            {
                [[Globals sharedGlobals] showHUDWithMessage:@"Loading wished games..."];
                
                [[NSNotificationCenter defaultCenter] addObserver:self 
                                                         selector:@selector(gotUserCollection:) 
                                                             name:[[[Globals sharedGlobals] remoteConnector] getUserWishlistCollection:[currentProfile username]]
                                                           object:nil];
            }
            else
            {
                [self doUpdateUIData];
            }
            break;
        default:
            ICAssert(NO, @"Invalid status");
            break;
    }
}

-(void) gotUserCollection:(NSNotification*) notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:[[notification object] objectForKey:@"key"] object:nil];
	
	NSArray * userCollection = [[notification object] objectForKey:@"data"];
    
    
    for(BGGBoardGameLookup* bggBoardGame in userCollection)
    {
        DBBoardGame* dbBoardGame = [[[Globals sharedGlobals] dataAccess] getCreateBoardGame:bggBoardGame.gameId];
        [dbBoardGame updateFromBGGLookup:bggBoardGame];
        
        switch (currentStatus) 
        {
            case MyProfileOwnedGames:
                [currentProfile addOwnedGamesObject:dbBoardGame];
                break;
            case MyProfilePlayedGames:
                [currentProfile addPlayedGamesObject:dbBoardGame];
                break;
            case MyProfileWishedGames:
                [currentProfile addWishedGamesObject:dbBoardGame];
                break;
                
        }
    }
    [[[Globals sharedGlobals] dataAccess] saveChanges];
    [self doUpdateUIData];
    
    [[Globals sharedGlobals] closeHUD];
}

-(void) doUpdateUIData
{
    switch (currentStatus) {
        case MyProfileOwnedGames:
            [self setBoardGames:[[currentProfile ownedGames] allObjects]];
            
            break;
        case MyProfilePlayedGames:
            
            [self setBoardGames:[[currentProfile playedGames] allObjects]];
            
            break;
        case MyProfileWishedGames:
            
            [self setBoardGames:[[currentProfile wishedGames] allObjects]];
            
            break;
        default:
            ICAssert(NO, @"Invalid status");
            break;
    }
    [self.tableView reloadData]; 
}

-(void) gotGameDetails:(NSNotification*) notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:[[notification object] objectForKey:@"key"] object:nil];
	
	BGGBoardGame * game = [[notification object] objectForKey:@"data"];
    
    DBBoardGame* dbGame = [[[Globals sharedGlobals] dataAccess] getCreateBoardGame:game.gameId];
    [dbGame updateFromBGG:game];
    
    [[[Globals sharedGlobals] dataAccess] saveChanges];
    
    [self showGameDetails:dbGame];
    
    [[Globals sharedGlobals] closeHUD];
}

-(void) showGameDetails:(DBBoardGame*) boardGame
{
    DBBoardGame* gameWithConnections = [[[Globals sharedGlobals] dataAccess] getBoardGameById:boardGame.gameId];
    
    BoardGameController* controller = [[[BoardGameController alloc] init] autorelease];
    
    [controller setBoardGame:gameWithConnections];
    
	[[[Globals sharedGlobals] breadcrumb] addViewController:controller animated:YES];
}



#pragma mark IBreadcrumbMenu

-(UIView*) menuClicked
{
    return nil;
}

-(void) breadcrumbWillAppear:(id<IBreadcrumbController>) breadcrumb
{
    [breadcrumb setStatusMessage:@"My Profile"];
    [breadcrumb setUpdated];
}
-(void) breadcrumbWillDisappear:(id<IBreadcrumbController>) breadcrumb
{
    
}



@end
