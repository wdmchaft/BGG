//
//  BGGXMLScraper.m
//  bgg
//
//  Created by João Caxaria on 5/3/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "BGGXMLScraper.h"
#import "BGGBoardGame.h"
#import "XPathQuery.h"

@interface BGGXMLScraper (Private)

-(id) executeXPath:(NSString*) path :(NSData*) document;

@end

@implementation BGGXMLScraper

-(BGGBoardGame*) getGameDetails:(NSData *)document
{
    
    BGGBoardGame* result = [[[BGGBoardGame alloc] init] autorelease];
    
    @try {
        result.gameId = [self executeXPath:@"/items/item/@id" :document];
        result.primaryTitle = [self executeXPath:@"/items/item/name[@type='primary']/@value" :document];
        result.imagePreviewURL = [self executeXPath:@"/items/item/thumbnail/text()" :document];
        result.imageMainURL = [self executeXPath:@"/items/item/image/text()" :document];
        result.gameDescription = [self executeXPath:@"/items/item/description/text()" :document];
        result.yearPublished = [NSNumber numberWithInt:[[self executeXPath:@"/items/item/yearpublished/@value" :document]intValue] ];
        result.minPlayers = [NSNumber numberWithInt:[[self executeXPath:@"/items/item/minplayers/@value" :document]intValue] ];
        result.maxPlayers = [NSNumber numberWithInt:[[self executeXPath:@"/items/item/maxplayers/@value" :document]intValue] ];
        result.playingTime = [NSNumber numberWithInt:[[self executeXPath:@"/items/item/playingtime/@value" :document]intValue] ];
        result.minAge = [NSNumber numberWithInt:[[self executeXPath:@"/items/item/minage/@value" :document]intValue] ];
        result.rank =  [NSNumber numberWithInt:[[self executeXPath:@"/items/item/statistics/ratings/ranks/rank[@type='subtype']/@value" :document]intValue] ];
    }
    @catch (NSException *exception) {
        ICL([exception reason]);
        return nil;
    }
    @finally {
    }
    
    return result;
}

#pragma mark private

-(id) executeXPath:(NSString*) path :(NSData*) document
{
    NSArray* result = PerformXMLXPathQuery(document, path);
    
    if(result == nil || [result count] == 0)
        @throw [NSException exceptionWithName:@"NSxPathException"
                                       reason:[NSString stringWithFormat:@"%@:%@",
                                               @"Invalid xpath", path]
                                     userInfo:nil];
    
    return [[result objectAtIndex:0] objectForKey:@"nodeContent"];
}

@end
