//
//  DBBoardGame.h
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright (c) 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBBoardGame : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * gameId;
@property (nonatomic, retain) NSString * primaryTitle;
@property (nonatomic, retain) NSNumber * rank;

@end
