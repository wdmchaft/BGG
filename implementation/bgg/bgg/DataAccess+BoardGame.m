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
    
    NSArray *results = [[self managedObjectContext] executeFetchRequest:fetchRequest error:nil];
    [fetchRequest release];
    
    if([results count] > 0) {
        boardGame = [results objectAtIndex:0];
    }
    
    return boardGame;
}

-(NSArray*) getAllBoardGames
{
    NSError *error = nil;
	NSFetchRequest *fetchRequest = [[self managedObjectModel] fetchRequestTemplateForName:@"GetAllBoardGames"];
	NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];

	return fetchedObjects;
}


@end
