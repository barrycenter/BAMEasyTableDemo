//
//  SimpleViewController.m
//  BAMEasyTableDemo
//
//  If you use this software in your project, a credit for Barry Murphy
//  and a link to http://barrycenter.com would be appreciated.
//
//  --------------------------------
//  Simplified BSD License (FreeBSD)
//  --------------------------------
//
//  Copyright 2011 Barry Murphy. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are
//  permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of
//     conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list
//     of conditions and the following disclaimer in the documentation and/or other materials
//     provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY BARRY MURPHY "AS IS" AND ANY EXPRESS OR IMPLIED
//  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
//  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL BARRY MURPHY OR
//  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  The views and conclusions contained in the software and documentation are those of the
//  authors and should not be interpreted as representing official policies, either expressed
//  or implied, of Barry Murphy.


/*****************************************************************************\
 *                                                                           *
 *                            IMPLEMENTATION NOTE                            *
 *                                                                           *
 *  To implement BAMEasyTable in your app, you only need to push it onto an  *
 *  existing navigation controller within your app. Learn how to do this by  *
 *  viewing the buttonPressed: method below.                                 *
 *                                                                           *
\*****************************************************************************/


#import "SimpleViewController.h"
#import "BAMEasyTable.h"

@implementation SimpleViewController
@synthesize textView;
@synthesize launchButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [textView release];
    [launchButton release];
    
    [super dealloc];
}


#pragma mark - View Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setting the title used by the navigationBar of the current page.
    self.title = @"Simple Demo";
    
    // But I want a different title on the back button.
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    // Just a little text to describe the demo.
    textView.text = @"This shows how easy it is to create a searchable.\n\nOnly two lines of code were needed to create the table: one to initialize BAMEasy Table and one to load the table from an array of strings.\n\nGo ahead, search the following list for a nice cold beer—or cola if you prefer";
    
    // I'm putting a yellow button graphic as the background for the button.
    UIImage *buttonImage = [[UIImage imageNamed:@"Button.png"] stretchableImageWithLeftCapWidth:16 topCapHeight:16];
    [launchButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
}

- (void)viewDidUnload {
    [self setTextView:nil];
    [self setLaunchButton:nil];
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - IBAction Methods

- (IBAction)buttonPressed:(id)sender {
    // First, I'm creating an array of NSStrings which I want to display in the table.
    NSArray *fictionalBeverages = [[NSArray alloc] initWithObjects:@"Alamo Beer", @"Ambrosia", @"Binge Beer", @"Black Pony Scotch", @"Bonk! Atomic Punch", @"Booty Sweat Energy Drink", @"Brawndo", @"Butterbeer", @"Buzz Beer", @"Buzzz Cola", @"Crit-A-Cola", @"Double Tap Root Beer", @"Duff Beer", @"Elsinore Beer", @"Ent-draught", @"Flaming Moe", @"Getafix's Magic Potion", @"Girlie Girl Beer", @"Grog", @"Heisler Beer", @"Juggernog", @"Jumbo Jim's Grape Scotch", @"Klingon Raktajino", @"Lacasa", @"Miruvor", @"Moloko Plus", @"Mudder's Milk", @"Nectar", @"Norbecker Beer", @"Nuka-Cola", @"Panther Pilsner Beer", @"Perk-a-Cola", @"Pißwasser", @"Quafe", @"Quick Revive", @"Romulan Ale", @"Shotz Beer", @"Slurm", @"Slusho!", @"Speed Cola", @"Squishee", @"Sunset Sarsaparilla", @"Swill", @"Uncle Jemima's Pure Mash Liquor", @"Victory Gin", @"Vitameatavegamin", nil];
    
    // Initialize the BAMEasyTable. (I'm using the plain style.)
    BAMEasyTable *bamEasyTable = [[BAMEasyTable alloc] initWithStyle:UITableViewStylePlain];
    
    // Setting a title for the navigations controller. Every UIView can set a title so it's nothing new.
    bamEasyTable.title = @"Fictional Beverages";
    
    // Now I simply load the table from the array I created earlier.
    [bamEasyTable loadTableFromArray:fictionalBeverages];
    
    // Then push the BAMEasyTable onto the navigation controller.
    [self.navigationController pushViewController:bamEasyTable animated:YES];
    
    // Don't forget to put away your toys when you're through playing with them.
    [bamEasyTable release];
    [fictionalBeverages release];
}


@end
