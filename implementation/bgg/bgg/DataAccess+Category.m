//
//  DataAccess+BoardGame.m
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DataAccess+Category.h"

@implementation DataAccess (Category)

static NSString* _entity = @"DBCategory";

-(DBCategory*) getCreateCategory:(NSString*) cId
{
    DBCategory* element = [self getCategoryById:cId];
    if(element == nil)
    {
        element = [self createCategory];
        element.id = cId;
    }
    return element;
}

-(DBCategory*) createCategory
{
    return [[[DBCategory alloc] initWithEntity:[self entityDescription:_entity] 
             insertIntoManagedObjectContext:[self managedObjectContext]] autorelease];
}

-(DBCategory*) getCategoryById:(NSString*) cId
{
    DBCategory *element = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[self entityDescription:_entity]];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id == %@", cId];
    [fetchRequest setPredicate:predicate];
    
    NSArray *results = [[self managedObjectContext] executeFetchRequest:fetchRequest error:nil];
    [fetchRequest release];
    
    if([results count] > 0) {
        element = [results objectAtIndex:0];
    }
    
    return element;
}

@end
