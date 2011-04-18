//
//  HomeViewController.m
//  bgg
//
//  Created by João Caxaria on 4/6/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "HomeViewController.h"
#import "Globals.h"

@implementation HomeViewController

-(id) init
{
	self = [self initWithNibName:@"HomeViewController" bundle:nil];
	
	[self setTitle:@"Home"];
	
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
///////////////////////////////////////////////////////////////////////////////////////////////////
// UIViewController

-(void) clicked:(id) sender
{
	HomeViewController* newController = [[[HomeViewController alloc] init] autorelease];
	[[[Globals sharedGlobals] breadcrumb] addViewController:newController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];	
			
	UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setFrame:CGRectMake(10, 10, 100, 100)];
	float r = arc4random() % 256 / 256.0;
	float g = arc4random() % 256 / 256.0;
	float b = arc4random() % 256 / 256.0;
	[button setBackgroundColor:[UIColor colorWithRed:r green:g blue:b alpha:1.0]];
	[button addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
    
    SSCollectionViewController* viewController = [[[SSCollectionViewController alloc] init] autorelease];
    
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

@end
