//
//  UIDevice+Hardware.m
//  vigia-2-0
//
//  Created by João Caxaria on 3/16/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "UIDevice+Hardware.h"
#define	CTL_HW		6
#define	HW_MACHINE	 1

@implementation UIDevice(Hardware)

- (NSString *) platform{
    int mib[2];
	size_t len;
	char *machine;
	
	mib[0] = CTL_HW;
	mib[1] = HW_MACHINE;
	sysctl(mib, 2, NULL, &len, NULL, 0);
	machine = malloc(len);
	sysctl(mib, 2, machine, &len, NULL, 0);
	
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
	return platform;
}

- (BOOL)hasRetinaDisplay {
    NSString *platform = [self platform];
    
	if ([platform isEqualToString:@"iPhone3,1"])
        return YES;
    return NO;
}

- (BOOL)hasMultitasking {
    if ([self respondsToSelector:@selector(isMultitaskingSupported)]) {
        return [self isMultitaskingSupported];
    }
    return NO;
}

-(BOOL) isiPhone
{
	NSString *platform = [self platform];
	if ([platform isEqualToString:@"iPhone1,1"])    return YES;
	if ([platform isEqualToString:@"iPhone1,2"])    return YES;
	if ([platform isEqualToString:@"iPhone2,1"])    return YES;
	if ([platform isEqualToString:@"iPhone3,1"])    return YES;
	if ([platform isEqualToString:@"iPod1,1"])      return NO;
	if ([platform isEqualToString:@"iPod2,1"])      return NO;
	if ([platform isEqualToString:@"iPod3,1"])      return NO;
	if ([platform isEqualToString:@"iPod4,1"])      return NO;
	if ([platform isEqualToString:@"iPad1,1"])      return NO;
	if ([platform isEqualToString:@"iPad2,1"])      return NO;
	if ([platform isEqualToString:@"iPad2,2"])      return NO;
	if ([platform isEqualToString:@"iPad2,3"])      return NO;
	if ([platform isEqualToString:@"i386"])         return NO;
	return NO;
}

-(BOOL) isiPad
{
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

-(BOOL) isiPadTwo
{
	if(![self isiPad])
		return NO;
	NSString *platform = [self platform];
	if ([platform isEqualToString:@"iPhone1,1"])    return NO;
	if ([platform isEqualToString:@"iPhone1,2"])    return NO;
	if ([platform isEqualToString:@"iPhone2,1"])    return NO;
	if ([platform isEqualToString:@"iPhone3,1"])    return NO;
	if ([platform isEqualToString:@"iPod1,1"])      return NO;
	if ([platform isEqualToString:@"iPod2,1"])      return NO;
	if ([platform isEqualToString:@"iPod3,1"])      return NO;
	if ([platform isEqualToString:@"iPod4,1"])      return NO;
	if ([platform isEqualToString:@"iPad1,1"])      return NO;
	if ([platform isEqualToString:@"iPad2,1"])      return NO;
	if ([platform isEqualToString:@"iPad2,2"])      return YES;
	if ([platform isEqualToString:@"iPad2,3"])      return NO;
	if ([platform isEqualToString:@"i386"])         return NO;
	return NO;
}

-(CGPoint) universalPosition:(CGPoint) userPosition
{
	CGRect size = [self rotatedScreenSize];
	return CGPointMake(userPosition.x * size.size.width / 320, userPosition.y * size.size.height / 480); 
}

-(CGRect) universalSize:(CGRect) userSize
{
	CGRect size = [self rotatedScreenSize];
	return CGRectMake(userSize.origin.x * size.size.width / 320, userSize.origin.y * size.size.height / 480,
					  userSize.size.width * size.size.width / 320, userSize.size.height * size.size.height / 480); 
}

-(CGRect) rotatedScreenSize
{
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && (
                                                                [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight ||
                                                                [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft 
                                                                ))
    {
        CGFloat tmp = screenSize.size.width; 
        screenSize.size.width = screenSize.size.height;
        screenSize.size.height = tmp;
    }
    return screenSize;
}


@end