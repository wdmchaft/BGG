//
//  IBreadcrumbMenu.h
//  bgg
//
//  Created by João Caxaria on 4/26/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBreadcrumbController.h"

@protocol IBreadcrumbMenuDelegate <NSObject>

@required

/* 
 MAX UIVIEW WIDTH: 230px
 MIN UIVIEW HEIGHT: 100px   
 */
-(UIView*) menuClicked;

-(void) breadcrumbWillAppear:(id<IBreadcrumbController>) breadcrumb;
-(void) breadcrumbWillDisappear:(id<IBreadcrumbController>) breadcrumb;
@end
