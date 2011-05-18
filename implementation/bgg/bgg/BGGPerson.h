//
//  BGGPerson.h
//  bgg
//
//  Created by João Caxaria on 5/17/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BGGPerson : NSObject {
    NSString * username;
    NSString * name;
    NSString * _id;
    
}

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * id;

@end
