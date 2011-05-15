//
//  IBoardGameCell.h
//  bgg
//
//  Created by Ana Oliveira on 5/15/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol IBoardGameVariableHeightCell <NSObject>

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat detailsLabelHeight;

@end
