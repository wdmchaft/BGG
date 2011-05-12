//
//  DBPerson+Extras.m
//  bgg
//
//  Created by João Caxaria on 5/10/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DBPerson+Extras.h"

@implementation DBPerson (Extras)

-(void) updateFromBGGLookup:(BGGIdNameLookup*) bggLookup
{
    self.id = bggLookup.id;
    self.name = bggLookup.name;
}

@end
