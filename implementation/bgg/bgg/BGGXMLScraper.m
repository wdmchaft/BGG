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
#import "BGGIdNameLookup.h"
#import "BGGBoardGameVideo.h"

@interface BGGXMLScraper (Private)

-(id) executeXPath:(NSString*) path :(NSData*) document;
-(NSArray*) getIdNameCollection:(NSData *)document :(NSString*) idPath :(NSString*) namePath;
-(NSArray*) getVideos:(NSData *)document;

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
        result.rank = [NSNumber numberWithInt:[[self executeXPath:@"/items/item/statistics/ratings/ranks/rank[@type='subtype']/@value" :document]intValue] ];
        result.rating = [NSNumber numberWithInt:[[self executeXPath:@"/items/item/statistics/ratings/average/@value" :document] doubleValue] ];
        result.ratingCount = [NSNumber numberWithInt:[[self executeXPath:@"/items/item/statistics/ratings/usersrated/@value" :document]intValue] ];
    
        [result.categories addObjectsFromArray:
         [self getIdNameCollection:document
                                  :@"/items/item/link[@type='boardgamecategory']/@id"
                                  :@"/items/item/link[@type='boardgamecategory']/@value"]];
        [result.publishers addObjectsFromArray:
         [self getIdNameCollection:document
                                  :@"/items/item/link[@type='boardgamepublisher']/@id"
                                  :@"/items/item/link[@type='boardgamepublisher']/@value"]];
        [result.mechanics addObjectsFromArray:
         [self getIdNameCollection:document
                                  :@"/items/item/link[@type='boardgamemechanic']/@id"
                                  :@"/items/item/link[@type='boardgamemechanic']/@value"]];
        [result.designers addObjectsFromArray:
         [self getIdNameCollection:document
                                  :@"/items/item/link[@type='boardgamedesigner']/@id"
                                  :@"/items/item/link[@type='boardgamedesigner']/@value"]];
        [result.artists addObjectsFromArray:
         [self getIdNameCollection:document
                                  :@"/items/item/link[@type='boardgameartist']/@id"
                                  :@"/items/item/link[@type='boardgameartist']/@value"]];
        
        
        [result.videos addObjectsFromArray:[self getVideos:document]];
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

-(NSArray*) getVideos:(NSData *)document
{
    NSArray* ids = PerformXMLXPathQuery(document, @"/items/item/videos/video/@id");
    NSArray* titles = PerformXMLXPathQuery(document, @"/items/item/videos/video/@title");
    NSArray* categories = PerformXMLXPathQuery(document, @"/items/item/videos/video/@category");
    NSArray* languages = PerformXMLXPathQuery(document, @"/items/item/videos/video/@language");
    NSArray* links = PerformXMLXPathQuery(document, @"/items/item/videos/video/@link");
    NSArray* usernames = PerformXMLXPathQuery(document, @"/items/item/videos/video/@username");
    NSArray* userids = PerformXMLXPathQuery(document, @"/items/item/videos/video/@userid");
    NSArray* postDates = PerformXMLXPathQuery(document, @"/items/item/videos/video/@postdate");
    
    ICAssert([ids count] == [titles count], @"XmlVideos: should have same count_1!");
    ICAssert([titles count] == [categories count], @"XmlVideos: should have same count_2!");
    ICAssert([categories count] == [languages count], @"XmlVideos: should have same count_3!");
    ICAssert([languages count] == [links count], @"XmlVideos: should have same count_4!");
    ICAssert([links count] == [usernames count], @"XmlVideos: should have same count_5!");
    ICAssert([usernames count] == [userids count], @"XmlVideos: should have same count_6!");
    ICAssert([userids count] == [postDates count], @"XmlVideos: should have same count_7!");
    
    
    NSMutableArray* resultArray = [[[NSMutableArray alloc] initWithCapacity:[ids count]] autorelease];
    
    for(int i = 0; i < [ids count]; i++)
    {
        BGGBoardGameVideo* gameVideo = [[[BGGBoardGameVideo alloc] init] autorelease];
        
        gameVideo.id = [[ids objectAtIndex:i] objectForKey:@"nodeContent"];
        gameVideo.title = [[titles objectAtIndex:i] objectForKey:@"nodeContent"];
        gameVideo.category = [[categories objectAtIndex:i] objectForKey:@"nodeContent"];
        gameVideo.language = [[languages objectAtIndex:i] objectForKey:@"nodeContent"];
        gameVideo.link = [[links objectAtIndex:i] objectForKey:@"nodeContent"];
        gameVideo.userName = [[usernames objectAtIndex:i] objectForKey:@"nodeContent"];
        gameVideo.userId = [[userids objectAtIndex:i] objectForKey:@"nodeContent"];
        
        [resultArray addObject:gameVideo];
    }
    
    return resultArray;
}

-(NSArray*) getIdNameCollection:(NSData *)document :(NSString*) idPath :(NSString*) namePath
{
    NSArray* categoriesIds = PerformXMLXPathQuery(document, idPath);
    NSArray* categoriesNames = PerformXMLXPathQuery(document, namePath);
    
    ICAssert([categoriesIds count] == [categoriesNames count], @"Should have same count of ids and names");
 
    NSMutableArray* resultArray = [[[NSMutableArray alloc] initWithCapacity:[categoriesIds count]] autorelease];
    
    for(int i = 0; i < [categoriesIds count] ; i++)
    {
        BGGIdNameLookup* idNameLookup = [[[BGGIdNameLookup alloc] init] autorelease];
        
        idNameLookup.id = [[categoriesIds objectAtIndex:i] objectForKey:@"nodeContent"];
        idNameLookup.name = [[categoriesNames objectAtIndex:i] objectForKey:@"nodeContent"];
        
        [resultArray addObject:idNameLookup];
    }
    
    return resultArray;
}

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
