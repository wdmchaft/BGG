//
//  DataAccess+BoardGame.m
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DataAccess+Publisher.h"

@implementation DataAccess (Publisher)

static NSString* _entity = @"DBPublisher";


-(DBPublisher*) getCreatePublisher:(NSString*) cId
{
    DBPublisher* element = [self getPublisherById:cId];
    if(element == nil)
    {
        element = [self createPublisher];
        element.id = cId;
    }
    return element;
}

-(DBPublisher*) createPublisher
{
    return [[[DBPublisher alloc] initWithEntity:[self entityDescription:_entity] 
                 insertIntoManagedObjectContext:[self managedObjectContext]] autorelease];
}

-(DBPublisher*) getPublisherById:(NSString*) cId
{
    DBPublisher *element = nil;
    
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
