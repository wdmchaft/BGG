//
//  Globals.h
//  vigia-2-0
//
//  Created by João Caxaria on 3/9/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Globals : NSObject {
}

+(Globals *)sharedGlobals;


-(void) pushFrom:(UIViewController*) currentView toView:(UIViewController*) destinationView;

-(void) pushFrom:(UIViewController*) currentView toView:(UIViewController*) destinationView :(BOOL) back;

@end
