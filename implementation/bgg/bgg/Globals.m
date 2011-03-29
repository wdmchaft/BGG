//
//  Globals.m
//  vigia-2-0
//
//  Created by João Caxaria on 3/9/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "Globals.h"
#import "BGGAppDelegate.h"
@implementation Globals

static Globals *sharedSingleton = nil;

#pragma mark -
#pragma mark Object Life Cycle

+ (Globals *)sharedGlobals {
	if(sharedSingleton == nil) {
		sharedSingleton = [[super allocWithZone:nil] init];
	}
	return sharedSingleton;
}

- (id)autorelease {
	return self;
}

-(id) init
{
	self = [super init];
	
	return self;
}

-(void) pushFrom:(UIViewController*) currentView toView:(UIViewController*) destinationView :(BOOL) back
{
	BGGAppDelegate *delegate = (BGGAppDelegate *)[UIApplication sharedApplication].delegate;
	
	
	UIWindow *theWindow = delegate.window;
	
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:back? kCATransitionFromLeft : kCATransitionFromRight];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	
	[[theWindow layer] addAnimation:animation forKey:@"SwitchToView"];
	
	[currentView.view setHidden:YES];
	[currentView.view removeFromSuperview];
	
	[destinationView.view setHidden:NO];
	[theWindow setRootViewController:destinationView];
    [theWindow addSubview:destinationView.view];

}

-(void) pushFrom:(UIViewController*) currentView toView:(UIViewController*) destinationView
{
	return [self pushFrom:currentView toView:destinationView :NO];
}

@end