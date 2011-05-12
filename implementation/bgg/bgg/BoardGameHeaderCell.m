//
//  BoardGameTableHeader.m
//  bgg
//
//  Created by Ana Oliveira on 5/10/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameTableHeader.h"


@implementation BoardGameTableHeader

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
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
