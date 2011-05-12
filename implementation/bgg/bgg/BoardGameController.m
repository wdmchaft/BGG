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

@implementation BoardGameController

@synthesize boardGame = _boardGame;

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
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:_boardGame.primaryTitle];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
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
            rowSize = 60;
            return rowSize;
            break;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     
    static NSString *CellIdentifier;
    switch (indexPath.row) {
        case 0:
            CellIdentifier = @"TableHeader";
            BoardGameHeaderCell *cell = (BoardGameHeaderCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) 
            {
                cell = [[[BoardGameHeaderCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            
            [cell setBoardGame:_boardGame];
            
            return cell;
            break;
        case 1:
            CellIdentifier = @"TableRating";
            BoardGameRatingCell *cellNew = (BoardGameRatingCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cellNew == nil) 
            {
                cellNew = [[[BoardGameRatingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            
            [cellNew setBoardGame:_boardGame];
            
            return cellNew;
            break;
        default:
            CellIdentifier = @"TableRating";
            cellNew = (BoardGameRatingCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cellNew == nil) 
            {
                cellNew = [[[BoardGameRatingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
            }
            
            [cellNew setBoardGame:_boardGame];
            
            return cellNew;

            break;
    }
}


@end
