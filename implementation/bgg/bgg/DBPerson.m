//
//  DBPerson.m
//  bgg
//
//  Created by João Caxaria on 5/10/11.
//  Copyright (c) 2011 Imaginary Factory. All rights reserved.
//

#import "DBPerson.h"
#import "DBBoardGame.h"
#import "DBVideos.h"


@implementation DBPerson
@dynamic id;
@dynamic name;
@dynamic boardGamesDesigner;
@dynamic boardGamesArtist;
@dynamic videos;

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


@end
