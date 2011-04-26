//
//  BreadcrumbViewController.h
//  BGG
//
//  Created by João Caxaria on 2/28/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

@class StackSegmentedControl;


@interface BreadcrumbViewController : UIViewController {
	IBOutlet UIScrollView* scrollView;
	IBOutlet UIView* contentView;
    
    
	IBOutlet UIView* footerView;
    IBOutlet UIButton* footerButton;
	
	NSMutableArray* viewControllers;
	StackSegmentedControl* cSegmentedControl;
	
}

-(void) addViewController:(UIViewController*) mViewController animated:(BOOL) animated;

@end
