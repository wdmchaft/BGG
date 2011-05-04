//
//  DBPublisher.h
//  bgg
//
//  Created by João Caxaria on 5/4/11.
//  Copyright (c) 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBBoardGame;

@interface DBPublisher : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* boardGames;

@end
