//
//  BreadcrumbViewController.h
//  BGG
//
//  Created by João Caxaria on 2/28/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

@class CustomSegmentedControl;


@interface BreadcrumbViewController : UIViewController {
	IBOutlet UIScrollView* scrollView;
	IBOutlet UIView* contentView;
	IBOutlet UIButton* scrollLeft;
	IBOutlet UIButton* scrollRight;
	
	NSArray* viewControllers;
	int selectedIndex;
	CustomSegmentedControl* cSegmentedControl;
	
}

-(void) setViewControllers:(NSArray*) mViewControllers;

@end
