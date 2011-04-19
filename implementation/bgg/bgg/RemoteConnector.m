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

@end




@implementation RemoteConnector (Private)


@end

