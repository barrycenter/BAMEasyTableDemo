//
//  LaunchViewController.m
//  BAMEasyTableDemo
//
//  Created by Barry Murphy on 9/8/11.
//  Copyright 2011 Barry Murphy. All rights reserved.
//

#import "SimpleViewController.h"
#import "BAMEasyTable.h"


@implementation SimpleViewController
@synthesize textView;
@synthesize launchButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
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

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setting the title used by the navigationBar of the current page.
    self.title = @"Simple Demo";
    
    // But I want a different title on the back button.
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    textView.text = @"This shows how easy it is to create a table which can be searched and edited.";
    
    UIImage *buttonImage = [[UIImage imageNamed:@"Button.png"] stretchableImageWithLeftCapWidth:16 topCapHeight:16];
    [launchButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [self setLaunchButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed:(id)sender {
    //NSArray *businessModels = [[NSArray alloc] initWithObjects:@"Auction", @"All-in-One", @"Bricks and Clicks", @"Business Reference", @"Collective", @"Component", @"Cutting out the Middleman", @"Direct Sales", @"Distribution", @"Fee In, Free Out", @"Franchise", @"Freemium", @"Industrialization of Services", @"Low-Cost Carrier", @"Loyalty", @"Monopolistic", @"Multi-Level Marketing", @"Network Effects", @"Online Auction", @"Online Content", @"Premium", @"Professional Open-Source", @"Pyramid Scheme", @"Razor and Blades", @"Servitization of Products", @"Subscription", nil];
    
    NSArray *fictionalBeverages = [[NSArray alloc] initWithObjects:@"Alamo Beer", @"Ambrosia", @"Binge Beer", @"Black Pony Scotch", @"Bonk! Atomic Punch", @"Booty Sweat Energy Drink", @"Brawndo", @"Butterbeer", @"Buzz Beer", @"Buzzz Cola", @"Crit-A-Cola", @"Double Tap Root Beer", @"Duff Beer", @"Elsinore Beer", @"Ent-draught", @"Flaming Moe", @"Getafix's Magic Potion", @"Girlie Girl Beer", @"Grog", @"Heisler Beer", @"Juggernog", @"Jumbo Jim's Grape Scotch", @"Klingon Raktajino", @"Lacasa", @"Miruvor", @"Moloko Plus", @"Mudder's Milk", @"Nectar", @"Norbecker Beer", @"Nuka-Cola", @"Panther Pilsner Beer", @"Perk-a-Cola", @"Pißwasser", @"Quafe", @"Quick Revive", @"Romulan Ale", @"Shotz Beer", @"Slurm", @"Slusho!", @"Speed Cola", @"Squishee", @"Sunset Sarsaparilla", @"Swill", @"Uncle Jemima's Pure Mash Liquor", @"Victory Gin", @"Vitameatavegamin", nil];
    
    BAMEasyTable *bamEasyTable = [[BAMEasyTable alloc] initWithStyle:UITableViewStylePlain];
    bamEasyTable.title = @"Fictional Beverages";
    bamEasyTable.allowSearching = YES;
    bamEasyTable.showCountInFooter = YES;
    bamEasyTable.searchType = BAMEasyTableSearchTypeWordBeginning;
    bamEasyTable.editButtonType = BAMEasyTableEditButtonTypeNone;
    [bamEasyTable loadTableFromArray:fictionalBeverages];
    [self.navigationController pushViewController:bamEasyTable animated:YES];
    [bamEasyTable release];
    [fictionalBeverages release];
}

@end
