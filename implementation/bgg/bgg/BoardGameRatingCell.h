//
//  BoardGameTableRating.h
//  bgg
//
//  Created by Ana Oliveira on 5/11/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DBBoardGame;

@interface  BoardGameRatingCell: UITableViewCell {
    DBBoardGame* _boardGame;
}

-(void) setBoardGame:(DBBoardGame*) boardGame;

@end
