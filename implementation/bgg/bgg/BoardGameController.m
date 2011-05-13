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
        
        self.menuBasics = [NSArray arrayWithObjects: @"Description", @"Videos", @"Users Collections", nil];
        self.menuDetails = [NSArray arrayWithObjects: @"Designers", @"Artists", @"Publishers",@"Mechanics", @"Categories", nil];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 2 + [_menuBasics count];
    }
    else if(section == 1)
    {
        return [_menuDetails count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView boardGameBasics:(NSNumber *)row
{
    static NSString *CellIdentifier;
    switch ([row integerValue]) {
        case 0:
            
            CellIdentifier = @"HeaderCell";
            BoardGameHeaderCell *headerCell = (BoardGameHeaderCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (headerCell == nil) 
            {
                headerCell = [[[BoardGameHeaderCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            
            [headerCell setBoardGame:_boardGame];
            
            return headerCell;
            break;
            
        case 1:
            
            CellIdentifier = @"RatingCell";
            BoardGameRatingCell *ratingCell = (BoardGameRatingCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (ratingCell == nil) 
            {
                ratingCell = [[[BoardGameRatingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            
            [ratingCell setBoardGame:_boardGame];
            
            return ratingCell;
            break;
            
        default:
            
            CellIdentifier = @"GenericCell";
            BoardGameGenericCell *genericCell = (BoardGameGenericCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (genericCell == nil) 
            {
                genericCell = [[[BoardGameGenericCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            
            NSString* option = [_menuBasics objectAtIndex:([row intValue]-2)];
            
            [genericCell setMenuOption:option setBoardGame:_boardGame];
            
            return genericCell;
            
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView boardGameInDetail:(NSNumber *)row
{
    static NSString *CellIdentifier;
    switch ([row integerValue]) {
            
        default:
            CellIdentifier = @"GenericCell";
            BoardGameGenericCell *genericCell = (BoardGameGenericCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (genericCell == nil) 
            {
                genericCell = [[[BoardGameGenericCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            
            NSString* option = [_menuDetails objectAtIndex:[row intValue]];
            
            [genericCell setMenuOption:option setBoardGame:_boardGame];
            
            return genericCell;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) 
    {
        return [self tableView:tableView boardGameBasics:[NSNumber numberWithInt:indexPath.row]];
         
    }else if(indexPath.section == 1){
        
        return [self tableView:tableView boardGameInDetail:[NSNumber numberWithInt:indexPath.row]];
    }
    
    return NULL;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat rowSize;
    if(indexPath.section == 0){
        
        switch (indexPath.row) {
            case 0:
                //headerCell size
                rowSize = 140;
                return rowSize;
                break;
            case 1:
                //ratingCell size
                rowSize = 60;
                return rowSize;
                break;
            default:
                //genericCell size
                rowSize = 60;
                return rowSize;
                break;
        } 
    } else {
        return 60;
    }
        return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController* controller;
    switch (indexPath.row) {
        case 1:     //Ratings/Comments
            
            controller = [[[BoardGameCommentsController alloc] init] autorelease];
            
            //TODO: should be rating and comment information. Not in DB yet.
            [(BoardGameCommentsController*)controller setBoardGame:_boardGame];
            
            [[[Globals sharedGlobals] breadcrumb] addViewController:controller animated:YES];
            
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

@end
