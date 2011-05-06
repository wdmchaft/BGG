//
//  BGGBoardGameDetails.m
//  bgg
//
//  Created by João Caxaria on 5/4/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BGGBoardGame.h"


@implementation BGGBoardGame

@synthesize gameId;
@synthesize gameDescription;
@synthesize yearPublished;
@synthesize minPlayers;
@synthesize maxPlayers;
@synthesize playingTime;
@synthesize minAge;
@synthesize primaryTitle;
@synthesize imageMainURL;
@synthesize imagePreviewURL;
@synthesize rank;

-(id) init {
    self = [super init];
    
	return self;
}

- (void) dealloc
{
	[primaryTitle release];
	[gameId release];
	[imageMainURL release];
	[imagePreviewURL release];
	[rank release];
	[gameDescription release];
	[yearPublished release];
	[minPlayers release];
	[maxPlayers release];
	[playingTime release];
	[minAge release];
	[super dealloc];
}

@end
