//
//  BoardGameForumsController.h
//  bgg
//
//  Created by Ana Oliveira on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BoardGameForumsController : UIViewController {
    DBBoardGame* _boardGame;
}

@property (nonatomic, retain) DBBoardGame* boardGame;

-(void) setBoardGame:(DBBoardGame*) boardGame;

@end
