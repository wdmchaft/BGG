//
//  MyProfileViewController.h
//  bgg
//
//  Created by João Caxaria on 5/15/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBreadcrumbMenuDelegate.h"

@interface MyProfileViewController : UITableViewController<IBreadcrumbMenuDelegate> {
    NSArray* _boardGames;
}

@property (nonatomic, retain) NSArray* boardGames;

@end
