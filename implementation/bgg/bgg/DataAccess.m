//
//  DataAccess.m
//  vigia-2-0
//
//  Created by João Caxaria on 3/9/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DataAccess.h"
#import "BGGAppDelegate.h"

@interface DataAccess (Private)

- (NSManagedObjectContext *)managedObjectContext;
- (NSManagedObjectModel *) managedObjectModel;
- (NSEntityDescription *) entityDescription:(NSString*) entity;

@end

@implementation DataAccess


-(id) init
{
	self = [super init];
	
	return self;
}

-(BOOL) saveChanges
{
	NSError* error = nil;
	[[self managedObjectContext] save:&error];
	
#ifdef DEBUG
	if(error != nil)
		ICError(error);
#endif
	
	return error == nil;
}

-(void) deleteObject:(NSManagedObject*) object
{
	[[self managedObjectContext] deleteObject:object];
}

@end


@implementation DataAccess (Private)

- (NSManagedObjectModel *) managedObjectModel
{
	return [(BGGAppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectModel];
}

- (NSManagedObjectContext *)managedObjectContext
{
	return [(BGGAppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

- (NSEntityDescription *) entityDescription:(NSString*) entity
{
	return [[[self managedObjectModel] entitiesByName] objectForKey:entity];
}

@end

