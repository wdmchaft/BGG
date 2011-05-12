//
//  DataAccess+BoardGame.h
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBPerson.h"

@interface DataAccess (Person)

-(DBPerson*) getCreatePerson:(NSString*) cId;
-(DBPerson*) createPerson;
-(DBPerson*) getPersonById:(NSString*) cId;

@end
