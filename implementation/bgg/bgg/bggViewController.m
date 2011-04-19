//
//  bggViewController.m
//  bgg
//
//  Created by João Caxaria on 3/28/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BGGViewController.h"
#import "BreadcrumbViewController.h"
#import "HomeViewController.h"

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
	[breadcrumb release];
	[super dealloc];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)loadView {
	[super loadView];
	
	
	breadcrumb = [[[BreadcrumbViewController alloc] init] autorelease];
	[[breadcrumb view] setFrame:self.view.bounds];
	
	[[Globals sharedGlobals] setBreadcrumb:breadcrumb];
	
	
	HomeViewController* controller = [[HomeViewController alloc] init];	
	[breadcrumb addViewController:controller animated:NO];
	
	[self.view addSubview:breadcrumb.view];
	
    //[[[Globals sharedGlobals] remoteConnector] getTop100];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void) viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	[breadcrumb viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	[breadcrumb viewWillAppear:animated];
}


@end
