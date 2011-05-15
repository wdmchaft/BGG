//
//  Globals.m
//  vigia-2-0
//
//  Created by João Caxaria on 3/9/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "Globals.h"
#import "BGGAppDelegate.h"
#import "BreadcrumbViewController.h"
#import "SSHUDView.h"

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
	dataAccess = [[DataAccess alloc] init];
    
	remoteConnector = [[RemoteConnector alloc] init];
	return self;
}

#pragma mark properties

@synthesize dataAccess;
@synthesize remoteConnector;
@synthesize breadcrumb;

-(NSString*) bggUsername
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"bggUsername"];
}

-(void) setBggUsername:(NSString *)bggUsername
{
    [[NSUserDefaults standardUserDefaults] setObject:bggUsername forKey:@"bggUsername"];
}


#pragma mark methods

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

#pragma mark HUD

-(void) showHUDWithMessage:(NSString*) message
{
    if(_hud == nil)
    {
        _hud = [[SSHUDView alloc] initWithTitle:@"Loading game..."];
    }
    else
    {
        _hud.textLabel.text = message;
    }
    
    [_hud show];
}

-(void) closeHUD
{
    if(_hud == nil) 
        return;
    
    [_hud dismiss];
    [_hud release];
    _hud = nil;
}

@end
