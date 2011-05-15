//
//  BoardGameGenericCell.h
//  bgg
//
//  Created by Ana Oliveira on 5/12/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBoardGameCell.h"

@class DBBoardGame;

@interface BoardGameGenericCell : UITableViewCell<IBoardGameCell> {
    DBBoardGame* _boardGame;
    NSString* _menuOption;
}

-(void) setMenuOption:(NSString*)menuOption;

@end