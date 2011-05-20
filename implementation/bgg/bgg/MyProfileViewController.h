//
//  MyProfileViewController.h
//  bgg
//
//  Created by João Caxaria on 5/15/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBreadcrumbMenuDelegate.h"
@class DBPerson;

typedef enum
{
    MyProfileOwnedGames,
    MyProfilePlayedGames,
    MyProfileWishedGames
} MyProfileStatus;

@interface MyProfileViewController : UITableViewController<IBreadcrumbMenuDelegate> {
    NSMutableArray* _boardGames;
    
    DBPerson* currentProfile;
    
    MyProfileStatus currentStatus;
}

@property (nonatomic, retain) NSMutableArray* boardGames;

@property (nonatomic, retain) DBPerson* currentProfile;

@end
