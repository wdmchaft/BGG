//
//  BGGBoardGameDetails.h
//  bgg
//
//  Created by João Caxaria on 5/4/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BGGBoardGameDetails : NSObject {
@private
}

@property (nonatomic, retain) NSString * gameId;
@property (nonatomic, retain) NSString * gameDescription;
@property (nonatomic, retain) NSNumber * yearPublished;
@property (nonatomic, retain) NSNumber * minPlayers;
@property (nonatomic, retain) NSNumber * maxPlayers;
@property (nonatomic, retain) NSNumber * playingTime;
@property (nonatomic, retain) NSNumber * minAge;

@end
