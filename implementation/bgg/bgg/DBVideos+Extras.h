//
//  BDVideos+Extras.h
//  bgg
//
//  Created by João Caxaria on 5/12/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBVideos.h"
#import "BGGBoardGameVideo.h"

@interface DBVideos (Extras)

-(void) updateFromBGGVideo:(BGGBoardGameVideo*) bggVideo;

@end
