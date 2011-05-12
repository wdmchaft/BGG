//
//  DBMechanic+Extras.h
//  bgg
//
//  Created by João Caxaria on 5/10/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBMechanic.h"
#import "BGGIdNameLookup.h"

@interface DBMechanic (Extras)

-(void) updateFromBGGLookup:(BGGIdNameLookup*) bggLookup;

@end

@interface DBMechanic (CoreData)

- (void)addBoardGamesObject:(DBBoardGame *)value;
- (void)removeBoardGamesObject:(DBBoardGame *)value;
- (void)addBoardGames:(NSSet *)value;
- (void)removeBoardGames:(NSSet *)value;

@end