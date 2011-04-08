//
//  Globals.h
//  vigia-2-0
//
//  Created by João Caxaria on 3/9/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BreadcrumbViewController.h"

@interface Globals : NSObject {
	
	BreadcrumbViewController* breadcrumb;
}

+(Globals *)sharedGlobals;


@property (nonatomic, retain) BreadcrumbViewController* breadcrumb;
-(void) pushFrom:(UIViewController*) currentView toView:(UIViewController*) destinationView;
-(void) pushFrom:(UIViewController*) currentView toView:(UIViewController*) destinationView :(BOOL) back;

@end
