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

@interface DBPerson (Extras)

-(void) updateFromBGGLookup:(BGGIdNameLookup*) bggLookup;

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

@end