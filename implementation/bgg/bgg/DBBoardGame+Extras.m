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
#import "BGGBoardGameLookup.h"

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
    self.gameDescription = bggBoardGame.gameDescription;
    self.maxPlayers = bggBoardGame.maxPlayers;
    self.minAge = bggBoardGame.minAge;
    self.minPlayers = bggBoardGame.minPlayers;
    self.playingTime = bggBoardGame.playingTime;
    self.yearPublished = bggBoardGame.yearPublished;
//   categories;
//   publishers;
//   videos;
//   mechanics;
//   designers;
//   artists;
    
    self.hasDetails = [NSNumber numberWithBool:YES];
	self.updated = [NSDate date];
}

-(void) updateFromBGGLookup:(BGGBoardGameLookup*) bggBoardGame
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
