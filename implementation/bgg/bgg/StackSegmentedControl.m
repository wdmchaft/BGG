//
//  CustomSegmentedControl.m
//  BGG
//
//  Created by João Caxaria on 2/14/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "StackSegmentedControl.h"

@implementation StackSegmentedControl
@synthesize buttons;
@synthesize paddingX;
@synthesize paddingY;


-(id) initWithSegmentDelegate:(NSObject <StackSegmentedControlDelegate>*)customSegmentedControlDelegate;
{
	self = [super init];
	
	delegate = customSegmentedControlDelegate;
	
	paddingX = 0;
	paddingY = 0;
	
	
	self.buttons = [[NSMutableArray alloc] initWithCapacity:1];
	
	return self;
}

-(void) setPadding:(int) x:(int) y
{
	paddingX = x;
	paddingY = y;
}

-(void) generateButtons:(int)columnCount
{
	CGFloat horizontalOffset = 0;
	CGFloat verticalOffset = 0;
	
	//float width = 0;
	float height = 0;
	
	if([delegate segmentCount] < [buttons count])
	{
		for(UIButton* button in buttons)
		{
			[button removeFromSuperview];
		}
		[buttons removeAllObjects];
	}
	
	for(UIButton* button in buttons)
	{
		horizontalOffset = horizontalOffset + button.frame.size.width + paddingX;
	}

	for (NSUInteger i = [buttons count] ; i < [delegate segmentCount] ; i++)
	{
		UIButton* button = [delegate buttonFor:self atIndex:i];
		
		if(button == nil)
			continue;
		
		height = button.frame.size.height;
		
		[button addTarget:self action:@selector(touchDownAction:) forControlEvents:UIControlEventTouchDown];
		[button addTarget:self action:@selector(touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
		[button addTarget:self action:@selector(otherTouchesAction:) forControlEvents:UIControlEventTouchUpOutside];
		[button addTarget:self action:@selector(otherTouchesAction:) forControlEvents:UIControlEventTouchDragOutside];
		[button addTarget:self action:@selector(touchDragAction:) forControlEvents:UIControlEventTouchDragInside];
		
		[buttons addObject:button];
		
		if(i > 0 && i % columnCount == 0)
		{
			verticalOffset += height + paddingY;
			horizontalOffset = 0;
		}
		
		button.frame = CGRectMake(horizontalOffset, verticalOffset, button.frame.size.width, button.frame.size.height);
		
		[self addSubview:button];
		
		horizontalOffset = horizontalOffset + button.frame.size.width + paddingX;
	}
	self.frame = CGRectMake(0, 0, horizontalOffset - paddingX, height);
}

-(void) generateButtons
{
	[self generateButtons:[delegate segmentCount]];
}

-(void) dimAllButtonsExcept:(UIButton*)selectedButton
{
	for (UIButton* button in buttons)
	{
		if (button == selectedButton)
		{
			button.selected = YES;
		}
		else
		{
			button.selected = NO;
		}
	}
}

-(void) selectButton:(int) index
{
	if(index >= [buttons count] || index < 0)
		return;
	[self dimAllButtonsExcept:[buttons objectAtIndex:index]];
}

-(void) removeAllButtons
{
	for(UIButton* button in buttons)
		[button removeFromSuperview];
	
	[buttons removeAllObjects];
}

- (void)touchDownAction:(UIButton*)button
{
	[self dimAllButtonsExcept:button];
	
	if ([delegate respondsToSelector:@selector(touchDownAtSegmentIndex::)])
		[delegate touchDownAtSegmentIndex:self:[buttons indexOfObject:button]];
}

- (void)touchUpInsideAction:(UIButton*)button
{
	[self dimAllButtonsExcept:button];
	
	if ([delegate respondsToSelector:@selector(touchUpInsideSegmentIndex::)])
		[delegate touchUpInsideSegmentIndex:self:[buttons indexOfObject:button]];
}

-(void) touchDragAction:(UIButton*)button
{
	[self dimAllButtonsExcept:button];
}

- (void)otherTouchesAction:(UIButton*)button
{
	[self dimAllButtonsExcept:button];
}

- (void)dealloc
{
	[super dealloc];
	[buttons release];
}


@end
