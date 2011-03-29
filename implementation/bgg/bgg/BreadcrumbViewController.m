//
//  BreadcrumbViewController.m
//  BGG
//
//  Created by João Caxaria on 2/28/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BreadcrumbViewController.h"
#import "CustomSegmentedControl.h"

@interface BreadcrumbViewController (Private)<CustomSegmentedControlDelegate,UIScrollViewDelegate>

-(void) updateUITo:(int) newIndex animated:(BOOL) animated;

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
	cSegmentedControl = [[[CustomSegmentedControl alloc] initWithSegmentCount:[viewControllers count] 
																							 delegate:self] autorelease];
	[cSegmentedControl setPadding:-9 :0];
	[cSegmentedControl generateButtons];
	[scrollView setDelegate:self];
	[scrollView addSubview:cSegmentedControl];
	[scrollView setContentSize:[cSegmentedControl frame].size];
	[self scrollViewDidScroll:scrollView];
	selectedIndex = -1;
	
	UISwipeGestureRecognizer* swipeGesture = [[[UISwipeGestureRecognizer alloc] initWithTarget:self 
																						action:@selector(swipeLeftDone:)] autorelease];
	swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
	[contentView addGestureRecognizer:swipeGesture];
	swipeGesture = [[[UISwipeGestureRecognizer alloc] initWithTarget:self 
															  action:@selector(swipeRightDone:)] autorelease];
	swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
	[contentView addGestureRecognizer:swipeGesture];
}

-(void) setViewControllers:(NSArray*) mViewControllers
{
	viewControllers = [mViewControllers retain];
}


- (void)dealloc {
	[viewControllers release];
    [super dealloc];
}

#pragma mark events

-(void) swipeLeftDone:(UISwipeGestureRecognizer *)sender
{
	int targetView = selectedIndex+1;
	
	if(targetView < 0 || targetView >= [viewControllers count])
		return;
	[self updateUITo:targetView animated:YES];
}
-(void) swipeRightDone:(UISwipeGestureRecognizer *)sender
{
	int targetView = selectedIndex-1;
	
	if(targetView < 0 || targetView >= [viewControllers count])
		return;
	[self updateUITo:targetView animated:YES];
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	[self updateUITo:selectedIndex >= 0 ? selectedIndex : 0 animated:NO];
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


#pragma mark CustomSegmentedControlDelegate

- (UIButton*) buttonFor:(CustomSegmentedControl*)segmentedControl atIndex:(NSUInteger)segmentIndex
{
	UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
	UIViewController* currentController = [viewControllers objectAtIndex:segmentIndex];
		
	button.frame = CGRectMake(0.0, 0.0, 99, 50);
	
	[button setBackgroundImage:[UIImage imageNamed:@"segmented_header.png"] forState:UIControlStateNormal];
	[button setBackgroundImage:[UIImage imageNamed:@"segmented_header_selected.png"] forState:UIControlStateHighlighted];
	[button setBackgroundImage:[UIImage imageNamed:@"segmented_header_selected.png"] forState:UIControlStateSelected];
	
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

- (void) touchUpInsideSegmentIndex:(CustomSegmentedControl*)segmentedControl:(NSUInteger)segmentIndex
{
	[self updateUITo:segmentIndex animated:YES];
}

#pragma mark Private

-(void) updateUITo:(int) newIndex animated:(BOOL) animated
{
	ICAssert(newIndex >= 0 && newIndex < [viewControllers count], @"Invalid index on segmented header control");
	if(newIndex == selectedIndex)
		return;
	
	UIViewController* currentController = nil;
	if(selectedIndex >= 0)
	{
		currentController = [viewControllers objectAtIndex:selectedIndex];
	}
	
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
		[animation setSubtype:selectedIndex < newIndex? kCATransitionFromRight : kCATransitionFromLeft];
		[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
		
		[[theWindow layer] addAnimation:animation forKey:@"SwitchToView"];
		/*End Animation*/
	}
	[[currentController view] removeFromSuperview];
	[contentView addSubview:[newController view]];
	
	[currentController viewDidDisappear:NO];
	[newController viewDidAppear:NO];
	
	selectedIndex = newIndex;
	[cSegmentedControl selectButton:selectedIndex];
	[scrollView scrollRectToVisible:[[[cSegmentedControl buttons] objectAtIndex:selectedIndex] frame]  animated:YES];
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)mscrollView
{
	[scrollLeft setHighlighted:[mscrollView contentOffset].x > 0];
	[scrollRight setHighlighted:[mscrollView contentSize].width-[mscrollView contentOffset].x > [mscrollView frame].size.width ];
}

@end
