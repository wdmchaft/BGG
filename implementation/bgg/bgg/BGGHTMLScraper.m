/*
 Copyright 2010 Petteri Kamppuri
 
 Licensed under the Apache License, Version 2.0 (the "License"); 
 you may not use this file except in compliance with the License. 
 You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 
 
 Unless required by applicable law or agreed to in writing, software distributed under the 
 License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
 either express or implied. See the License for the specific 
 language governing permissions and limitations under the License. 
 */ 

//
//  BGGHTMLScraper.m
//  BGG
//
//  Created by Petteri Kamppuri on 3.1.2010.
//  Copyright 2010 Petteri Kamppuri. All rights reserved.
//

#import "BGGHTMLScraper.h"
#import "BGGBoardGame.h"
#import "XPathQuery.h"

@implementation BGGHTMLScraper

#pragma mark Private


-(NSArray *) scrapeGamesFromTop100:(NSData *)document
{
    NSMutableArray *results = [NSMutableArray array];
    
    
    NSString* imageXPath = @"//tr[@id='row_']/td[@class='collection_thumbnail']/a/img/@src";
    NSArray* imageResult = PerformHTMLXPathQuery(document, imageXPath);
    
    ICAssert(imageResult != nil, @"InitialSync: should have images!");
    
    NSString* nameXPath = @"//tr[@id='row_']/td[3]/div[2]/a/text()";
    NSArray* nameResult = PerformHTMLXPathQuery(document, nameXPath);
    
    ICAssert(nameResult != nil, @"InitialSync: should have names!");
    
    NSString* urlXPath = @"//tr[@id='row_']/td[3]/div[2]/a/@href";
    NSArray* urlResult = PerformHTMLXPathQuery(document, urlXPath);
    
    ICAssert(urlResult != nil, @"InitialSync: should have urls!");    
    
    ICAssert([imageResult count] == [urlResult count], @"InitialSync: should have same count_1!");
    ICAssert([urlResult count] == [nameResult count], @"InitialSync: should have same count_2!");
    
    for(int i = 0; i < [nameResult count]; i++)
    {
        BGGBoardGame *result = [[[BGGBoardGame alloc] init] autorelease];
        
        result.gameId = [[urlResult objectAtIndex:i] objectForKey:@"nodeContent"];
        result.primaryTitle = [[nameResult objectAtIndex:i] objectForKey:@"nodeContent"];
        result.imageURL = [[imageResult objectAtIndex:i] objectForKey:@"nodeContent"];;
        result.rank = [NSNumber numberWithInt:i+1];
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"/[0-9]+/" options:NSRegularExpressionCaseInsensitive error:nil];
        NSArray* matches = [regex matchesInString:result.gameId options:0 range:NSMakeRange(0, [result.gameId length])];
        
        if(matches == nil || [matches count] != 1)
            continue;
        
        for (NSTextCheckingResult* match in matches) {
            result.gameId = [result.gameId substringWithRange:NSMakeRange(match.range.location+1, match.range.length-2)];
        }
        
        [results addObject:result];
    }
    
    
    return results;

}

@end
