//
//  bggViewController.m
//  bgg
//
//  Created by João Caxaria on 3/28/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BGGViewController.h"

@interface BGGViewController (Private) <TTLauncherViewDelegate>

@end

@implementation BGGViewController

-(id) init
{
	self = [super init];
	
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	
	return self;
}

- (void)dealloc {
	[super dealloc];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// UIViewController

- (void)loadView {
	[super loadView];
	
	_launcherView = [[TTLauncherView alloc] initWithFrame:self.view.bounds];
	
	_launcherView.backgroundColor = [UIColor blackColor];
	_launcherView.delegate = self;
	_launcherView.columnCount = 4;
	_launcherView.pages = [NSArray arrayWithObjects:
						   [NSArray arrayWithObjects:
							[[[TTLauncherItem alloc] initWithTitle:@"Button 1"
															 image:@"bundle://Icon.png"
															   URL:nil canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Button 2"
															 image:@"bundle://Icon.png"
															   URL:nil canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Button 3"
															 image:@"bundle://Icon.png"
															   URL:@"fb://item3" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Button 4"
															 image:@"bundle://Icon.png"
															   URL:@"fb://item4" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Button 5"
															 image:@"bundle://Icon.png"
															   URL:@"fb://item5" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Button 6"
															 image:@"bundle://Icon.png"
															   URL:@"fb://item6" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Button 7"
															 image:@"bundle://Icon.png"
															   URL:@"fb://item7" canDelete:YES] autorelease],
							nil],
						   [NSArray arrayWithObjects:
							[[[TTLauncherItem alloc] initWithTitle:@"Button 8"
															 image:@"bundle://Icon.png"
															   URL:nil canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Button 9"
															 image:@"bundle://Icon.png"
															   URL:nil canDelete:YES] autorelease],
							nil],
						   nil
						   ];
	[self.view addSubview:_launcherView];
	
	TTLauncherItem* item = [_launcherView itemWithURL:@"fb://item3"];
	item.badgeNumber = 4;
	
	item = [_launcherView itemWithURL:@"fb://item4"];
	item.badgeNumber = 0;
	
	item = [_launcherView itemWithURL:@"fb://item5"];
	item.badgeValue = @"100!";
	
	item = [_launcherView itemWithURL:@"fb://item6"];
	item.badgeValue = @"Off";
	
	item = [_launcherView itemWithURL:@"fb://item7"];
	item.badgeNumber = 300;
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
