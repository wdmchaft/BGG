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
        
        
        [[idResult objectAtIndex:0] objectForKey:@"nodeContent"];
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        
    }
    
    
    
    NSString* idXPath = ;
    NSArray* idResult = PerformXMLXPathQuery(document, idXPath);
    
    if([idResult count] == 0)
        return nil;
    
    NSString* titleXPath = @"/items/item/name[type='primary']/@value";
    NSArray* titleResult = PerformXMLXPathQuery(document, titleXPath);
    
    if([titleResult count] == 0)
        return nil;
    
    NSString* imagePreviewXPath = @"/items/item/thumbnail";
    NSArray* imagePreviewResult = PerformXMLXPathQuery(document, imagePreviewXPath);
    
    if([imagePreviewResult count] == 0)
        return nil;
    
    NSString* imageMainXPath = @"/items/item/image";
    NSArray* imageMainResult = PerformXMLXPathQuery(document, imageMainXPath);
    
    if([imageMainResult count] == 0)
        return nil;
    
    NSString* descriptionXPath = @"/items/item/description";
    NSArray* descriptionResult = PerformXMLXPathQuery(document, descriptionXPath);
    
    if([descriptionResult count] == 0)
        return nil;
    
    NSString* yearPublishedXPath = @"/items/item/yearpublished/@value";
    NSArray* yearPublishedResult = PerformXMLXPathQuery(document, yearPublishedXPath);
    
    if([yearPublishedResult count] == 0)
        return nil;
    
    NSString* minPlayersXPath = @"/items/item/minplayers/@value";
    NSArray* minPlayersResult = PerformXMLXPathQuery(document, minPlayersXPath);
    
    if([minPlayersResult count] == 0)
        return nil;
    
    NSString* maxPlayersXPath = @"/items/item/maxplayers/@value";
    NSArray* maxPlayersResult = PerformXMLXPathQuery(document, maxPlayersXPath);
    
    if([maxPlayersResult count] == 0)
        return nil;
    
    NSString* playingTimeXPath = @"/items/item/playingtime/@value";
    NSArray* playingTimeResult = PerformXMLXPathQuery(document, playingTimeXPath);
    
    if([playingTimeResult count] == 0)
        return nil;
    
    NSString* minAgeXPath = @"/items/item/minage/@value";
    NSArray* minAgeResult = PerformXMLXPathQuery(document, minAgeXPath);
    
    if([minAgeResult count] == 0)
        return nil;
    
    NSString* rankXPath = @"/items/item/statistics/ranks/rank[type='subtype']/@value";
    NSArray* rankResult = PerformXMLXPathQuery(document, rankXPath);
    
    if([rankResult count] == 0)
        return nil;
    
    
    
}

#pragma mark private

-(id) executeXPath:(NSString*) path :(NSData*) document
{
    NSArray* result = PerformXMLXPathQuery(document, path);
    
    if([result count] == 0)
        @throw [NSException exceptionWithName:@"NSxPathException"
                                       reason:@"Invalid xpath" 
                                     userInfo:nil];
    
    return [[result objectAtIndex:0] objectForKey:@"nodeContent"];
}

@end
