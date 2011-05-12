//
//  DataAccess+Videos.h
//  bgg
//
//  Created by João Caxaria on 5/12/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataAccess (Videos)

-(DBVideos*) getCreateVideo:(NSString*) cId;
-(DBVideos*) createVideo;
-(DBVideos*) getVideoById:(NSString*) cId;

@end
