//
//  BGGBoardGameVideo.h
//  bgg
//
//  Created by João Caxaria on 5/12/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BGGBoardGameVideo : NSObject {
    NSString* _id;
    NSString* _title;
    NSString* _category;
    NSString* _language;
    NSString* _link;
    NSString* _userId;
    NSString* _userName;
    NSDate* _postDate;
}

@property (nonatomic, retain) NSString* id;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* category;
@property (nonatomic, retain) NSString* language;
@property (nonatomic, retain) NSString* link;
@property (nonatomic, retain) NSString* userId;
@property (nonatomic, retain) NSString* userName;
@property (nonatomic, retain) NSDate* postDate;

@end
