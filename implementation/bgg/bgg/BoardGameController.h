//
//  BoardGameController.h
//  bgg
//
//  Created by Ana Oliveira on 5/9/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BoardGameController : UITableViewController {
    NSArray* _menuBasics;
    NSArray* _menuDetails;
}

@property (nonatomic, retain) DBBoardGame* boardGame;

@property (nonatomic, retain) NSArray* menuBasics;

@property (nonatomic, retain) NSArray* menuDetails;

@end
