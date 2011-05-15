//
//  BoardGameDescriptionCell.h
//  bgg
//
//  Created by Ana Oliveira on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBoardGameCell.h"


@interface BoardGameDescriptionCell : UITableViewCell<IBoardGameCell> {
    DBBoardGame* _boardGame;
}

@end
