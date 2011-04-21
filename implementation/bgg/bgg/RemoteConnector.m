//
//  RemoteConnector.m
//  Hole19App
//
//  Created by João Caxaria on 2/15/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "RemoteConnector.h"
#import "DataLoader.h"
#import "CJSONDeserializer.h"
#import "Globals.h"


@interface RemoteConnector (Private)

@end


@implementation RemoteConnector

static NSString * _server = @"http://www.boardgamegeek.com/";

+(NSString*) server
{
	return [NSString stringWithFormat:@"%@%@", _server, @"%@"];
}

-(id) init
{
	self = [super init];
	
	flagDictionary = [[NSMutableDictionary alloc] init];
	
	return self;
}

-(void) dealloc
{
	[flagDictionary release];
	flagDictionary = nil;
	[super dealloc];
}

-(NSDictionary*) generateResult:(id) data :(NSString*) key
{
	return [NSDictionary dictionaryWithObjectsAndKeys:data, @"data", key, @"key", nil]; 
}


#pragma mark Raw Request
-(NSString*) getRawRequest:(NSString*)url
{
    NSString* requestIdentifier = url;
	
	if([flagDictionary valueForKey:requestIdentifier] != nil)
		return requestIdentifier;
	[flagDictionary setValue:[NSNumber numberWithBool:YES] forKey:requestIdentifier];
	
	DataLoader* loader = [[DataLoader alloc] init];
	loader.tag = requestIdentifier;
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(gotRawRequest:) 
												 name:Notifications_DataLoader 
											   object:loader];
	
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:timeout];
	
	[loader performRequest:request];
	
	return requestIdentifier;
}

-(void) gotRawRequest:(NSNotification*) sender
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:Notifications_DataLoader object:[sender object]];
	NSString* requestIdentifier = [(DataLoader*)[sender object] tag];
	NSData* remoteData = [[sender object] getData];
	
    
	[[NSNotificationCenter defaultCenter] postNotificationName:requestIdentifier 
                                                        object:[self generateResult:remoteData :requestIdentifier]];
	[flagDictionary removeObjectForKey:requestIdentifier];
}
@end




@implementation RemoteConnector (Private)


@end

