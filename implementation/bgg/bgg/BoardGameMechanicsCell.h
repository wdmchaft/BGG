//
//  BoardGameMechanicsCell.h
//  bgg
//
//  Created by Ana Oliveira on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBoardGameCell.h"

@interface BoardGameMechanicsCell : UITableViewCell<IBoardGameCell> {
    DBBoardGame* _boardGame;
}

+ (NSString *) detailsLabelBuilder:(DBBoardGame *)boardGame;

+ (CGFloat) calculateTitleHeight:(DBBoardGame *)boardGame;

+ (CGFloat) calculateDetailsHeight:(DBBoardGame *)boardGame;

+ (CGFloat) calculateCellHeight:(DBBoardGame *)boardGame;

@end