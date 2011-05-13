//
//  BoardGameGenericCell.m
//  bgg
//
//  Created by Ana Oliveira on 5/12/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameGenericCell.h"


@implementation BoardGameGenericCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView* cellView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table-cell.png"]] autorelease];
        [self.contentView addSubview:cellView];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        [self setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    return self;

}

-(void) setMenuOption:(NSString *)menuOption setBoardGame:(DBBoardGame *)boardGame
{
    _boardGame = [boardGame retain];
    
    [[self textLabel] setText:menuOption];
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    //MenuOption label
    CGFloat menuOptionPosX = 20;
    CGFloat menuOptionPosY = 0;
    CGFloat menuOptionWitdh = 320;
    CGFloat menuOptionHeight = 60;
    
    self.textLabel.frame = CGRectMake(menuOptionPosX, menuOptionPosY, menuOptionWitdh, menuOptionHeight);  
    
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
