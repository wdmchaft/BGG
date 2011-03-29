//
//  CustomSegmentedControl.m
//  BGG
//
//  Created by João Caxaria on 2/14/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//


@class CustomSegmentedControl;
@protocol CustomSegmentedControlDelegate

- (UIButton*) buttonFor:(CustomSegmentedControl*)segmentedControl atIndex:(NSUInteger)segmentIndex;

@optional
- (void) touchUpInsideSegmentIndex:(CustomSegmentedControl*)segmentedControl:(NSUInteger)segmentIndex;
- (void) touchDownAtSegmentIndex:(CustomSegmentedControl*)segmentedControl:(NSUInteger)segmentIndex;
@end

@interface CustomSegmentedControl : UIView
{
	NSObject <CustomSegmentedControlDelegate> *delegate;
	NSMutableArray* buttons;
	NSUInteger segmentCount;
	int paddingX;
	int paddingY;
}


@property (nonatomic, readonly) int paddingX;
@property (nonatomic, readonly) int paddingY;
@property (nonatomic, retain) NSMutableArray* buttons;

-(id) initWithSegmentCount:(NSUInteger)segmentCount delegate:(NSObject <CustomSegmentedControlDelegate>*)customSegmentedControlDelegate;

//generates buttons with fixed column button count
-(void) generateButtons:(int)columnCount;

//generates buttons in one row
-(void) generateButtons;

//force selection of specific button
-(void) selectButton:(int) index;

-(void) setPadding:(int) x:(int) y;

@end
