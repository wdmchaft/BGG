//
//  DBBoardGame.m
//  bgg
//
//  Created by João Caxaria on 5/16/11.
//  Copyright (c) 2011 Imaginary Factory. All rights reserved.
//

#import "DBBoardGame.h"
#import "DBCategory.h"
#import "DBMechanic.h"
#import "DBPerson.h"
#import "DBPublisher.h"
#import "DBVideos.h"


@implementation DBBoardGame
@dynamic rank;
@dynamic maxPlayers;
@dynamic gameDescription;
@dynamic ratingCount;
@dynamic playingTime;
@dynamic primaryTitle;
@dynamic minPlayers;
@dynamic updated;
@dynamic gameId;
@dynamic yearPublished;
@dynamic hasDetails;
@dynamic minAge;
@dynamic rating;
@dynamic mechanics;
@dynamic categories;
@dynamic artists;
@dynamic wishedBy;
@dynamic playedBy;
@dynamic videos;
@dynamic ownedBy;
@dynamic designers;
@dynamic publishers;

- (void)addMechanicsObject:(DBMechanic *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"mechanics" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"mechanics"] addObject:value];
    [self didChangeValueForKey:@"mechanics" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeMechanicsObject:(DBMechanic *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"mechanics" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"mechanics"] removeObject:value];
    [self didChangeValueForKey:@"mechanics" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addMechanics:(NSSet *)value {    
    [self willChangeValueForKey:@"mechanics" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"mechanics"] unionSet:value];
    [self didChangeValueForKey:@"mechanics" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeMechanics:(NSSet *)value {
    [self willChangeValueForKey:@"mechanics" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"mechanics"] minusSet:value];
    [self didChangeValueForKey:@"mechanics" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addCategoriesObject:(DBCategory *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"categories" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"categories"] addObject:value];
    [self didChangeValueForKey:@"categories" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeCategoriesObject:(DBCategory *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"categories" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"categories"] removeObject:value];
    [self didChangeValueForKey:@"categories" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addCategories:(NSSet *)value {    
    [self willChangeValueForKey:@"categories" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"categories"] unionSet:value];
    [self didChangeValueForKey:@"categories" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeCategories:(NSSet *)value {
    [self willChangeValueForKey:@"categories" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"categories"] minusSet:value];
    [self didChangeValueForKey:@"categories" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addArtistsObject:(DBPerson *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"artists" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"artists"] addObject:value];
    [self didChangeValueForKey:@"artists" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeArtistsObject:(DBPerson *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"artists" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"artists"] removeObject:value];
    [self didChangeValueForKey:@"artists" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addArtists:(NSSet *)value {    
    [self willChangeValueForKey:@"artists" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"artists"] unionSet:value];
    [self didChangeValueForKey:@"artists" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeArtists:(NSSet *)value {
    [self willChangeValueForKey:@"artists" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"artists"] minusSet:value];
    [self didChangeValueForKey:@"artists" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addWishedByObject:(DBPerson *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"wishedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"wishedBy"] addObject:value];
    [self didChangeValueForKey:@"wishedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeWishedByObject:(DBPerson *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"wishedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"wishedBy"] removeObject:value];
    [self didChangeValueForKey:@"wishedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addWishedBy:(NSSet *)value {    
    [self willChangeValueForKey:@"wishedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"wishedBy"] unionSet:value];
    [self didChangeValueForKey:@"wishedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeWishedBy:(NSSet *)value {
    [self willChangeValueForKey:@"wishedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"wishedBy"] minusSet:value];
    [self didChangeValueForKey:@"wishedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addPlayedByObject:(DBPerson *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"playedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"playedBy"] addObject:value];
    [self didChangeValueForKey:@"playedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removePlayedByObject:(DBPerson *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"playedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"playedBy"] removeObject:value];
    [self didChangeValueForKey:@"playedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addPlayedBy:(NSSet *)value {    
    [self willChangeValueForKey:@"playedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"playedBy"] unionSet:value];
    [self didChangeValueForKey:@"playedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removePlayedBy:(NSSet *)value {
    [self willChangeValueForKey:@"playedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"playedBy"] minusSet:value];
    [self didChangeValueForKey:@"playedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


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


- (void)addOwnedByObject:(DBPerson *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"ownedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"ownedBy"] addObject:value];
    [self didChangeValueForKey:@"ownedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeOwnedByObject:(DBPerson *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"ownedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"ownedBy"] removeObject:value];
    [self didChangeValueForKey:@"ownedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addOwnedBy:(NSSet *)value {    
    [self willChangeValueForKey:@"ownedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"ownedBy"] unionSet:value];
    [self didChangeValueForKey:@"ownedBy" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeOwnedBy:(NSSet *)value {
    [self willChangeValueForKey:@"ownedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"ownedBy"] minusSet:value];
    [self didChangeValueForKey:@"ownedBy" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addDesignersObject:(DBPerson *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"designers" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"designers"] addObject:value];
    [self didChangeValueForKey:@"designers" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeDesignersObject:(DBPerson *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"designers" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"designers"] removeObject:value];
    [self didChangeValueForKey:@"designers" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addDesigners:(NSSet *)value {    
    [self willChangeValueForKey:@"designers" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"designers"] unionSet:value];
    [self didChangeValueForKey:@"designers" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeDesigners:(NSSet *)value {
    [self willChangeValueForKey:@"designers" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"designers"] minusSet:value];
    [self didChangeValueForKey:@"designers" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


- (void)addPublishersObject:(DBPublisher *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"publishers" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"publishers"] addObject:value];
    [self didChangeValueForKey:@"publishers" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removePublishersObject:(DBPublisher *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"publishers" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"publishers"] removeObject:value];
    [self didChangeValueForKey:@"publishers" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addPublishers:(NSSet *)value {    
    [self willChangeValueForKey:@"publishers" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"publishers"] unionSet:value];
    [self didChangeValueForKey:@"publishers" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removePublishers:(NSSet *)value {
    [self willChangeValueForKey:@"publishers" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"publishers"] minusSet:value];
    [self didChangeValueForKey:@"publishers" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
