//
//  SettingsViewController.m
//  bgg
//
//  Created by João Caxaria on 5/2/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "SettingsViewController.h"


@interface SettingsViewController (Private)
-(void) save;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the vi<ew if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    needsToSave = NO;
    bggUsername.text = [[Globals sharedGlobals] bggUsername];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) viewWillDisappear:(BOOL)animated
{
    if(needsToSave)
    {
        [self save];
    }
}

-(void) viewDidDisappear:(BOOL)animated
{

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UITextField
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    needsToSave = YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	
	[theTextField resignFirstResponder];
	
    [self save];
    
    return YES;
}

-(void) save
{
    [[Globals sharedGlobals] setBggUsername:[bggUsername text]];
    needsToSave = NO;
    SSHUDView* hud = [[[SSHUDView alloc] initWithTitle:@"Saved!"] autorelease];
    [hud completeQuicklyWithTitle:@"Saved!"];
}


@end
