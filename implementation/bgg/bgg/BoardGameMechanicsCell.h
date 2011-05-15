//
//  BoardGameMechanicsCell.h
//  bgg
//
//  Created by Ana Oliveira on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBoardGameCell.h"
#import "IBoardGameVariableHeightCell.h"

@interface BoardGameMechanicsCell : UITableViewCell<IBoardGameVariableHeightCell, IBoardGameCell> {
    DBBoardGame* _boardGame;
    CGFloat _cellHeight;
    CGFloat _detailsLabelHeight;
}

-(void) setBoardGame:(DBBoardGame*) boardGame;

@end