//
//  BoardGameListCell.h
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DBBoardGame;

@interface BoardGameListCell : UITableViewCell {
    DBBoardGame* _boardGame;
    UIImageView* imageView;
    BOOL _showRank;
}

-(void) setBoardGame:(DBBoardGame*) boardGame;
-(void) showRank:(BOOL) showRank;

@end
