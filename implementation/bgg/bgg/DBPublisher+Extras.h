//
//  DBPublisher+Extras.h
//  bgg
//
//  Created by João Caxaria on 5/10/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBPublisher.h"
#import "BGGIdNameLookup.h"

@interface DBPublisher (Extras)

-(void) updateFromBGGLookup:(BGGIdNameLookup*) bggLookup;

@end

@interface DBPublisher (CoreData)

- (void)addBoardGamesObject:(DBBoardGame *)value;
- (void)removeBoardGamesObject:(DBBoardGame *)value;
- (void)addBoardGames:(NSSet *)value;
- (void)removeBoardGames:(NSSet *)value;

@end