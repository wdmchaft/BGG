//
//  BoardGameTableHeader.m
//  bgg
//
//  Created by Ana Oliveira on 5/10/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameHeaderCell.h"

@implementation BoardGameHeaderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //Cell background image - Design
        //UIImageView* cellView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table-header.png"]] autorelease];
        //[self.contentView addSubview:cellView];
        
        imageView = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 120)] autorelease];
        [self.contentView addSubview:imageView];
        
    }
    return self;
}

-(void) setBoardGame:(DBBoardGame*) boardGame
{
    _boardGame = [boardGame retain];
    [imageView setImage:[boardGame previewImage]];
    
    [[self textLabel] setText:[NSString stringWithFormat:@"%@ (%@)", 
                               boardGame.primaryTitle,
                               [boardGame.yearPublished stringValue]]];
    
    [[self detailTextLabel] setText:[NSString stringWithFormat:
                                     @"Rank: %@\nPlayers: %@-%@\nTime: %@ minutes\nAge: %@+", 
                                     [boardGame.rank stringValue],
                                     boardGame.minPlayers,
                                     boardGame.maxPlayers ,
                                     boardGame.playingTime,
                                     boardGame.minAge]];
}

- (void)adjustFontToFitMultiline: (UILabel*) label {
    
    NSString *stringTmp = label.text;
    
    UIFont *font = [UIFont boldSystemFontOfSize:28.0];    
    
    int i;
    int pointSizeMax = font.pointSize;
    int pointSizeMin = label.minimumFontSize;
    
    for(i = pointSizeMax; i > pointSizeMin; i=i-2)
    {
        font = [font fontWithSize:i];
        
        CGSize constraintSize = CGSizeMake(label.frame.size.width, MAXFLOAT);
        
        CGSize labelSize = [stringTmp sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        
        if(labelSize.height <= label.frame.size.height)
            break;
    }
    
    label.font = font;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    //TitleLabel 
    CGFloat titlePosX = 110 + 5;
    CGFloat titlePosY = 10;
    CGFloat titleWidth = 185;//TODO: como ver o espaço que falta?
    CGFloat titleHeight = self.textLabel.frame.size.height;
    
    self.textLabel.numberOfLines = 2;
    self.textLabel.minimumFontSize = 12.0f;
    self.textLabel.textColor = [UIColor blackColor];
    
    //TODO: bah nao fica bem em alguns, mete "..." em vez de passar para a proxima linha
    [self adjustFontToFitMultiline:self.textLabel];
    
    self.textLabel.frame = CGRectMake(titlePosX, titlePosY, titleWidth, titleHeight);

    //DetailsLabel
    CGFloat detailsPosX = titlePosX;
    CGFloat detailsPosY = titlePosY + titleHeight + 5;
    CGFloat detailsWidth = 185;
    CGFloat detailsHeight = self.detailTextLabel.frame.size.height;
    
    self.detailTextLabel.numberOfLines = 0;
    self.detailTextLabel.font = [UIFont systemFontOfSize:14.0];
    self.detailTextLabel.textColor = [UIColor darkGrayColor];
    
    self.detailTextLabel.frame = CGRectMake(detailsPosX, detailsPosY, detailsWidth, detailsHeight);
    
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
