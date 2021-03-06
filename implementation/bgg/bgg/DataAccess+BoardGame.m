//
//  DataAccess+BoardGame.m
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DataAccess+BoardGame.h"

@implementation DataAccess (BoardGame)


static NSString* _entity = @"DBBoardGame";

-(DBBoardGame*) getCreateBoardGame:(NSString*) gameId
{
    DBBoardGame* dbGame = [self getBoardGameById:gameId];
    if(dbGame == nil)
    {
        dbGame = [self createBoardGame];
        dbGame.gameId = gameId;
    }
    return dbGame;
}

-(DBBoardGame*) createBoardGame
{
    return [[[DBBoardGame alloc] initWithEntity:[self entityDescription:_entity] 
             insertIntoManagedObjectContext:[self managedObjectContext]] autorelease];
}


-(DBBoardGame*) getBoardGameById:(NSString*) gameId
{
    DBBoardGame *boardGame = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[self entityDescription:_entity]];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"gameId == %@", gameId];
    [fetchRequest setPredicate:predicate];
    
    [fetchRequest setRelationshipKeyPathsForPrefetching: 
     [NSArray arrayWithObjects:@"artists", @"categories", @"designers",
      @"mechanics", @"publishers", @"videos", nil]];
    
    NSArray *results = [[self managedObjectContext] executeFetchRequest:fetchRequest error:nil];
    [fetchRequest release];
    
    if([results count] > 0) {
        boardGame = [results objectAtIndex:0];
    }
    
    return boardGame;
}

-(NSArray*) getTop100
{
    NSError *error = nil;
	NSFetchRequest *fetchRequest = [[self managedObjectModel] fetchRequestTemplateForName:@"getTop100"];
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];

    NSSortDescriptor *descriptor = [[[NSSortDescriptor alloc] initWithKey:@"rank" ascending:YES] autorelease];
    return [fetchedObjects sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor, nil]];
}


@end
