//
//  InitialSyncViewController.h
//  bgg
//
//  Created by João Caxaria on 4/19/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSHUDView;

@interface InitialSyncViewController : NSObject {
    SSHUDView *_hud;
}
-(void)start;
@end
