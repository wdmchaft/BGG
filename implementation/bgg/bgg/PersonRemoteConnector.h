//
//  PersonRemoteConnector.h
//  bgg
//
//  Created by João Caxaria on 5/17/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteConnector.h"

@interface RemoteConnector (Person)

-(NSString*) getUserDetails:(NSString*) username;

-(NSString*) getUserOwnedCollection:(NSString*) username;
-(NSString*) getUserPlayedCollection:(NSString*) username;
-(NSString*) getUserWishlistCollection:(NSString*) username;

@end
