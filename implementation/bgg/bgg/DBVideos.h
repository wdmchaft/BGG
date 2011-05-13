//
//  DBVideos.h
//  bgg
//
//  Created by João Caxaria on 5/12/11.
//  Copyright (c) 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBBoardGame, DBPerson;

@interface DBVideos : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * language;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSDate * postdate;
@property (nonatomic, retain) DBBoardGame * boardGames;
@property (nonatomic, retain) DBPerson * user;

@end
