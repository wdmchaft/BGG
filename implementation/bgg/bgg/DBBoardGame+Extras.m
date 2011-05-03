//
//  DBBoardGame+Images.m
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DBBoardGame+Extras.h"
#import "StorageHelper.h"
#import "BGGBoardGame.h"

@implementation DBBoardGame (Extras)


-(UIImage*) previewImage
{
    NSString* filenamePath = [NSString stringWithFormat:@"/%@/preview.png", self.gameId];
    
    UIImage* result = [UIImage imageWithContentsOfFile:[[StorageHelper baseStorageDirectory] stringByAppendingPathComponent:filenamePath]];

    return result;
}

-(void) updateFromBGG:(BGGBoardGame*) bggBoardGame
{
    self.gameId = bggBoardGame.gameId;
    self.primaryTitle = bggBoardGame.primaryTitle;
    self.rank = bggBoardGame.rank;
}

-(void) awakeFromInsert 
{
	[super awakeFromInsert];
	self.updated = [NSDate date];
}



@end
