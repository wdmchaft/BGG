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

@implementation BoardGameController

@synthesize boardGame = _boardGame;

@synthesize menuOptions = _menuOptions;

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
        
        self.menuOptions = [NSArray arrayWithObjects: @"Forums", @"Comments", @"Videos", nil];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    switch (indexPath.row) {
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
            
            NSString* option = [_menuOptions objectAtIndex:([indexPath indexAtPosition:1])-2];
            
            [genericCell setMenuOption:option setBoardGame:_boardGame];
            
            return genericCell;

            break;
    }
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat rowSize;
    switch (indexPath.row) {
        case 0:
            //headerCell size
            rowSize = 151;
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
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController* controller;
    switch (indexPath.row) {
        case 3:     
            
            controller = [[[BoardGameForumsController alloc] init] autorelease];
            
            [(BoardGameForumsController*)controller setBoardGame:_boardGame];
            
            [[[Globals sharedGlobals] breadcrumb] addViewController:controller animated:YES];

            break;
            
        default:
            break;
    }
    
}

@end
