//
//  DataAccess.h
//  vigia-2-0
//
//  Created by João Caxaria on 3/9/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBBoardGame+Extras.h"

@interface DataAccess : NSObject {

}

-(BOOL) saveChanges;
-(void) deleteObject:(NSManagedObject*) object;

@end

@interface DataAccess (Private)

- (NSManagedObjectContext *)managedObjectContext;
- (NSManagedObjectModel *) managedObjectModel;
- (NSEntityDescription *) entityDescription:(NSString*) entity;

@end