//
//  BoardGameController.m
//  bgg
//
//  Created by Ana Oliveira on 5/9/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameController.h"
#import "BoardGameHeaderCell.h"
#import "BoardGameRatingCell.h"
#import "BoardGameGenericCell.h"
#import "BoardGameForumsController.h"
#import "BoardGameCommentsController.h"
#import "BoardGameDescriptionCell.h"
#import "BoardGameMechanicsCell.h"
#import "BoardGameCategoriesCell.h"
#import "BoardGameDesignersCell.h"
#import "BoardGameArtistsCell.h"
#import "BoardGamePublishersCell.h"

@interface BoardGameController (Private)

-(void) loadGameRatings;

@end

@implementation BoardGameController

@synthesize boardGame = _boardGame;
@synthesize menuBasics = _menuBasics;
@synthesize menuDetails = _menuDetails;

- (id)init
{
    self = [self initWithNibName:@"BoardGameController" bundle:nil];
    
	return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.menuBasics = [NSArray arrayWithObjects: @"Videos", @"Users Collections", nil];
        //self.menuDetails = [NSArray arrayWithObjects: @"Designers", @"Artists", @"Publishers",@"Mechanics", @"Categories", nil];
    }
    return self;
}

- (void)dealloc
{
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
    self.tableView.backgroundColor = [UIColor clearColor];
    [self setTitle:_boardGame.primaryTitle];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return BG_TABLE_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return FIXED_NUM_ROWS + [_menuBasics count];
    }
    else if(section == 1 || section == 2)
    {
        return 3;
        //return [_menuDetails count];
    }
    
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 1)
    {
        return @"In Detail";
    }else if(section == 2)
    {
        return @"Credits";
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView boardGameBasics:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    UITableViewCell<IBoardGameCell> *cell;
    
    switch (indexPath.row) {
        case 0:
            
            CellIdentifier = @"HeaderCell";
            cell = (BoardGameHeaderCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGameHeaderCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            break;
            
        case 1:
            
            CellIdentifier = @"RatingCell";
            cell = (BoardGameRatingCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGameRatingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            break;
            
        default:
            
            CellIdentifier = @"GenericCell";
            cell = (BoardGameGenericCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGameGenericCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            
            NSString* option = [_menuBasics objectAtIndex:(indexPath.row - FIXED_NUM_ROWS)];
            [(BoardGameGenericCell*)cell setMenuOption:option];
            
            break;
    }
    
    [cell setBoardGame:_boardGame];
    [cell setTag: (100*indexPath.section) + indexPath.row];
    
    return cell;

}

- (UITableViewCell *)tableView:(UITableView *)tableView boardGameInDetail:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    UITableViewCell<IBoardGameCell> *cell;
    
    switch (indexPath.row) {
        case 0:
            
            CellIdentifier = @"Description";
            cell = (BoardGameDescriptionCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGameDescriptionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            break;
        case 1:
            
            CellIdentifier = @"CategoriesCell";
            cell = (BoardGameCategoriesCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGameCategoriesCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            break;
        case 2:
            CellIdentifier = @"MechanicsCell";
            cell = (BoardGameMechanicsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGameMechanicsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            break;
        default:
            CellIdentifier = @"MechanicsCell";
            cell = (BoardGameMechanicsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGameMechanicsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            break;
    }
    
    [cell setBoardGame:_boardGame];
    [cell setTag: (100*indexPath.section) + indexPath.row];
    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView boardGameCredits:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    UITableViewCell<IBoardGameCell> *cell;
    
    switch (indexPath.row) {
        case 0:
            
            CellIdentifier = @"Designers";
            cell = (BoardGameDesignersCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGameDesignersCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            break;
        case 1:
            
            CellIdentifier = @"Artists";
            cell = (BoardGameArtistsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGameArtistsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            break;
        case 2:
            CellIdentifier = @"Publishers";
            cell = (BoardGamePublishersCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGamePublishersCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            break;
        default:
            CellIdentifier = @"Designers";
            cell = (BoardGameDesignersCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGameDesignersCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            break;
    }
    
    [cell setBoardGame:_boardGame];
    [cell setTag: (100*indexPath.section) + indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) 
    {
        return [self tableView:tableView boardGameBasics:indexPath];
         
    }else if(indexPath.section == 1){
        
        return [self tableView:tableView boardGameInDetail:indexPath];
    }else if(indexPath.section == 2){
        return [self tableView:tableView boardGameCredits:indexPath];
    }
    return NULL;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 0){
        switch (indexPath.row) {
            case 0:
                return HEADER_CELL_HEIGHT;
                break;
            default:
                return GENERIC_CELL_HEIGHT;
                break;
        } 
    } else if(indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
                return HEADER_CELL_HEIGHT; //descriptionCell
                break;
            case 1:
                return [BoardGameCategoriesCell calculateCellHeight:_boardGame];
                break;
            case 2:
                return [BoardGameMechanicsCell calculateCellHeight:_boardGame];
                break;
            default:
                return [BoardGameMechanicsCell calculateCellHeight:_boardGame];
                break;
        }
    }else if(indexPath.section == 2){
        switch (indexPath.row) {
            case 0:
                return [BoardGameDesignersCell calculateCellHeight:_boardGame];
                break;
            case 1:
                return [BoardGameArtistsCell calculateCellHeight:_boardGame];
                break;
            case 2:
                return [BoardGamePublishersCell calculateCellHeight:_boardGame];
                break;
            default:
                return [BoardGameDesignersCell calculateCellHeight:_boardGame];
                break;
        }
    }
        return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController* controller;
    switch (indexPath.row) {
        case 1:     //Ratings/Comments
            
            [self loadGameRatings];
            
            break;
        case 2:     //Forums
            
            controller = [[[BoardGameForumsController alloc] init] autorelease];
            
            [(BoardGameForumsController*)controller setBoardGame:_boardGame];
            
            [[[Globals sharedGlobals] breadcrumb] addViewController:controller animated:YES];

            break;
        case 3:     //Videos
            
            controller = [[[BoardGameForumsController alloc] init] autorelease];
            
            [(BoardGameForumsController*)controller setBoardGame:_boardGame];
            
            [[[Globals sharedGlobals] breadcrumb] addViewController:controller animated:YES];
            break;

        default:
            break;
    }
    
}

#pragma mark Private

-(void) loadGameRatings
{
    [[Globals sharedGlobals] showHUDWithMessage:@"Loading ratings..."];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(gotRatingsForGame:) 
                                                 name:[[[Globals sharedGlobals] remoteConnector] getGameRatings:_boardGame.gameId :1]
                                               object:nil];
}

-(void) gotRatingsForGame:(NSNotification*) notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:[[notification object] objectForKey:@"key"] object:nil];
	
	NSArray * ratings = [[notification object] objectForKey:@"data"];
    
    BoardGameCommentsController* controller = [[[BoardGameCommentsController alloc] init] autorelease];
    
    [controller setRatings:ratings];
    
    [[[Globals sharedGlobals] breadcrumb] addViewController:controller animated:YES];
    
    [[Globals sharedGlobals] closeHUD];
}

@end
