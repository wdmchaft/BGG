//
//  PersonRemoteConnector.m
//  bgg
//
//  Created by João Caxaria on 5/17/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "PersonRemoteConnector.h"
#import "DataLoader.h"
#import "BGGXMLScraper.h"
#import "BGGPerson.h"

@implementation RemoteConnector (Person)

-(NSString*) getUserDetails:(NSString*) username
{
    static NSString* requestString = @"xmlapi2/user?name=%@";
    NSString* finalRequest = [NSString stringWithFormat:[RemoteConnector server],[NSString stringWithFormat:requestString, username]];
    
    return [self getRawRequest:finalRequest target:self selector:@selector(loadedUserDetails:)];
}



-(void) loadedUserDetails:(NSNotification*) sender
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:Notifications_DataLoader object:[sender object]];
	NSString* requestIdentifier = [(DataLoader*)[sender object] tag];
	NSData* remoteData = [[sender object] getData];
	[[sender object] autorelease];
	
    BGGXMLScraper* scraper = [[[BGGXMLScraper alloc] init] autorelease];
    
    BGGPerson * person = [scraper getUserDetails:remoteData];
    
	[[NSNotificationCenter defaultCenter] postNotificationName:requestIdentifier object:[self generateResult:person :requestIdentifier]];
	[flagDictionary removeObjectForKey:requestIdentifier];
}

#pragma mark user owned

//xmlapi2/collection?username=caxaria&stats=1&own=1&played=1&wishlist=0

-(NSString*) getUserOwnedCollection:(NSString*) username
{
    static NSString* requestString = @"xmlapi2/collection?username=%@&stats=1&own=1";
    NSString* finalRequest = [NSString stringWithFormat:[RemoteConnector server],[NSString stringWithFormat:requestString, username]];
    
    return [self getRawRequest:finalRequest target:self selector:@selector(loadedUserCollection:)];
}

-(NSString*) getUserPlayedCollection:(NSString*) username
{
    static NSString* requestString = @"xmlapi2/collection?username=%@&stats=1&played=1";
    NSString* finalRequest = [NSString stringWithFormat:[RemoteConnector server],[NSString stringWithFormat:requestString, username]];
    
    return [self getRawRequest:finalRequest target:self selector:@selector(loadedUserCollection:)];
}

-(NSString*) getUserWishlistCollection:(NSString*) username
{
    static NSString* requestString = @"xmlapi2/collection?username=%@&stats=1&wishlist=1";
    NSString* finalRequest = [NSString stringWithFormat:[RemoteConnector server],[NSString stringWithFormat:requestString, username]];
    
    return [self getRawRequest:finalRequest target:self selector:@selector(loadedUserCollection:)];
}

-(void) loadedUserCollection:(NSNotification*) sender
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:Notifications_DataLoader object:[sender object]];
	NSString* requestIdentifier = [(DataLoader*)[sender object] tag];
	NSData* remoteData = [[sender object] getData];
	[[sender object] autorelease];
	
    BGGXMLScraper* scraper = [[[BGGXMLScraper alloc] init] autorelease];
    
    NSArray * collection = [scraper getUserCollection:remoteData];
    
	[[NSNotificationCenter defaultCenter] postNotificationName:requestIdentifier object:[self generateResult:collection :requestIdentifier]];
	[flagDictionary removeObjectForKey:requestIdentifier];
}

@end
