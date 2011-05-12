//
//  DataAccess+BoardGame.m
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DataAccess+Person.h"

@implementation DataAccess (Person)


static NSString* _entity = @"DBPerson";

-(DBPerson*) getCreatePerson:(NSString*) cId
{
    DBPerson* element = [self getPersonById:cId];
    if(element == nil)
    {
        element = [self createPerson];
        element.id = cId;
    }
    return element;
}

-(DBPerson*) createPerson
{
    return [[[DBPerson alloc] initWithEntity:[self entityDescription:_entity] 
                 insertIntoManagedObjectContext:[self managedObjectContext]] autorelease];
}

-(DBPerson*) getPersonById:(NSString*) cId
{
    DBPerson *element = nil;
    
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
