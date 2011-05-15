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
#import "DataAccess+BoardGame.h"
#import "DataAccess+Category.h"
#import "DataAccess+Mechanic.h"
#import "DataAccess+Person.h"
#import "DataAccess+Publisher.h"
#import "DataAccess+Videos.h"

#import "RemoteConnector.h"
#import "GamesRemoteConnector.h"

@class SSHUDView;

@interface Globals : NSObject {
	DataAccess* dataAccess;
	RemoteConnector * remoteConnector;
	BreadcrumbViewController* breadcrumb;
    SSHUDView* _hud;
}

+(Globals *)sharedGlobals;


@property (readonly) DataAccess *dataAccess;
@property (readonly) RemoteConnector * remoteConnector;

@property (nonatomic, retain) BreadcrumbViewController* breadcrumb;
@property (nonatomic, assign) NSString* bggUsername;

-(void) pushFrom:(UIViewController*) currentView toView:(UIViewController*) destinationView;
-(void) pushFrom:(UIViewController*) currentView toView:(UIViewController*) destinationView :(BOOL) back;

-(void) showHUDWithMessage:(NSString*) message;
-(void) closeHUD;

@end
