//
//  BoardGameCommentCell.m
//  bgg
//
//  Created by Ana Oliveira on 5/15/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameCommentCell.h"
#import "BGGBoardGameRating.h"

@implementation BoardGameCommentCell

+ (CGFloat) calculateTitleHeight:(BGGBoardGameRating *)rating
{
    CGSize constraint = CGSizeMake(SCREEN_WIDTH - (CELL_MARGIN * 2), 20000.0f);
    
    //titleSize
    CGSize titleLabelSize = [[NSString stringWithFormat:@"%@/10 from user %@", 
                              [rating.rating stringValue],
                              rating.username]
                             sizeWithFont:[UIFont systemFontOfSize:DETAILS_FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    return titleLabelSize.height;
}


+ (CGFloat) calculateDetailsHeight:(BGGBoardGameRating *)rating
{
    CGSize constraint = CGSizeMake(SCREEN_WIDTH - (CELL_MARGIN * 2), 20000.0f);
    
    //detailsSize
    CGSize detailsLabelSize = [rating.comment sizeWithFont:[UIFont systemFontOfSize:DETAILS_FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    return detailsLabelSize.height;
}


+ (CGFloat) calculateCellHeight:(BGGBoardGameRating *)rating
{
    CGFloat titleHeight = [BoardGameCommentCell calculateTitleHeight:rating];
    
    CGFloat detailsHeight = [BoardGameCommentCell calculateDetailsHeight:rating];
    
    return  20 + titleHeight + detailsHeight + (CELL_MARGIN * 2) + (ELEMENTS_SEPARATION * 2);
}


-(void) drawStars:(BGGBoardGameRating*) rating
{
    int i;
    UIImageView *star;
    
    for (i=0; i< [rating.rating intValue] ; i++) {
        
        star = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star-full.png"]] autorelease];        
        star.frame = CGRectMake(CELL_MARGIN + (22*i), CELL_MARGIN, STAR_SIZE, STAR_SIZE);
        
        [self.contentView addSubview:star];
    }
    for( ; i<10 ; i++){
        
        star = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star-empty.png"]] autorelease];        
        star.frame = CGRectMake(CELL_MARGIN + (22*i), CELL_MARGIN, STAR_SIZE, STAR_SIZE);
        
        [self.contentView addSubview:star];
    }
    
}

-(void) setRating:(BGGBoardGameRating *)rating
{
    _rating = [rating retain];
    
    [self drawStars:rating];
    
    [[self textLabel] setText:[NSString stringWithFormat:@"%@/10 from user %@", 
                               [rating.rating stringValue],
                               rating.username]];
    
    [[self detailTextLabel] setText:rating.comment];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    //TextRate label
    CGFloat textRatePosX = CELL_MARGIN;
    CGFloat textRatePosY = 35;
    CGFloat textRateWidth = self.textLabel.frame.size.width;
    CGFloat textRateHeight = [BoardGameCommentCell calculateTitleHeight:_rating];
    
    self.textLabel.numberOfLines = 1;
    self.textLabel.font = [UIFont systemFontOfSize:13.0];
    self.textLabel.textColor = [UIColor darkGrayColor];
    
    self.textLabel.frame = CGRectMake(textRatePosX, textRatePosY, textRateWidth, textRateHeight);
    
    //Comment label
    CGFloat descriptionPosX = textRatePosX;
    CGFloat descriptionPosY = textRatePosY + textRateHeight + ELEMENTS_SEPARATION;
    CGFloat descriptionWidth = self.detailTextLabel.frame.size.width;
    CGFloat descriptionHeight = [BoardGameCommentCell calculateDetailsHeight:_rating];
    
    self.detailTextLabel.font = [UIFont systemFontOfSize:DETAILS_FONT_SIZE];
    self.detailTextLabel.textColor = [UIColor blackColor];
    self.detailTextLabel.numberOfLines = 0;
    
    self.detailTextLabel.frame = CGRectMake(descriptionPosX, descriptionPosY, descriptionWidth, descriptionHeight); 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [_rating release];
    [super dealloc];
}

@end
