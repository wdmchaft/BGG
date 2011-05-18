//
//  DBPerson+Extras.h
//  bgg
//
//  Created by João Caxaria on 5/10/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBPerson.h"
#import "BGGIdNameLookup.h"
#import "BGGPerson.h"

@interface DBPerson (Extras)

-(void) updateFromBGGLookup:(BGGIdNameLookup*) bggLookup;
-(void) updateFromBGGPerson:(BGGPerson*) bggPerson;
-(bool) needsUpdateOwnedGames;
-(bool) needsUpdatePlayedGames;
-(bool) needsUpdateWishedGames;

@end

@interface DBPerson (CoreData)

- (void)addBoardGamesDesignerObject:(DBBoardGame *)value;
- (void)removeBoardGamesDesignerObject:(DBBoardGame *)value;
- (void)addBoardGamesDesigner:(NSSet *)value;
- (void)removeBoardGamesDesigner:(NSSet *)value;

- (void)addBoardGamesArtistObject:(DBBoardGame *)value;
- (void)removeBoardGamesArtistObject:(DBBoardGame *)value;
- (void)addBoardGamesArtist:(NSSet *)value;
- (void)removeBoardGamesArtist:(NSSet *)value;

- (void)addVideosObject:(DBVideos *)value;
- (void)removeVideosObject:(DBVideos *)value;
- (void)addVideos:(NSSet *)value;
- (void)removeVideos:(NSSet *)value;

- (void)addOwnedGamesObject:(DBBoardGame *)value;
- (void)removeOwnedGamesObject:(DBBoardGame *)value;
- (void)addOwnedGames:(NSSet *)value;
- (void)removeOwnedGames:(NSSet *)value;

- (void)addPlayedGamesObject:(DBBoardGame *)value;
- (void)removePlayedGamesObject:(DBBoardGame *)value;
- (void)addPlayedGames:(NSSet *)value;
- (void)removePlayedGames:(NSSet *)value;

- (void)addWishedGamesObject:(DBBoardGame *)value;
- (void)removeWishedGamesObject:(DBBoardGame *)value;
- (void)addWishedGames:(NSSet *)value;
- (void)removeWishedGames:(NSSet *)value;

@end