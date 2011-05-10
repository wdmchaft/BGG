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
@synthesize rating;
@synthesize ratingCount;
@synthesize categories;
@synthesize publishers;
@synthesize mechanics;
@synthesize designers;
@synthesize artists;
@synthesize videos;


-(id) init {
    self = [super init];
    
    categories = [[NSMutableArray arrayWithCapacity:0] retain];
    publishers = [[NSMutableArray arrayWithCapacity:0] retain];
    mechanics = [[NSMutableArray arrayWithCapacity:0] retain];
    designers = [[NSMutableArray arrayWithCapacity:0] retain];
    artists = [[NSMutableArray arrayWithCapacity:0] retain];
    videos = [[NSMutableArray arrayWithCapacity:0] retain];
    
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
	[rating release];
	[ratingCount release];
    [categories release];
    [publishers release];
    [mechanics release];
    [designers release];
    [artists release];
    [videos release];
	[super dealloc];
}

@end
