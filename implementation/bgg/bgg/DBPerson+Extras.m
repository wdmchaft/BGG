//
//  DBPerson+Extras.m
//  bgg
//
//  Created by João Caxaria on 5/10/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DBPerson+Extras.h"

@interface DBPerson (Private)

-(bool) needsUpdate:(NSDate*) date;

@end

@implementation DBPerson (Extras)

-(void) updateFromBGGLookup:(BGGIdNameLookup*) bggLookup
{
    self.id = bggLookup.id;
    self.name = bggLookup.name;
    if(self.updatedOwnedGames == nil)
        self.updatedOwnedGames = [NSDate distantPast];
    if(self.updatedPlayedGames == nil)
        self.updatedPlayedGames = [NSDate distantPast];
    if(self.updatedWishedGames == nil)
        self.updatedWishedGames = [NSDate distantPast];
}

-(void) updateFromBGGPerson:(BGGPerson*) bggPerson
{
    self.id = bggPerson.id;
    self.name = bggPerson.name;
    self.username = bggPerson.username;
    if(self.updatedOwnedGames == nil)
        self.updatedOwnedGames = [NSDate distantPast];
    if(self.updatedPlayedGames == nil)
        self.updatedPlayedGames = [NSDate distantPast];
    if(self.updatedWishedGames == nil)
        self.updatedWishedGames = [NSDate distantPast];
}

-(bool) needsUpdateOwnedGames
{
    return [self needsUpdate:self.updatedOwnedGames];
}

-(bool) needsUpdatePlayedGames
{
    return [self needsUpdate:self.updatedPlayedGames];
}

-(bool) needsUpdateWishedGames
{
    return [self needsUpdate:self.updatedWishedGames];
}

-(bool) needsUpdate:(NSDate*) date
{
    int secondsInDay = 86400;
    NSDate * today = [NSDate date];
    NSDate * refDate = [NSDate dateWithTimeInterval:secondsInDay sinceDate:date]; 
    NSComparisonResult compared = [refDate compare:today];
    
    if(compared < 0)
        return YES;
    return NO;
}

@end
