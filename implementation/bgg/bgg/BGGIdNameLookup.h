//
//  BGGIdNameLookup.h
//  bgg
//
//  Created by João Caxaria on 5/10/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BGGIdNameLookup : NSObject {
    NSString* _id;
    NSString* _name;
}

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * name;

@end
