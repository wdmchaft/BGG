//
//  DBBoardGame.h
//  bgg
//
//  Created by João Caxaria on 5/12/11.
//  Copyright (c) 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBCategory, DBMechanic, DBPerson, DBPublisher, DBVideos;

@interface DBBoardGame : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSNumber * hasDetails;
@property (nonatomic, retain) NSDate * updated;
@property (nonatomic, retain) NSString * primaryTitle;
@property (nonatomic, retain) NSString * gameId;
@property (nonatomic, retain) NSNumber * ratingCount;
@property (nonatomic, retain) NSNumber * yearPublished;
@property (nonatomic, retain) NSNumber * minPlayers;
@property (nonatomic, retain) NSNumber * rank;
@property (nonatomic, retain) NSNumber * minAge;
@property (nonatomic, retain) NSString * gameDescription;
@property (nonatomic, retain) NSNumber * maxPlayers;
@property (nonatomic, retain) NSNumber * playingTime;
@property (nonatomic, retain) NSSet* categories;
@property (nonatomic, retain) NSSet* videos;
@property (nonatomic, retain) NSSet* publishers;
@property (nonatomic, retain) NSSet* artists;
@property (nonatomic, retain) NSSet* mechanics;
@property (nonatomic, retain) NSSet* designers;

@end
