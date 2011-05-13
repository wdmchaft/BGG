//
//  BGGBoardGameRatings.h
//  bgg
//
//  Created by João Caxaria on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BGGBoardGameRating : NSObject {
    NSString * username;
    NSString * comment;
    NSNumber * rating;

}

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) NSNumber * rating;

@end
