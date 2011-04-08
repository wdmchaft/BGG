//
//  HomeViewController.m
//  bgg
//
//  Created by João Caxaria on 4/6/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController (Private) <TTLauncherViewDelegate>

@end

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

- (void)launcherView:(TTLauncherView*)launcher didSelectItem:(TTLauncherItem*)item
{
	
}

#pragma mark - View lifecycle
///////////////////////////////////////////////////////////////////////////////////////////////////
// UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];	
			
		_launcherView = [[TTLauncherView alloc] initWithFrame:CGRectMake(0,0,320, 402)];
		
		[[self view] addSubview:_launcherView];
		
		_launcherView.backgroundColor = [UIColor blackColor];
		_launcherView.delegate = self;
		_launcherView.columnCount = 3;

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
	
	//[mainView addViewController:controller];
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
