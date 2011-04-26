//
//  AMinhaView.h
//  bgg
//
//  Created by João Caxaria on 4/26/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBreadcrumbMenu.h"

@interface AMinhaView : UIViewController<IBreadcrumbMenu> {
    IBOutlet UILabel* aMinhaLabel;
}

@end
