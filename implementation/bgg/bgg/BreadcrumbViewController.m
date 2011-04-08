//
//  BreadcrumbViewController.m
//  BGG
//
//  Created by João Caxaria on 2/28/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BreadcrumbViewController.h"
#import "StackSegmentedControl.h"

@interface BreadcrumbViewController (Private)<StackSegmentedControlDelegate,UIScrollViewDelegate>

-(void) updateUIFrom:(int) oldIndex to:(int) newIndex animated:(BOOL) animated;

@end

@implementation BreadcrumbViewController

-(id) init
{
	self = [self initWithNibName:@"BreadcrumbView" bundle:nil];
	
	return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	cSegmentedControl = [[[StackSegmentedControl alloc] initWithSegmentDelegate:self] autorelease];
	[cSegmentedControl setPadding:-9 :0];
	[scrollView setDelegate:self];
	[scrollView addSubview:cSegmentedControl];
	
	viewControllers = [[NSMutableArray alloc] initWithCapacity:1];
	
	UISwipeGestureRecognizer* swipeGesture = [[[UISwipeGestureRecognizer alloc] initWithTarget:self 
																						action:@selector(swipeLeftDone:)] autorelease];
	swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
	[contentView addGestureRecognizer:swipeGesture];
}

-(void) addViewController:(UIViewController*) mViewController;
{
	CGRect frame = contentView.frame;
	frame.origin.x = 0;
	frame.origin.y = 0;
	[mViewController.view setFrame:frame];
	[viewControllers insertObject:mViewController atIndex:[viewControllers count]];
	[cSegmentedControl generateButtons];
	[cSegmentedControl selectButton:[[cSegmentedControl buttons] count] -1];
	[scrollView setContentSize:[cSegmentedControl frame].size];
	[scrollView scrollRectToVisible:[[[cSegmentedControl buttons] objectAtIndex:[[cSegmentedControl buttons] count]-1] frame]  animated:YES];
}


- (void)dealloc {
	[viewControllers release];
    [super dealloc];
}

#pragma mark events

-(void) swipeLeftDone:(UISwipeGestureRecognizer *)sender
{
	if([viewControllers count] == 1)
		return;
	[self updateUIFrom:[viewControllers count]-1 to:[viewControllers count]-2 animated:NO];
}

#pragma mark - View lifecycle

-(void) viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	[self updateUIFrom:-1 to:[viewControllers count]-1 animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark CustomSegmentedControlDelegate

- (UIButton*) buttonFor:(StackSegmentedControl*)segmentedControl atIndex:(NSUInteger)segmentIndex
{
	UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
	UIViewController* currentController = [viewControllers objectAtIndex:segmentIndex];
		
	if(segmentIndex == 0)
	{
		button.frame = CGRectMake(0.0, 0.0, 116, 61);
		
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-home.png"] forState:UIControlStateNormal];
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-home-selected.png"] forState:UIControlStateHighlighted];
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-home-selected.png"] forState:UIControlStateSelected];
	}
	else
	{
		button.frame = CGRectMake(0.0, 0.0, 118, 61);
		
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-step.png"] forState:UIControlStateNormal];
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-step-selected.png"] forState:UIControlStateHighlighted];
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-step-selected.png"] forState:UIControlStateSelected];
	}
	
	button.tag = segmentIndex;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	[[button titleLabel] setLineBreakMode:UILineBreakModeWordWrap];
	[[button titleLabel] setNumberOfLines:2];
	[[button titleLabel] setTextAlignment:UITextAlignmentCenter];
	[[button titleLabel] setFont:[UIFont fontWithName: @"ITCAvantGardeStd-Md" size: 10.0]];
	[button setTitle:currentController.title forState:UIControlStateNormal];

	button.adjustsImageWhenHighlighted = NO;
	
	return button;
}

- (void) touchUpInsideSegmentIndex:(StackSegmentedControl*)segmentedControl:(NSUInteger)segmentIndex
{
	[self updateUIFrom:[viewControllers count]-1 to:segmentIndex animated:YES];
}

- (NSUInteger) segmentCount
{
	return [viewControllers count];
}


#pragma mark Private

-(void) updateUIFrom:(int) oldIndex to:(int) newIndex animated:(BOOL) animated
{
	ICAssert(newIndex >= 0 && newIndex < [viewControllers count], @"Invalid index on segmented header control");
	if(oldIndex != -1 && newIndex == [viewControllers count]-1)
		return;
	
	UIViewController* currentController = nil;
	if(oldIndex >= 0)
		currentController = [viewControllers objectAtIndex:oldIndex];
	
	UIViewController* newController = [viewControllers objectAtIndex:newIndex];
	
	[currentController viewWillDisappear:NO];
	[newController viewWillAppear:NO];
	
	
	if(animated)
	{
		/*Start Animation*/
		UIView *theWindow = contentView;
		CATransition *animation = [CATransition animation];
		[animation setDuration:0.5];
		[animation setType:kCATransitionPush];
		[animation setSubtype:oldIndex < newIndex? kCATransitionFromRight : kCATransitionFromLeft];
		[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
		
		[[theWindow layer] addAnimation:animation forKey:@"SwitchToView"];
		/*End Animation*/
	}
	[[currentController view] removeFromSuperview];
	[contentView addSubview:[newController view]];
	
	[currentController viewDidDisappear:NO];
	[newController viewDidAppear:NO];
	
	[cSegmentedControl selectButton:newIndex];
	[scrollView scrollRectToVisible:[[[cSegmentedControl buttons] objectAtIndex:newIndex] frame]  animated:YES];
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)mscrollView
{
}

@end
