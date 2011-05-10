//
//  BGGBoardGameDetails.h
//  bgg
//
//  Created by João Caxaria on 5/4/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGGBoardGameLookup.h"

@interface BGGBoardGame : NSObject {
@private
    NSString * primaryTitle;
    NSString * gameId;
    NSNumber * rank;
    NSString * imagePreviewURL;
    NSString * imageMainURL;
    NSString * gameDescription;
    NSNumber * yearPublished;
    NSNumber * minPlayers;
    NSNumber * maxPlayers;
    NSNumber * playingTime;
    NSNumber * minAge;
    NSNumber * rating;
    NSNumber * ratingCount;
    NSMutableArray * categories;
    NSMutableArray * publishers;
    NSMutableArray * mechanics;
    NSMutableArray * designers;
    NSMutableArray * artists;
    NSMutableArray * videos;
}

@property (nonatomic, retain) NSString * primaryTitle;
@property (nonatomic, retain) NSString * gameId;
@property (nonatomic, retain) NSNumber * rank;
@property (nonatomic, retain) NSString * imagePreviewURL;
@property (nonatomic, retain) NSString * imageMainURL;
@property (nonatomic, retain) NSString * gameDescription;
@property (nonatomic, retain) NSNumber * yearPublished;
@property (nonatomic, retain) NSNumber * minPlayers;
@property (nonatomic, retain) NSNumber * maxPlayers;
@property (nonatomic, retain) NSNumber * playingTime;
@property (nonatomic, retain) NSNumber * minAge;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSNumber * ratingCount;
@property (nonatomic, readonly) NSMutableArray * categories;
@property (nonatomic, readonly) NSMutableArray * publishers;
@property (nonatomic, readonly) NSMutableArray * mechanics;
@property (nonatomic, readonly) NSMutableArray * designers;
@property (nonatomic, readonly) NSMutableArray * artists;
@property (nonatomic, readonly) NSMutableArray * videos;

@end
