//
//  SettingsViewController.h
//  bgg
//
//  Created by João Caxaria on 5/2/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingsViewController : UIViewController {
    @private
    IBOutlet UITextField* bggUsername;
    bool needsToSave;
}

@end
