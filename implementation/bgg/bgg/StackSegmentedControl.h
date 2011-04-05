//
//  StackSegmentedControl.m
//  BGG
//
//  Created by João Caxaria on 2/14/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//


@class StackSegmentedControl;
@protocol StackSegmentedControlDelegate

- (NSUInteger) segmentCount;
- (UIButton*) buttonFor:(StackSegmentedControl*)segmentedControl atIndex:(NSUInteger)segmentIndex;

@optional
- (void) touchUpInsideSegmentIndex:(StackSegmentedControl*)segmentedControl:(NSUInteger)segmentIndex;
- (void) touchDownAtSegmentIndex:(StackSegmentedControl*)segmentedControl:(NSUInteger)segmentIndex;
@end


@interface StackSegmentedControl : UIView
{
	NSObject <StackSegmentedControlDelegate> *delegate;
	NSMutableArray* buttons;
	int paddingX;
	int paddingY;
}


@property (nonatomic, readonly) int paddingX;
@property (nonatomic, readonly) int paddingY;
@property (nonatomic, retain) NSMutableArray* buttons;

-(id) initWithSegmentDelegate:(NSObject <StackSegmentedControlDelegate>*)customSegmentedControlDelegate;

-(void) removeAllButtons;

//generates buttons with fixed column button count
-(void) generateButtons:(int)columnCount;

//generates buttons in one row
-(void) generateButtons;

-(void) selectButton:(int) index;

-(void) setPadding:(int) x:(int) y;

@end
