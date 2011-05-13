//
//  GamesRemoteConnector.h
//  bgg
//
//  Created by João Caxaria on 4/19/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteConnector.h"

@interface RemoteConnector (Games)

-(NSString*) getTop100;

-(NSString*) getGameDetails:(NSString*) gameId;

-(NSString*) getGameDetails:(NSString*) gameId :(int) pageNumber;
@end
