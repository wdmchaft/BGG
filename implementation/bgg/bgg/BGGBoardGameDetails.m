//
//  BGGBoardGameDetails.m
//  bgg
//
//  Created by João Caxaria on 5/4/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BGGBoardGameDetails.h"


@implementation BGGBoardGameDetails

@synthesize gameId;
@synthesize gameDescription;
@synthesize yearPublished;
@synthesize minPlayers;
@synthesize maxPlayers;
@synthesize playingTime;
@synthesize minAge;

-(id) init {
    self = [super init];
    
	return self;
}

- (void) dealloc
{
	[gameId release];
	[gameDescription release];
	[yearPublished release];
	[minPlayers release];
	[maxPlayers release];
	[playingTime release];
	[minAge release];
	[super dealloc];
}

@end
