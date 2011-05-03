//
//  BoardGameListController.m
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameListController.h"
#import "DBBoardGame.h"
#import "BoardGameListCell.h"
#import "DataAccess+BoardGame.h"

@implementation BoardGameListController

@synthesize boardGames = _boardGames;

-(id) init
{
	self = [self initWithNibName:@"BoardGameListController" bundle:nil];
	[self setTitle:@"Board Games"];
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
    
    NSArray* products = [[[Globals sharedGlobals] dataAccess] getAllBoardGames];
    [self setBoardGames:products];
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

}

#pragma mark IBreadcrumbMenu

-(UIView*) menuClicked
{
    UIView* result = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 230, 110)] autorelease];
    [result setBackgroundColor:[UIColor redColor]];
    
    return result;
}

-(void) breadcrumbWillAppear:(id<IBreadcrumbController>) breadcrumb
{
    [breadcrumb setStatusMessage:@"Top 100"];
    [breadcrumb setUpdated];
}
-(void) breadcrumbWillDisappear:(id<IBreadcrumbController>) breadcrumb
{
    
}



@end
