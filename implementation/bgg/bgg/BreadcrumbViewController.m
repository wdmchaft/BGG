//
//  BreadcrumbViewController.m
//  BGG
//
//  Created by João Caxaria on 2/28/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BreadcrumbViewController.h"
#import "StackSegmentedControl.h"
#import "IBreadcrumbMenuDelegate.h"
#import "IBreadcrumbController.h"

#define BREADCRUMB_FOOTER_CONTROL_SIZE 60
#define BREADCRUMB_FOOTER_VIEW_SIZE 36

@interface BreadcrumbViewController (Private)<StackSegmentedControlDelegate,UIScrollViewDelegate>

-(void) updateUIFrom:(int) oldIndex to:(int) newIndex animated:(BOOL) animated;
-(void) showFooter;
-(void) hideFooter;
-(UIView*) getEmptyMenu;

@end

@implementation BreadcrumbViewController

@synthesize popoverController;

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
	[cSegmentedControl setPadding:-16 :0];
	[scrollView setDelegate:self];
	[scrollView addSubview:cSegmentedControl];
	
	viewControllers = [[NSMutableArray alloc] initWithCapacity:1];
	
	UISwipeGestureRecognizer* swipeGesture = [[[UISwipeGestureRecognizer alloc] 
                                               initWithTarget:self 
                                               action:@selector(swipeLeftDone:)] autorelease];
	swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
	[contentView addGestureRecognizer:swipeGesture];
    
    [footerButton addTarget:self action:@selector(popupClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) addViewController:(UIViewController*) mViewController animated:(BOOL) animated
{
	CGRect frame = contentView.frame;
	frame.origin.x = 0;
	frame.origin.y = 0;
	//[mViewController.view setFrame:frame];
	[viewControllers insertObject:mViewController atIndex:[viewControllers count]];
	
    
    [self updateUIFrom:[viewControllers count]-2 to:[viewControllers count]-1 animated:animated];
    
    
    [cSegmentedControl generateButtons];
    [cSegmentedControl selectButton:[[cSegmentedControl buttons] count] -1];
    CGSize size = [scrollView frame].size;
	size.width = [cSegmentedControl frame].size.width;
	[scrollView setContentSize:size];
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
    
    [self updateUIFrom:[viewControllers count]-1 to:[viewControllers count]-2 animated:YES];
    
    [viewControllers removeLastObject];
    [cSegmentedControl generateButtons];
	
    [cSegmentedControl selectButton:[viewControllers count]-1];
	[scrollView scrollRectToVisible:[[[cSegmentedControl buttons] objectAtIndex:[viewControllers count]-1] frame] animated:YES];
}


-(void) dismissPopup
{
    if (self.popoverController) {
		[self.popoverController dismissPopoverAnimated:YES];
        [invisibleButton removeFromSuperview];
		self.popoverController = nil;
	}
}

-(void) popupClicked:(UIButton*) sender
{
    if (self.popoverController) {
		[self dismissPopup];
	} else {
        
        invisibleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [invisibleButton setFrame:[[UIScreen mainScreen] bounds]];
        [invisibleButton setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3]];
        [invisibleButton addTarget:self action:@selector(invisibleDismissPopup:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:invisibleButton];
        
        UIViewController* currentController = [viewControllers objectAtIndex:[viewControllers count]-1];
        
        ICAssert([currentController conformsToProtocol:@protocol(IBreadcrumbMenuDelegate)], @"controller must be IBreadcrumbMenu for button to be visible");
        
        UIView* popupView = [(id<IBreadcrumbMenuDelegate>)currentController menuClicked];
        
        if(popupView == nil)
            popupView = [self getEmptyMenu];
        
        ICAssert(popupView != nil, @"popup view should be enabled... or should it?");
        
        UIViewController* controller = [[[UIViewController alloc] init] autorelease];
        controller.view = popupView;
        
        controller.contentSizeForViewInPopover = popupView.frame.size;
        
		self.popoverController = [[[WEPopoverController alloc] initWithContentViewController:controller] autorelease];
        [self.popoverController presentPopoverFromRect:CGRectOffset(sender.frame, 0, 400.0)
												inView:self.view
							  permittedArrowDirections:UIPopoverArrowDirectionDown
											  animated:YES];
	}
}

-(void) invisibleDismissPopup:(UIButton*) sender
{
    [self popupClicked:nil];
}

#pragma mark - View lifecycle

-(void) viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
		button.frame = CGRectMake(0.0, 0.0, 116, 41);
		
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-home.png"] forState:UIControlStateNormal];
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-home-selected.png"] forState:UIControlStateHighlighted];
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-home-selected.png"] forState:UIControlStateSelected];
	}
	else
	{
		button.frame = CGRectMake(0.0, 0.0, 118, 41);
		
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-step.png"] forState:UIControlStateNormal];
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-step-selected.png"] forState:UIControlStateHighlighted];
		[button setBackgroundImage:[UIImage imageNamed:@"breadcrumb-step-selected.png"] forState:UIControlStateSelected];
	}
	
	button.tag = segmentIndex;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [button setTitleEdgeInsets:UIEdgeInsetsMake(-3, 8, 3, 7)];
	[[button titleLabel] setLineBreakMode:UILineBreakModeTailTruncation];
	[[button titleLabel] setNumberOfLines:1];
	[[button titleLabel] setTextAlignment:UITextAlignmentCenter];
	[[button titleLabel] setFont:[UIFont fontWithName: @"ITCAvantGardeStd-Md" size: 10.0]];
	[button setTitle:currentController.title forState:UIControlStateNormal];
	[[button titleLabel] setAdjustsFontSizeToFitWidth:NO];
	button.adjustsImageWhenHighlighted = NO;
	
	return button;
}

- (void) touchUpInsideSegmentIndex:(StackSegmentedControl*)segmentedControl:(NSUInteger)segmentIndex
{
    if([viewControllers count]-1 == segmentIndex)
        return;
	[self updateUIFrom:[viewControllers count]-1 to:segmentIndex animated:YES];

	while([viewControllers count] > segmentIndex + 1)
	{
		[viewControllers removeLastObject];
	}
	[cSegmentedControl generateButtons];
	[cSegmentedControl selectButton:segmentIndex];
}

- (NSUInteger) segmentCount
{
	return [viewControllers count];
}


#pragma mark Private

-(void) updateUIFrom:(int) oldIndex to:(int) newIndex animated:(BOOL) animated
{
    if(oldIndex == newIndex) 
        return;
	ICAssert(newIndex >= 0 && newIndex < [viewControllers count], @"Invalid index on segmented header control");
		
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
    
    if([currentController conformsToProtocol:@protocol(IBreadcrumbMenuDelegate)])
    {
        [(id<IBreadcrumbMenuDelegate>)currentController breadcrumbWillDisappear:self];
    }
    
    [self setStatusMessage:@""];
    [rightStatusLabel setText:@""];
    
	[[currentController view] removeFromSuperview];
    
    if([newController conformsToProtocol:@protocol(IBreadcrumbMenuDelegate)])
    {
        [(id<IBreadcrumbMenuDelegate>)newController breadcrumbWillAppear:self];
        [self showFooter];
    }
    else
    {
        [self hideFooter];
    }
    
    [[newController view] setFrame:CGRectMake(0, 0, contentView.frame.size.width, contentView.frame.size.height) ];
    [contentView addSubview:[newController view]];
	[contentView layoutSubviews];
    
	[currentController viewDidDisappear:NO];
	[newController viewDidAppear:NO];

    
	
}

-(void) showFooter
{
    if(![footerView isHidden])
        return;
    
    [UIView animateWithDuration:0.5 animations:^{
		footerView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, -BREADCRUMB_FOOTER_CONTROL_SIZE);
        [footerView setHidden:NO];
        [contentView setFrame:CGRectMake(contentView.frame.origin.x, 
                                          contentView.frame.origin.y, 
                                          contentView.frame.size.width, 
                                          contentView.frame.size.height-BREADCRUMB_FOOTER_VIEW_SIZE)]; 
    
    } completion:^(BOOL finished) {
		
	}];
    

}

-(void) hideFooter
{
    if([footerView isHidden])
        return;
    
    [UIView animateWithDuration:0.5 animations:^{
        footerView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, BREADCRUMB_FOOTER_CONTROL_SIZE);
        [contentView setFrame:CGRectMake(contentView.frame.origin.x, 
                                          contentView.frame.origin.y, 
                                          contentView.frame.size.width, 
                                          contentView.frame.size.height+BREADCRUMB_FOOTER_VIEW_SIZE)];
    } completion:^(BOOL finished) {
        [footerView setHidden:YES];
    }];
    
}

-(UIView*)getEmptyMenu
{
    UIView* result = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 230, 110)] autorelease];
    [result setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"popup-back-small.png"]]];
    
    UILabel* label = [[[UILabel alloc] init] autorelease];
    [label setText:@"No options available"];
    [result addSubview:label];
    [label setFrame:result.frame];
    [label setTextAlignment:UITextAlignmentCenter];
    [label setFont:[UIFont boldSystemFontOfSize:18]];
    [label setTextColor:[UIColor whiteColor]];
    [label setShadowColor:[UIColor blackColor]];
    [label setShadowOffset:CGSizeMake(0, 1)];
    [label setBackgroundColor:[UIColor clearColor]];
    
    return result;
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)mscrollView
{
}

#pragma mark IBreadcrumbController

-(void) setStatusMessage:(NSString*) message
{
    [leftStatusLabel setText:message];
}

-(void) setLoading
{
    [rightStatusLabel setText:@"Loading..."];
}

-(void) setUpdated
{
    [rightStatusLabel setText:@"Updated"];
}

@end
