//
//  BoardGameMechanicsCell.m
//  bgg
//
//  Created by Ana Oliveira on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameMechanicsCell.h"
#import "DBMechanic.h"

@implementation BoardGameMechanicsCell

+ (NSString *) detailsLabelBuilder:(DBBoardGame *)boardGame
{
    NSString* result = nil;
    
    for(DBMechanic *mechanic in boardGame.mechanics) {
        if(result == nil)
            result = mechanic.name;
        else
            result = [NSString stringWithFormat:@"%@\n%@", result,
                      mechanic.name, nil];
    }
    
    return result;
}


+ (CGFloat) calculateTitleHeight:(DBBoardGame *)boardGame
{
    CGSize constraint = CGSizeMake(SCREEN_WIDTH - (CELL_MARGIN * 2), 20000.0f);
    
    //titleSize
    CGSize titleLabelSize = [@"Mechanics" sizeWithFont:[UIFont systemFontOfSize:TITLE_FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];

    return titleLabelSize.height;
}


+ (CGFloat) calculateDetailsHeight:(DBBoardGame *)boardGame
{
    CGSize constraint = CGSizeMake(SCREEN_WIDTH - (CELL_MARGIN * 2), 20000.0f);
    
    //detailsSize
    CGSize detailsLabelSize = [[BoardGameMechanicsCell detailsLabelBuilder:boardGame] sizeWithFont:[UIFont systemFontOfSize:DETAILS_FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    return detailsLabelSize.height;
}


+ (CGFloat) calculateCellHeight:(DBBoardGame *)boardGame
{
    CGFloat titleHeight = [BoardGameMechanicsCell calculateTitleHeight:boardGame];
    
    CGFloat detailsHeight = [BoardGameMechanicsCell calculateDetailsHeight:boardGame];

    return titleHeight + detailsHeight + (CELL_MARGIN * 2) + ELEMENTS_SEPARATION;
}

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
    
    [[self textLabel] setText:@"Mechanics"];
    
    NSString* result = [BoardGameMechanicsCell detailsLabelBuilder:boardGame];
    [[self detailTextLabel] setText:result];
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    //TitleLabel 
    CGFloat titlePosX = CELL_MARGIN;
    CGFloat titlePosY = CELL_MARGIN;
    CGFloat titleWidth = self.textLabel.frame.size.width;
    CGFloat titleHeight = [BoardGameMechanicsCell calculateTitleHeight:_boardGame];
    
    self.textLabel.font = [UIFont boldSystemFontOfSize:TITLE_FONT_SIZE];
    
    self.textLabel.frame = CGRectMake(titlePosX, titlePosY, titleWidth, titleHeight);  
    
    //Mechanics label
    CGFloat mechanicsPosX = titlePosX;
    CGFloat mechanicsPosY = titlePosY + titleHeight + ELEMENTS_SEPARATION;
    CGFloat mechanicsWidth = self.detailTextLabel.frame.size.width;
    CGFloat mechanicsHeight = [BoardGameMechanicsCell calculateDetailsHeight:_boardGame];
    
    self.detailTextLabel.font = [UIFont systemFontOfSize:DETAILS_FONT_SIZE];
    self.detailTextLabel.textColor = [UIColor blackColor];
    self.detailTextLabel.numberOfLines = 0;
    
    self.detailTextLabel.frame = CGRectMake(mechanicsPosX, mechanicsPosY, mechanicsWidth, mechanicsHeight); 
}

- (void)dealloc
{
    [_boardGame release];
    [super dealloc];
}

@end
