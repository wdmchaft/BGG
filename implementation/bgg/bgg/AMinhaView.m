//
//  AMinhaView.m
//  bgg
//
//  Created by João Caxaria on 4/26/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "AMinhaView.h"


@implementation AMinhaView

-(id) init
{
    self = [self initWithNibName:@"AMinhaView" bundle:nil];
    
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [aMinhaLabel setText:@"olá"];
}



@end
