//
//  DBBoardGame+Images.h
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBBoardGame.h"

@class BGGBoardGameLookup;
@class BGGBoardGame;

@interface DBBoardGame (Extras)

-(bool) hasPreviewImage;
-(UIImage*) previewImage;
-(bool) hasMainImage;
-(UIImage*) mainImage;

-(void) updateFromBGG:(BGGBoardGame*) bggBoardGame;
-(void) updateFromBGGLookup:(BGGBoardGameLookup*) bggBoardGame;

@end

@interface DBBoardGame (CoreData)
- (void)addCategoriesObject:(DBCategory *)value;
- (void)removeCategoriesObject:(DBCategory *)value;
- (void)addCategories:(NSSet *)value;
- (void)removeCategories:(NSSet *)value;

- (void)addVideosObject:(DBVideos *)value;
- (void)removeVideosObject:(DBVideos *)value;
- (void)addVideos:(NSSet *)value;
- (void)removeVideos:(NSSet *)value;

- (void)addPublishersObject:(DBPublisher *)value;
- (void)removePublishersObject:(DBPublisher *)value;
- (void)addPublishers:(NSSet *)value;
- (void)removePublishers:(NSSet *)value;

- (void)addArtistsObject:(DBPerson *)value;
- (void)removeArtistsObject:(DBPerson *)value;
- (void)addArtists:(NSSet *)value;
- (void)removeArtists:(NSSet *)value;

- (void)addMechanicsObject:(DBMechanic *)value;
- (void)removeMechanicsObject:(DBMechanic *)value;
- (void)addMechanics:(NSSet *)value;
- (void)removeMechanics:(NSSet *)value;

- (void)addDesignersObject:(DBPerson *)value;
- (void)removeDesignersObject:(DBPerson *)value;
- (void)addDesigners:(NSSet *)value;
- (void)removeDesigners:(NSSet *)value;

@end