

#import "BGGBoardGame.h"


@implementation BGGBoardGame

@synthesize primaryTitle;
@synthesize gameId;
@synthesize imageURL = imageURL;
@synthesize rank;


-(id) init {
    self = [super init];

	return self;
}


- (void) dealloc
{
	[primaryTitle release];
	[gameId release];
	[imageURL release];
	[rank release];
	[super dealloc];
}


@end
