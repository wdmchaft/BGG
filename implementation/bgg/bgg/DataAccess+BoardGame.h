//
//  DataAccess+BoardGame.h
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBBoardGame.h"

@interface DataAccess (BoardGame)

-(DBBoardGame*) getCreateBoardGame:(NSString*) gameId;
-(DBBoardGame*) createBoardGame;
-(DBBoardGame*) getBoardGameById:(NSString*) gameId;
-(NSArray*) getTop100;

@end
