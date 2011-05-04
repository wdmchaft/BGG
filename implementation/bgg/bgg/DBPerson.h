//
//  DBPerson.h
//  bgg
//
//  Created by João Caxaria on 5/4/11.
//  Copyright (c) 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBBoardGame, DBVideos;

@interface DBPerson : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* boardGamesDesigner;
@property (nonatomic, retain) NSSet* boardGamesArtist;
@property (nonatomic, retain) NSSet* videos;

@end
