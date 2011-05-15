//
//  BoardGameTableHeader.h
//  bgg
//
//  Created by Ana Oliveira on 5/10/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBoardGameCell.h"

@class DBBoardGame;

@interface BoardGameHeaderCell : UITableViewCell<IBoardGameCell> {
    DBBoardGame* _boardGame;
    UIImageView* imageView;
}

-(void) setBoardGame:(DBBoardGame*) boardGame;

@end