//
//  DBPublisher.m
//  bgg
//
//  Created by João Caxaria on 5/12/11.
//  Copyright (c) 2011 Imaginary Factory. All rights reserved.
//

#import "DBPublisher.h"
#import "DBBoardGame.h"


@implementation DBPublisher
@dynamic id;
@dynamic name;
@dynamic boardGames;

- (void)addBoardGamesObject:(DBBoardGame *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"boardGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"boardGames"] addObject:value];
    [self didChangeValueForKey:@"boardGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeBoardGamesObject:(DBBoardGame *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"boardGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"boardGames"] removeObject:value];
    [self didChangeValueForKey:@"boardGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addBoardGames:(NSSet *)value {    
    [self willChangeValueForKey:@"boardGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"boardGames"] unionSet:value];
    [self didChangeValueForKey:@"boardGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeBoardGames:(NSSet *)value {
    [self willChangeValueForKey:@"boardGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"boardGames"] minusSet:value];
    [self didChangeValueForKey:@"boardGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
