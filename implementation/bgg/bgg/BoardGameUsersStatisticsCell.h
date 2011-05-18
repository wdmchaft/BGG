//
//  BoardGameUsersStatisticsCell.h
//  bgg
//
//  Created by Ana Oliveira on 5/18/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBoardGameCell.h"

@class DBBoardGame;

@interface BoardGameUsersStatisticsCell : UITableViewCell<IBoardGameCell> {
    DBBoardGame* _boardGame;
}

@end
