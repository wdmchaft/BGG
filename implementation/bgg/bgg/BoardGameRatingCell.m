//
//  BoardGameTableRating.m
//  bgg
//
//  Created by Ana Oliveira on 5/11/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameRatingCell.h"


@implementation BoardGameRatingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        UIImageView* cellView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table-cell.png"]] autorelease];
        
        [self.contentView addSubview:cellView];
    }
    return self;
}

-(void) setBoardGame:(DBBoardGame*) boardGame
{
    _boardGame = [boardGame retain];
    
    [[self textLabel] setText:[NSString stringWithFormat:@"%@/10 (x num votes)", 
                               [boardGame.rank stringValue]]];
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    //TextRank label
    CGFloat textRankPosX = 20;
    CGFloat textRankPosY = 40;
    CGFloat textRankWidth = self.textLabel.frame.size.width;
    CGFloat textRankHeight = self.textLabel.frame.size.height;
    
    self.textLabel.numberOfLines = 1;
    self.textLabel.font = [UIFont systemFontOfSize:12.0];
    self.textLabel.textColor = [UIColor darkGrayColor];
    
    self.textLabel.frame = CGRectMake(textRankPosX, textRankPosY, textRankWidth, textRankHeight);
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
