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


static NSString * top100Key = @"top100Key";

-(NSString*) getTop100;
{
	NSString* requestIdentifier = top100Key;
	
	if([flagDictionary valueForKey:requestIdentifier] != nil)
		return requestIdentifier;
	[flagDictionary setValue:[NSNumber numberWithBool:YES] forKey:requestIdentifier];
	
	DataLoader* loader = [[DataLoader alloc] init];
	loader.tag = requestIdentifier;
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(loadedTop100:) 
												 name:Notifications_DataLoader 
											   object:loader];
	
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString: 
                                     [NSString stringWithFormat:
                                      [RemoteConnector server], @"browse/boardgame/top100.cache.html"]]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:timeout];
	
	[loader performRequest:request];
	
	return requestIdentifier;
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

#pragma mark GameDetails

static NSString * getGameDetailsKey = @"getGameDetailsKey";

-(NSString*) getGameDetails:(NSString*) gameId
{
    NSString* requestIdentifier = [NSString stringWithFormat:@"%@_%@", getGameDetailsKey, gameId];;
	
	if([flagDictionary valueForKey:requestIdentifier] != nil)
		return requestIdentifier;
	[flagDictionary setValue:[NSNumber numberWithBool:YES] forKey:requestIdentifier];
	
    NSString* requestString = @"xmlapi2/thing?type=boardgame&id=%@&versions=0&videos=1&stats=1&historical=0&comments=0&ratingcomments=0";
	DataLoader* loader = [[DataLoader alloc] init];
	loader.tag = requestIdentifier;
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(loadedGameDetails:) 
												 name:Notifications_DataLoader 
											   object:loader];
	
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString: 
                                     [NSString stringWithFormat:
                                      [RemoteConnector server], 
                                      [NSString stringWithFormat:requestString, gameId]]]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:timeout];
	
	[loader performRequest:request];
	
	return requestIdentifier;
    
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
