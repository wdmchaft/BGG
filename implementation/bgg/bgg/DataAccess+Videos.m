//
//  DataAccess+Videos.m
//  bgg
//
//  Created by João Caxaria on 5/12/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DataAccess+Videos.h"


@implementation DataAccess (Videos)


static NSString* _entity = @"DBVideos";


-(DBVideos*) getCreateVideo:(NSString*) cId
{
    DBVideos* element = [self getVideoById:cId];
    if(element == nil)
    {
        element = [self createVideo];
        element.id = cId;
    }
    return element;
}

-(DBVideos*) createVideo
{
    return [[[DBVideos alloc] initWithEntity:[self entityDescription:_entity] 
                 insertIntoManagedObjectContext:[self managedObjectContext]] autorelease];
}

-(DBVideos*) getVideoById:(NSString*) cId
{
    DBVideos *element = nil;
    
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
