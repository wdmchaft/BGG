//
//  BoardGameUsersStatisticsCell.m
//  bgg
//
//  Created by Ana Oliveira on 5/18/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameUsersStatisticsCell.h"


@implementation BoardGameUsersStatisticsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) setBoardGame:(DBBoardGame *)boardGame
{
    _boardGame = [boardGame retain];
    
    [[self textLabel] setText:@"Owning: 1000 users\nWishing: 100 users\nNOT IMPLEMENTED"];
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    //Statistics label
    CGFloat statisticsPosX = CELL_MARGIN;
    CGFloat statisticsPosY = CELL_MARGIN;
    CGFloat statisticsWidth = self.textLabel.frame.size.width;
    CGFloat statisticsHeight = 80;
    
    self.textLabel.font = [UIFont systemFontOfSize:DETAILS_FONT_SIZE];
    self.textLabel.textColor = [UIColor blackColor];
    self.textLabel.numberOfLines = 0;
    
    //self.textLabel.backgroundColor = [UIColor redColor];
    
    self.textLabel.frame = CGRectMake(statisticsPosX, statisticsPosY, statisticsWidth, statisticsHeight); 
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

@end
