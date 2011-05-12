//
//  DataAccess+BoardGame.h
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBCategory.h"

@interface DataAccess (Category)


-(DBCategory*) getCreateCategory:(NSString*) cId;
-(DBCategory*) createCategory;
-(DBCategory*) getCategoryById:(NSString*) cId;

@end
