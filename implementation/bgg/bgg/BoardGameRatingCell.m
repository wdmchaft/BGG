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
    
    //TODO: half stars. value type of rating should be corrected?
    int i;
    UIImageView *star;
    for (i=0; i< [boardGame.rating intValue]; i++) {
         
        star = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star-full.png"]] autorelease];        
        star.frame = CGRectMake(20 + (22*i), 15, 20, 20);

        [self.contentView addSubview:star];
    }
    for( ; i<10 ; i++){
        
        star = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star-empty.png"]] autorelease];        
        star.frame = CGRectMake(20 + (22*i), 15, 20, 20);
        
        [self.contentView addSubview:star];
    }
     
    //TODO: change DBBoardGame rating to double??
   /*NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"#0.##"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:boardGame.rating]];
    */
    [[self textLabel] setText:[NSString stringWithFormat:@"%@/10 (%@ votes)", 
                               boardGame.rating,
                               [boardGame.ratingCount stringValue]]];
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    //TextRank label
    CGFloat textRankPosX = 20;
    CGFloat textRankPosY = 40;
    CGFloat textRankWidth = self.textLabel.frame.size.width;
    CGFloat textRankHeight = self.textLabel.frame.size.height;
    
    self.textLabel.numberOfLines = 1;
    self.textLabel.font = [UIFont systemFontOfSize:13.0];
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
