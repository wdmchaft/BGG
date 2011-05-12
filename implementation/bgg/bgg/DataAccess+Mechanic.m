//
//  DataAccess+BoardGame.m
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DataAccess+Mechanic.h"

@implementation DataAccess (Mechanic)

static NSString* _entity = @"DBMechanic";


-(DBMechanic*) getCreateMechanic:(NSString*) cId
{
    DBMechanic* element = [self getMechanicById:cId];
    if(element == nil)
    {
        element = [self createMechanic];
        element.id = cId;
    }
    return element;
}

-(DBMechanic*) createMechanic
{
    return [[[DBMechanic alloc] initWithEntity:[self entityDescription:_entity] 
                 insertIntoManagedObjectContext:[self managedObjectContext]] autorelease];
}

-(DBMechanic*) getMechanicById:(NSString*) cId
{
    DBMechanic *element = nil;
    
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
