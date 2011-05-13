//
//  BoardGameCommentsController.h
//  bgg
//
//  Created by Ana Oliveira on 5/13/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BoardGameCommentsController : UITableViewController {
    NSArray* _ratings;
}

-(void) setRatings:(NSArray*) ratings;

@end
