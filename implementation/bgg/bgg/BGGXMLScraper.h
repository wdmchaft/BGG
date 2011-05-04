//
//  BGGXMLScraper.h
//  bgg
//
//  Created by João Caxaria on 5/3/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BGGBoardGame;

@interface BGGXMLScraper : NSObject {
    
}

-(BGGBoardGame*) getGameDetails:(NSData *)document;

@end
