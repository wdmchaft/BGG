//
//  SettingsViewController.m
//  bgg
//
//  Created by João Caxaria on 5/2/11.
//  Copyright 2011 Imaginary Factory. All rights reserved.
//

#import "SettingsViewController.h"
#import "Globals.h"
#import "PersonRemoteConnector.h"
#import "BGGPerson.h"

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
    [self retain];
    [[Globals sharedGlobals] setBggUsername:[bggUsername text]];
    needsToSave = NO;
    
    [[Globals sharedGlobals] showHUDWithMessage:@"Saving..."];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(gotUserDetails:) 
                                                 name:[[[Globals sharedGlobals] remoteConnector] getUserDetails:[bggUsername text]]
                                               object:nil];
}

#pragma mark Private

-(void) gotUserDetails:(NSNotification*) notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:[[notification object] objectForKey:@"key"] object:nil];
	
	BGGPerson * person = [[notification object] objectForKey:@"data"];
    
    DBPerson* dbPerson = [[[Globals sharedGlobals] dataAccess] getCreatePersonById:person.id];
    [dbPerson updateFromBGGPerson:person];
    [[[Globals sharedGlobals] dataAccess] saveChanges];
    
    [[Globals sharedGlobals] closeHUDWithSuccessMessage:@"Saved!"];
    [self autorelease];
}



@end
