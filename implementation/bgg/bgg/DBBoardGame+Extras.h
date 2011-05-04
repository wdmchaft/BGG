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

@interface DBBoardGame (Extras)

-(UIImage*) previewImage;

-(void) updateFromBGG:(BGGBoardGameLookup*) bggBoardGame;

@end
