//
//  DataAccess+BoardGame.h
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBPublisher.h"

@interface DataAccess (Publisher)

-(DBPublisher*) getCreatePublisher:(NSString*) cId;
-(DBPublisher*) createPublisher;
-(DBPublisher*) getPublisherById:(NSString*) cId;

@end
