//
//  BoardGameGenericCell.h
//  bgg
//
//  Created by Ana Oliveira on 5/12/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DBBoardGame;

@interface BoardGameGenericCell : UITableViewCell {
    DBBoardGame* _boardGame;
    NSString* _menuOption;
}

-(void) setMenuOption:(NSString*)menuOption setBoardGame:(DBBoardGame*)boardGame;

@end