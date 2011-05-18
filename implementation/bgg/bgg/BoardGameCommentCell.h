//
//  BoardGameCommentCell.h
//  bgg
//
//  Created by Ana Oliveira on 5/15/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGGBoardGameRating;

@interface BoardGameCommentCell : UITableViewCell {
    BGGBoardGameRating* _rating;
}

+ (CGFloat) calculateTitleHeight:(BGGBoardGameRating *)rating;

+ (CGFloat) calculateDetailsHeight:(BGGBoardGameRating *)rating;

+ (CGFloat) calculateCellHeight:(BGGBoardGameRating *)rating;

-(void) setRating:(BGGBoardGameRating*) rating;

@end
