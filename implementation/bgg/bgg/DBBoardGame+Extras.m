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
#import "BGGIdNameLookup.h"
#import "BGGBoardGameVideo.h"

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
    self.rating = bggBoardGame.rating;
    self.ratingCount = bggBoardGame.ratingCount;

    for(BGGIdNameLookup* bggObj in bggBoardGame.categories)
    {
        DBCategory* dbObj = [[[Globals sharedGlobals] dataAccess] getCreateCategory:bggObj.id];
        [dbObj updateFromBGGLookup:bggObj];
        [dbObj addBoardGamesObject:self];
        [self addCategoriesObject:dbObj];
    }
    
    for(BGGIdNameLookup* bggObj in bggBoardGame.publishers)
    {
        DBPublisher* dbObj = [[[Globals sharedGlobals] dataAccess] getCreatePublisher:bggObj.id];
        [dbObj updateFromBGGLookup:bggObj];
        [dbObj addBoardGamesObject:self];
        [self addPublishersObject:dbObj];
    }
    
    for(BGGIdNameLookup* bggObj in bggBoardGame.mechanics)
    {
        DBMechanic* dbObj = [[[Globals sharedGlobals] dataAccess] getCreateMechanic:bggObj.id];
        [dbObj updateFromBGGLookup:bggObj];
        [dbObj addBoardGamesObject:self];
        [self addMechanicsObject:dbObj];
    }
    
    for(BGGIdNameLookup* bggObj in bggBoardGame.designers)
    {
        DBPerson* dbObj = [[[Globals sharedGlobals] dataAccess] getCreatePerson:bggObj.id];
        [dbObj updateFromBGGLookup:bggObj];
        [dbObj addBoardGamesDesignerObject:self];
        [self addDesignersObject:dbObj];
    }
    
    for(BGGIdNameLookup* bggObj in bggBoardGame.artists)
    {
        DBPerson* dbObj = [[[Globals sharedGlobals] dataAccess] getCreatePerson:bggObj.id];
        [dbObj updateFromBGGLookup:bggObj];
        [dbObj addBoardGamesArtistObject:self];
        [self addArtistsObject:dbObj];
    }
    
    for(BGGBoardGameVideo* video in bggBoardGame.videos)
    {
        DBVideos* dbvideo = [[[Globals sharedGlobals] dataAccess] getCreateVideo:video.id];
        [dbvideo updateFromBGGVideo:video];
        
        DBPerson* owner = [[[Globals sharedGlobals] dataAccess] getCreatePerson:video.userId];
        owner.id = video.userId;
        owner.name = video.userName;
        
        dbvideo.user = owner;
        dbvideo.boardGames = self;
        
        [owner addVideosObject:dbvideo];
        [self addVideosObject:dbvideo];
    }
    
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
