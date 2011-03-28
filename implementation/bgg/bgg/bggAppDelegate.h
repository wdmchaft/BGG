//
//  bggAppDelegate.h
//  bgg
//
//  Created by João Caxaria on 3/28/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class bggViewController;

@interface bggAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet bggViewController *viewController;

@end
