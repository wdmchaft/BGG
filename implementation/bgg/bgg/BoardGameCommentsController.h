//
//  BoardGameCommentsController.h
//  bgg
//
//  Created by Ana Oliveira on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BoardGameCommentsController : UITableViewController {
    DBBoardGame* _boardGame;//TODO: should be rating/comment information
}

-(void) setBoardGame:(DBBoardGame*) boardGame;

@end
