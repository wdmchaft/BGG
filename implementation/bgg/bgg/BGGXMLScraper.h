//
//  BGGXMLScraper.h
//  bgg
//
//  Created by João Caxaria on 5/3/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BGGBoardGame,BGGPerson;

@interface BGGXMLScraper : NSObject {
    
}

-(BGGBoardGame*) getGameDetails:(NSData *)document;

-(NSArray*) getGameRatings:(NSData *)document;

-(BGGPerson*) getUserDetails:(NSData *)document;

-(NSArray*) getUserCollection:(NSData*) document;

@end
