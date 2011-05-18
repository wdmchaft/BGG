//
//  DBPerson.m
//  bgg
//
//  Created by João Caxaria on 5/17/11.
//  Copyright (c) 2011 Imaginary Factory. All rights reserved.
//

#import "DBPerson.h"
#import "DBBoardGame.h"
#import "DBVideos.h"


@implementation DBPerson
@dynamic id;
@dynamic username;
@dynamic name;
@dynamic updatedOwnedGames;
@dynamic updatedPlayedGames;
@dynamic updatedWishedGames;
@dynamic videos;
@dynamic playedGames;
@dynamic wishedGames;
@dynamic boardGamesArtist;
@dynamic ownedGames;
@dynamic boardGamesDesigner;

- (void)addVideosObject:(DBVideos *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"videos" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"videos"] addObject:value];
    [self didChangeValueForKey:@"videos" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeVideosObject:(DBVideos *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"videos" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"videos"] removeObject:value];
    [self didChangeValueForKey:@"videos" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addVideos:(NSSet *)value {    
    [self willChangeValueForKey:@"videos" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"videos"] unionSet:value];
    [self didChangeValueForKey:@"videos" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeVideos:(NSSet *)value {
    [self willChangeValueForKey:@"videos" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"videos"] minusSet:value];
    [self didChangeValueForKey:@"videos" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addPlayedGamesObject:(DBBoardGame *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"playedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"playedGames"] addObject:value];
    [self didChangeValueForKey:@"playedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removePlayedGamesObject:(DBBoardGame *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"playedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"playedGames"] removeObject:value];
    [self didChangeValueForKey:@"playedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addPlayedGames:(NSSet *)value {    
    [self willChangeValueForKey:@"playedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"playedGames"] unionSet:value];
    [self didChangeValueForKey:@"playedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removePlayedGames:(NSSet *)value {
    [self willChangeValueForKey:@"playedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"playedGames"] minusSet:value];
    [self didChangeValueForKey:@"playedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addWishedGamesObject:(DBBoardGame *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"wishedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"wishedGames"] addObject:value];
    [self didChangeValueForKey:@"wishedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeWishedGamesObject:(DBBoardGame *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"wishedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"wishedGames"] removeObject:value];
    [self didChangeValueForKey:@"wishedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addWishedGames:(NSSet *)value {    
    [self willChangeValueForKey:@"wishedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"wishedGames"] unionSet:value];
    [self didChangeValueForKey:@"wishedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeWishedGames:(NSSet *)value {
    [self willChangeValueForKey:@"wishedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"wishedGames"] minusSet:value];
    [self didChangeValueForKey:@"wishedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addBoardGamesArtistObject:(DBBoardGame *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"boardGamesArtist" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"boardGamesArtist"] addObject:value];
    [self didChangeValueForKey:@"boardGamesArtist" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeBoardGamesArtistObject:(DBBoardGame *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"boardGamesArtist" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"boardGamesArtist"] removeObject:value];
    [self didChangeValueForKey:@"boardGamesArtist" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addBoardGamesArtist:(NSSet *)value {    
    [self willChangeValueForKey:@"boardGamesArtist" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"boardGamesArtist"] unionSet:value];
    [self didChangeValueForKey:@"boardGamesArtist" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeBoardGamesArtist:(NSSet *)value {
    [self willChangeValueForKey:@"boardGamesArtist" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"boardGamesArtist"] minusSet:value];
    [self didChangeValueForKey:@"boardGamesArtist" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addOwnedGamesObject:(DBBoardGame *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"ownedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"ownedGames"] addObject:value];
    [self didChangeValueForKey:@"ownedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeOwnedGamesObject:(DBBoardGame *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"ownedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"ownedGames"] removeObject:value];
    [self didChangeValueForKey:@"ownedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addOwnedGames:(NSSet *)value {    
    [self willChangeValueForKey:@"ownedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"ownedGames"] unionSet:value];
    [self didChangeValueForKey:@"ownedGames" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeOwnedGames:(NSSet *)value {
    [self willChangeValueForKey:@"ownedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"ownedGames"] minusSet:value];
    [self didChangeValueForKey:@"ownedGames" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addBoardGamesDesignerObject:(DBBoardGame *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"boardGamesDesigner" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"boardGamesDesigner"] addObject:value];
    [self didChangeValueForKey:@"boardGamesDesigner" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeBoardGamesDesignerObject:(DBBoardGame *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"boardGamesDesigner" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"boardGamesDesigner"] removeObject:value];
    [self didChangeValueForKey:@"boardGamesDesigner" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addBoardGamesDesigner:(NSSet *)value {    
    [self willChangeValueForKey:@"boardGamesDesigner" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"boardGamesDesigner"] unionSet:value];
    [self didChangeValueForKey:@"boardGamesDesigner" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeBoardGamesDesigner:(NSSet *)value {
    [self willChangeValueForKey:@"boardGamesDesigner" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"boardGamesDesigner"] minusSet:value];
    [self didChangeValueForKey:@"boardGamesDesigner" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
