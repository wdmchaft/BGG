//
//  BoardGameMechanicsCell.m
//  bgg
//
//  Created by Ana Oliveira on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BoardGameCategoriesCell.h"
#import "DBCategory.h"


@implementation BoardGameCategoriesCell

@synthesize cellHeight = _cellHeight;
@synthesize detailsLabelHeight = _detailsLabelHeight;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

-(NSString *) detailsLabelBuilder
{
    NSString* result = nil;
    
    for(DBCategory *category in _boardGame.categories) {
        if(result == nil)
            result = category.name;
        else
            result = [NSString stringWithFormat:@"%@\n%@", result,
                      category.name, nil];
    }
    
    return result;
}

-(void) calculateCellHeight:(NSString *) title adicionalLabel:(NSString *) label
{
    CGSize constraint = CGSizeMake(self.frame.size.width - (CELL_MARGIN * 2), 20000.0f);
    
    //titleSize
    CGSize titleLabelSize = [title sizeWithFont:[UIFont systemFontOfSize:TITLE_FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGFloat titleLabelHeight = titleLabelSize.height;
    
    //detailsSize
    CGSize adicionalLabelSize = [label sizeWithFont:[UIFont systemFontOfSize:DETAILS_FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    _detailsLabelHeight = adicionalLabelSize.height;
    
    _cellHeight = titleLabelHeight + _detailsLabelHeight + (CELL_MARGIN * 2) + ELEMENTS_SEPARATION;
}


-(void) setBoardGame:(DBBoardGame *)boardGame
{
    _boardGame = [boardGame retain];
    
    [[self textLabel] setText:@"Categories"];
    
    NSString* result = [self detailsLabelBuilder];
    [[self detailTextLabel] setText:result];
    
    [self calculateCellHeight:self.textLabel.text adicionalLabel:result];
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
    
    //Mechanics label
    CGFloat categoriesPosX = titlePosX;
    CGFloat categoriesPosY = titlePosY + titleHeight + ELEMENTS_SEPARATION;
    CGFloat categoriesWidth = self.detailTextLabel.frame.size.width;
    CGFloat categoriesHeight = _detailsLabelHeight;
    
    self.detailTextLabel.font = [UIFont systemFontOfSize:DETAILS_FONT_SIZE];
    self.detailTextLabel.textColor = [UIColor blackColor];
    self.detailTextLabel.numberOfLines = 0;
    
    self.detailTextLabel.frame = CGRectMake(categoriesPosX, categoriesPosY, categoriesWidth, categoriesHeight); 
}

- (void)dealloc
{
    [_boardGame release];
    [super dealloc];
}

@end
