//
//  DBBoardGame+Images.m
//  bgg
//
//  Created by João Caxaria on 4/21/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "DBBoardGame+Images.h"
#import "StorageHelper.h"

@implementation DBBoardGame (Images)


-(UIImage*) previewImage
{
    NSString* filenamePath = [NSString stringWithFormat:@"/%@/preview.png", self.gameId];
    
    UIImage* result = [UIImage imageWithContentsOfFile:[[StorageHelper baseStorageDirectory] stringByAppendingPathComponent:filenamePath]];

    return result;
}


@end
