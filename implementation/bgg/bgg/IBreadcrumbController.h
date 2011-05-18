//
//  IBreadcrumbController.h
//  bgg
//
//  Created by João Caxaria on 5/2/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol IBreadcrumbController <NSObject>

-(void) setStatusMessage:(NSString*) message;

-(void) setLoading;
-(void) setUpdated;

-(void) dismissPopup;
@end
