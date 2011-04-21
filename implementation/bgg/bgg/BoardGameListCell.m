//
//  BoardGameListCell.m
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameListCell.h"
#import "DBBoardGame+Images.h"

@implementation BoardGameListCell

-(void) setBoardGame:(DBBoardGame*) boardGame
{
    _boardGame = [boardGame retain];
    [imageView setImage:[boardGame previewImage]];
    
    
    [[self textLabel] setText:[NSString stringWithFormat:@"%@ . %@", 
                               boardGame.rank, 
                               boardGame.primaryTitle]];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setSelectionStyle:UITableViewCellSelectionStyleGray];
        
        
		UIImageView* cellView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell-background.png"]] autorelease];
        [self.contentView addSubview:cellView];
        
        imageView = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 50, 50)] autorelease];
        [self.contentView addSubview:imageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) layoutSubviews {
    [super layoutSubviews];
    self.textLabel.frame = CGRectMake(70, 0, 
                                      self.textLabel.frame.size.width - 70, 
                                      self.textLabel.frame.size.height);
}

- (void)dealloc
{
    [_boardGame release];
    [super dealloc];
}

@end
