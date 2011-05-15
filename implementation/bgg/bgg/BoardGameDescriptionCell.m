//
//  BoardGameDescriptionCell.m
//  bgg
//
//  Created by Ana Oliveira on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameDescriptionCell.h"


@implementation BoardGameDescriptionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        [self setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    return self;
}

-(void) setBoardGame:(DBBoardGame *)boardGame
{
    _boardGame = [boardGame retain];
    
    [[self textLabel] setText:@"Description"];
    
    [[self detailTextLabel] setText:boardGame.gameDescription];
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    //TitleLabel 
    CGFloat titlePosX = CELL_MARGIN;
    CGFloat titlePosY = CELL_MARGIN;
    CGFloat titleWidth = self.textLabel.frame.size.width;
    CGFloat titleHeight = self.textLabel.frame.size.height;
    
    self.textLabel.font = [UIFont boldSystemFontOfSize:TITLE_FONT_SIZE];
    
    self.textLabel.frame = CGRectMake(titlePosX, titlePosY, titleWidth, titleHeight);  
    
    //Description label
    CGFloat descriptionPosX = titlePosX;
    CGFloat descriptionPosY = titlePosY + titleHeight + ELEMENTS_SEPARATION;
    CGFloat descriptionWidth = self.detailTextLabel.frame.size.width;
    CGFloat descriptionHeight = HEADER_CELL_HEIGHT - descriptionPosY - CELL_MARGIN;
    
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
    [_boardGame release];
    [super dealloc];
}

@end
