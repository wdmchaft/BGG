//
//  HomeViewController.m
//  bgg
//
//  Created by João Caxaria on 4/6/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "HomeViewController.h"
#import "Globals.h"
#import "SSCollectionViewItem.h"

@implementation HomeViewController

-(id) init
{
	self = [self initWithNibName:@"HomeViewController" bundle:nil];
	
    [self setTitle:@"Home"];
    
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
///////////////////////////////////////////////////////////////////////////////////////////////////
// UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];	
    
    self.collectionView.backgroundColor = [UIColor clearColor];
	self.collectionView.minimumColumnSpacing = 20.0f;
    self.collectionView.rowSpacing = 40.0f;
    [self.collectionView.scrollView setContentInset:UIEdgeInsetsMake(40,0,0,0)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark SSCollectionViewDataSource

- (NSInteger)collectionView:(SSCollectionView *)aCollectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (NSInteger)numberOfSectionsInCollectionView:(SSCollectionView *)aCollectionView
{
    return 1;
}

- (SSCollectionViewItem *)collectionView:(SSCollectionView *)aCollectionView itemForIndexPath:(NSIndexPath *)indexPath {
	static NSString *const itemIdentifier = @"SSCollectionViewItem";
	
	SSCollectionViewItem *item = [aCollectionView dequeueReusableItemWithIdentifier:itemIdentifier];
	if (item == nil) {
		item = [[[SSCollectionViewItem alloc] initWithStyle:SSCollectionViewItemStyleImage reuseIdentifier:itemIdentifier] autorelease];
	}

	[item.imageView setImage:[UIImage imageNamed:@"menu-icon.png"]];
    [item.imageView setHighlightedImage:[UIImage imageNamed:@"menu-icon-selected.png"]];
	
    
    item.textLabel.backgroundColor = [UIColor clearColor];
    item.textLabel.frame = CGRectMake(0.0f, 70.0f, 80.0f, 20.0f);
    item.textLabel.font = [UIFont systemFontOfSize:12.0];
    
    NSString* title;
    
    switch (indexPath.row) {
        case 0:
            title = @"Board Games";
            break;
        case 1:
            title = @"My Profile";
            break;
        case 2:
            title = @"Forums";
            break;
        case 3:
            title = @"Around me";
            break;
        case 4:
            title = @"Statistics";
            break;
        case 5:
            title = @"Settings";
            break;
            
        default:
            title = @"$INVALID$";
            break;
    }
    
    item.textLabel.text = title;
	
	return item;
}


#pragma mark SSCollectionViewDelegate

- (CGSize)collectionView:(SSCollectionView *)aCollectionView itemSizeForSection:(NSInteger)section {
    return CGSizeMake(80.0f, 80.0f);
}

- (void)collectionView:(SSCollectionView *)aCollectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	HomeViewController* newController = [[[HomeViewController alloc] init] autorelease];
	[[[Globals sharedGlobals] breadcrumb] addViewController:newController animated:YES];
}

- (CGFloat)collectionView:(SSCollectionView *)aCollectionView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

@end
