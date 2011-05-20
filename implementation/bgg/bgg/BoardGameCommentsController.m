//
//  BoardGameCommentsController.m
//  bgg
//
//  Created by Ana Oliveira on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameCommentsController.h"
#import "BGGBoardGameRating.h"
#import "BoardGameCommentCell.h"
#import "PersonRemoteConnector.h"
#import "MyProfileViewController.h"

@implementation BoardGameCommentsController

- (id)init
{
    self = [self initWithNibName:@"BoardGameCommentsController" bundle:nil];
    
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

-(void) setRatings:(NSArray*) ratings
{
    _ratings = [ratings retain];
    [self.tableView reloadData];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self setTitle:@"Ratings"];
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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(_ratings != nil)
        return [_ratings count];
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    
    //if(indexPath.section == 0){
        CellIdentifier = @"CommentCell";
        
        BoardGameCommentCell *cell = (BoardGameCommentCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[BoardGameCommentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        }
        
    BGGBoardGameRating* rating = [_ratings objectAtIndex:indexPath.section];
        
    [cell setRating:rating];
        
        return cell;
   // }else {
   //     return NULL;
   // }
}

#pragma mark - Table Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    BGGBoardGameRating* rating = [_ratings objectAtIndex:indexPath.section];

    CGFloat cellHeight = [BoardGameCommentCell calculateCellHeight:rating]; 
    
    return cellHeight;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[Globals sharedGlobals] showHUDWithMessage:@"Loading user..."];
    BGGBoardGameRating* rating = [_ratings objectAtIndex:indexPath.section];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(gotUserDetails:) 
                                                 name:[[[Globals sharedGlobals] remoteConnector] getUserDetails:rating.username]
                                               object:nil];
}

#pragma mark Private

-(void) gotUserDetails:(NSNotification*) notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:[[notification object] objectForKey:@"key"] object:nil];
	
	BGGPerson * person = [[notification object] objectForKey:@"data"];
    
    DBPerson* dbPerson = [[[Globals sharedGlobals] dataAccess] getCreatePersonById:person.id];
    [dbPerson updateFromBGGPerson:person];
    [[[Globals sharedGlobals] dataAccess] saveChanges];
    
    [[Globals sharedGlobals] closeHUD];
    
    MyProfileViewController* controller = [[[MyProfileViewController alloc] init] autorelease];
    
    [controller setCurrentProfile: dbPerson];
    [[[Globals sharedGlobals] breadcrumb] addViewController:controller animated:YES];
}
   

@end
