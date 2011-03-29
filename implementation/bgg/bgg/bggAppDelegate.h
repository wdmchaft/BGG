//
//  bggAppDelegate.h
//  bgg
//
//  Created by João Caxaria on 3/28/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGGViewController;

@interface BGGAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet BGGViewController *viewController;

@end
