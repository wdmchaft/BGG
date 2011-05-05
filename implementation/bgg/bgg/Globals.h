//
//  Globals.h
//  vigia-2-0
//
//  Created by João Caxaria on 3/9/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BreadcrumbViewController.h"
#import "DataAccess.h"

#import "RemoteConnector.h"
#import "GamesRemoteConnector.h"

@interface Globals : NSObject {
	DataAccess* dataAccess;
	RemoteConnector * remoteConnector;
	BreadcrumbViewController* breadcrumb;
}

+(Globals *)sharedGlobals;


@property (readonly) DataAccess *dataAccess;
@property (readonly) RemoteConnector * remoteConnector;

@property (nonatomic, retain) BreadcrumbViewController* breadcrumb;
@property (nonatomic, assign) NSString* bggUsername;

-(void) pushFrom:(UIViewController*) currentView toView:(UIViewController*) destinationView;
-(void) pushFrom:(UIViewController*) currentView toView:(UIViewController*) destinationView :(BOOL) back;

@end
