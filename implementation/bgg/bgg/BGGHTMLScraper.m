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
#import "BBGSearchResult.h"
#import "BGGForum.h"
#import "BGGThread.h"
#import "BGGMessage.h"
#import "XPathQuery.h"

@implementation BGGHTMLScraper

#pragma mark Private


-(NSArray *) scrapeGamesFromTop100:(NSData *)document
{
    NSMutableArray *results = [NSMutableArray array];
    
    for(int i = 1; i <= 100; i++)
    {
        NSString* imageXPath = [NSString stringWithFormat:@"//tr[@id='row_'][%d]/td[@class='collection_thumbnail']/a/img/@src", i];
        NSArray* imageResult = PerformHTMLXPathQuery(document, imageXPath);
        
        if(imageResult == nil || [imageResult count] != 1)
            continue;
        
        NSString* nameXPath = [NSString stringWithFormat:@"//tr[@id='row_'][%d]/td[3]/div[2]/a/text()", i];
        NSArray* nameResult = PerformHTMLXPathQuery(document, nameXPath);
        
        if(nameResult == nil || [nameResult count] != 1)
            continue;

        NSString* urlXPath = [NSString stringWithFormat:@"//tr[@id='row_'][%d]/td[3]/div[2]/a/@href", i];
        NSArray* urlResult = PerformHTMLXPathQuery(document, urlXPath);
        
        if(urlResult == nil || [urlResult count] != 1)
            continue;
   
        BBGSearchResult *result = [[[BBGSearchResult alloc] init] autorelease];
        
        result.gameId = [[urlResult objectAtIndex:0] objectForKey:@"nodeContent"];
        result.primaryTitle = [[nameResult objectAtIndex:0] objectForKey:@"nodeContent"];
        result.imageURL = [[imageResult objectAtIndex:0] objectForKey:@"nodeContent"];;
        
        
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
