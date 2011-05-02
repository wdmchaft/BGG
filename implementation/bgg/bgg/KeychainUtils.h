//
//  KeychainUtils.h
//  Hole19App
//
//  Created by João Caxaria on 2/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//



@interface KeychainUtils : NSObject {
	
}

+ (NSString *) getPasswordForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;
+ (BOOL) storeUsername: (NSString *) username andPassword: (NSString *) password forServiceName: (NSString *) serviceName updateExisting: (BOOL) updateExisting error: (NSError **) error;
+ (BOOL) deleteItemForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;

@end