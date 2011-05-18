//
//  GamesRemoteConnector.m
//  bgg
//
//  Created by João Caxaria on 4/19/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "GamesRemoteConnector.h"
#import "BGGHTMLScraper.h"
#import "BGGXMLScraper.h"
#import "DataLoader.h"

@implementation RemoteConnector (Games)

-(NSString*) getTop100;
{
    return [self getRawRequest:[NSString stringWithFormat:[RemoteConnector server], @"browse/boardgame/top100.cache.html"] 
                        target:self 
                      selector:@selector(loadedTop100:)];
}

-(void) loadedTop100:(NSNotification*) sender
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:Notifications_DataLoader object:[sender object]];
	NSString* requestIdentifier = [(DataLoader*)[sender object] tag];
	NSData* remoteData = [[sender object] getData];
	[[sender object] autorelease];
	
    BGGHTMLScraper* scraper = [[[BGGHTMLScraper alloc] init] autorelease];
    
    NSArray * games = [scraper scrapeGamesFromTop100:remoteData];
    
	[[NSNotificationCenter defaultCenter] postNotificationName:requestIdentifier object:[self generateResult:games :requestIdentifier]];
	[flagDictionary removeObjectForKey:requestIdentifier];
}

#pragma mark Game Ratings


-(NSString*) getGameRatings:(NSString*) gameId :(int) pageNumber
{
    NSString* requestString = @"xmlapi2/thing?type=boardgame&id=%@&versions=0&videos=0&stats=0&historical=0&page=%d&pagesize=100&ratingcomments=1";
	
    return [self getRawRequest:[NSString stringWithFormat:
                                [RemoteConnector server], 
                                [NSString stringWithFormat:requestString, gameId, pageNumber]]
                        target:self 
                      selector:@selector(loadedGameRatings:)];
}



-(void) loadedGameRatings:(NSNotification*) sender
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:Notifications_DataLoader object:[sender object]];
	NSString* requestIdentifier = [(DataLoader*)[sender object] tag];
	NSData* remoteData = [[sender object] getData];
	[[sender object] autorelease];
	
    BGGXMLScraper* scraper = [[[BGGXMLScraper alloc] init] autorelease];
    
    NSArray* ratings = [scraper getGameRatings:remoteData];
    
	[[NSNotificationCenter defaultCenter] postNotificationName:requestIdentifier object:[self generateResult:ratings :requestIdentifier]];
	[flagDictionary removeObjectForKey:requestIdentifier];
}


#pragma mark GameDetails

-(NSString*) getGameDetails:(NSString*) gameId
{
    NSString* requestString = @"xmlapi2/thing?type=boardgame&id=%@&versions=0&videos=1&stats=1&historical=0&comments=0&ratingcomments=0";
	
    return [self getRawRequest:[NSString stringWithFormat:
                                [RemoteConnector server], 
                                [NSString stringWithFormat:requestString, gameId]] 
                        target:self 
                      selector:@selector(loadedGameDetails:)];
}



-(void) loadedGameDetails:(NSNotification*) sender
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:Notifications_DataLoader object:[sender object]];
	NSString* requestIdentifier = [(DataLoader*)[sender object] tag];
	NSData* remoteData = [[sender object] getData];
	[[sender object] autorelease];
	
    BGGXMLScraper* scraper = [[[BGGXMLScraper alloc] init] autorelease];
    
    BGGBoardGame * game = [scraper getGameDetails:remoteData];
    
	[[NSNotificationCenter defaultCenter] postNotificationName:requestIdentifier object:[self generateResult:game :requestIdentifier]];
	[flagDictionary removeObjectForKey:requestIdentifier];
}



@end
