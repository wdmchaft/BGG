//
//  BoardGameForumsController.m
//  bgg
//
//  Created by Ana Oliveira on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameForumsController.h"


@implementation BoardGameForumsController

@synthesize boardGame = _boardGame;

-(id) init
{
	self = [self initWithNibName:@"BoardGameForumsController" bundle:nil];
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

-(void) setBoardGame:(DBBoardGame*) boardGame
{
    _boardGame = [boardGame retain];
}

@end
