//
//  BDVideos+Extras.m
//  bgg
//
//  Created by João Caxaria on 5/12/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DBVideos+Extras.h"


@implementation DBVideos (Extras)

-(void) updateFromBGGVideo:(BGGBoardGameVideo*) bggVideo
{
    self.id = bggVideo.id;
    self.title = bggVideo.title;
    self.category = bggVideo.category;
    self.language = bggVideo.language;
    self.link = bggVideo.link;
    
    self.postdate = [NSDate date]; 
}

@end
