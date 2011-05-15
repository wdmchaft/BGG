//
//  UIDevice+Hardware.h
//  vigia-2-0
//
//  Created by João Caxaria on 3/16/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

//#include <sys/types.h>
//#import <sys/sysctl.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIDevice (Hardware)
- (NSString *) platform;
- (BOOL)hasRetinaDisplay;
- (BOOL)hasMultitasking;
-(BOOL) isiPhone;
-(BOOL) isiPad;
-(BOOL) isiPadTwo;

-(CGPoint) universalPosition:(CGPoint) userPosition;
-(CGRect) universalSize:(CGRect) userSize;
-(CGRect) rotatedScreenSize;
@end

int	sysctl(int *, u_int, void *, size_t *, void *, size_t);