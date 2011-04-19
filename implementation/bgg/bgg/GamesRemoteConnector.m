//
//  GamesRemoteConnector.m
//  bgg
//
//  Created by João Caxaria on 4/19/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "GamesRemoteConnector.h"
#import "BGGHTMLScraper.h"
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
	
    NSString *document = [[[NSString alloc] initWithData:remoteData encoding:NSUTF8StringEncoding] autorelease];
	
	BGGHTMLScraper* scraper = [[[BGGHTMLScraper alloc] init] autorelease];
    
    NSArray * games = [scraper scrapeGamesFromTop100:document];
    
	[[NSNotificationCenter defaultCenter] postNotificationName:requestIdentifier object:[self generateResult:games :requestIdentifier]];
	[flagDictionary removeObjectForKey:requestIdentifier];
}





@end
