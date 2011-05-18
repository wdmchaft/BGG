//
//  BreadcrumbViewController.h
//  BGG
//
//  Created by João Caxaria on 2/28/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

@class StackSegmentedControl;
#import "WEPopoverController.h"
#import "IBreadcrumbController.h"

@interface BreadcrumbViewController : UIViewController<IBreadcrumbController> {
	IBOutlet UIScrollView* scrollView;
	IBOutlet UIView* contentView;
    
	IBOutlet UIView* footerView;
    IBOutlet UIButton* footerButton;
    
    IBOutlet UILabel* leftStatusLabel;
    IBOutlet UILabel* rightStatusLabel;
	
	NSMutableArray* viewControllers;
	StackSegmentedControl* cSegmentedControl;
    
    WEPopoverController* popoverController;
    UIButton* invisibleButton;
	
}
@property (nonatomic, retain) WEPopoverController *popoverController;
-(void) addViewController:(UIViewController*) mViewController animated:(BOOL) animated;

@end
