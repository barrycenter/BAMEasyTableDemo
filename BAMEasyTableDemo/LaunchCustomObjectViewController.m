//
//  LaunchComplexViewController.m
//  BAMEasyTableDemo
//
//  Created by Barry Murphy on 9/8/11.
//  Copyright 2011 Barry Murphy. All rights reserved.
//

#import "LaunchCustomObjectViewController.h"
#import "BAMEasyTable.h"


@implementation LaunchCustomObjectViewController
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
    self.title = @"Complex Demo";
    
    // But I want a different title on the back button.
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    textView.text = @"This shows some of the more complex configuration options available with BAMEasyTable.";
    
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
    NSArray *titles = [[NSArray alloc] initWithObjects:@"Africa", @"Asia", @"Europe", @"North America", @"Oceania", @"South America", nil];
    
    NSArray *indexTitles = [[NSArray alloc] initWithObjects:@"AFRICA", @"ASIA", @"EUROPE", @"NORTH AMERICA", @"OCEANIA", @"SOUTH AMERICA", nil];
    
    NSArray *africa = [[NSArray alloc] initWithObjects:@"Algeria", @"Angola", @"Benin", @"Botswana", @"Burkina", @"Burundi", @"Cameroon", @"Cape Verde", @"Central African Republic", @"Chad", @"Comoros", @"Congo", @"Congo, Democratic Republic of", @"Djibouti", @"Egypt", @"Equatorial Guinea", @"Eritrea", @"Ethiopia", @"Gabon", @"Gambia", @"Ghana", @"Guinea", @"Guinea-Bissau", @"Ivory Coast", @"Kenya", @"Lesotho", @"Liberia", @"Libya", @"Madagascar", @"Malawi", @"Mali", @"Mauritania", @"Mauritius", @"Morocco", @"Mozambique", @"Namibia", @"Niger", @"Nigeria", @"Rwanda", @"Sao Tome and Principe", @"Senegal", @"Seychelles", @"Sierra Leone", @"Somalia", @"South Africa", @"South Sudan", @"Sudan", @"Swaziland", @"Tanzania", @"Togo", @"Tunisia", @"Uganda", @"Zambia", @"Zimbabwe", nil];
    NSArray *asia = [[NSArray alloc] initWithObjects:@"Afghanistan", @"Bahrain", @"Bangladesh", @"Bhutan", @"Brunei", @"Burma (Myanmar)", @"Cambodia", @"China", @"East Timor", @"India", @"Indonesia", @"Iran", @"Iraq", @"Israel", @"Japan", @"Jordan", @"Kazakhstan", @"Korea, North", @"orea, South", @"Kuwait", @"Kyrgyzstan", @"Laos", @"Lebanon", @"Malaysia", @"Maldives", @"Mongolia", @"Nepal", @"Oman", @"Pakistan", @"Philippines", @"Qatar", @"Russian Federation", @"Saudi Arabia", @"Singapore", @"Sri Lanka", @"Syria", @"Tajikistan", @"Thailand", @"Turkey", @"Turkmenistan", @"United Arab Emirates", @"Uzbekistan", @"Vietnam", @"Yemen", nil];
    NSArray *europe = [[NSArray alloc] initWithObjects:@"Albania", @"Andorra", @"Armenia", @"Austria", @"Azerbaijan", @"Belarus", @"Belgium", @"Bosnia and Herzegovina", @"Bulgaria", @"Croatia", @"Cyprus", @"Czech Republic", @"Denmark", @"Estonia", @"Finland", @"France", @"Georgia", @"Germany", @"Greece", @"Hungary", @"Iceland", @"Ireland", @"Italy", @"Latvia", @"Liechtenstein", @"Lithuania", @"Luxembourg", @"Macedonia", @"Malta", @"Moldova", @"Monaco", @"Montenegro", @"Netherlands", @"Norway", @"Poland", @"Portugal", @"Romania", @"San Marino", @"Serbia", @"Slovakia", @"Slovenia", @"Spain", @"Sweden", @"Switzerland", @"Ukraine", @"United Kingdom", @"Vatican City", nil];
    NSArray *northAmerica = [[NSArray alloc] initWithObjects:@"Antigua and Barbuda", @"Bahamas", @"Barbados", @"Belize", @"Canada", @"Costa Rica", @"Cuba", @"Dominica", @"Dominican Republic", @"El Salvador", @"Grenada", @"Guatemala", @"Haiti", @"Honduras", @"Jamaica", @"Mexico", @"Nicaragua", @"Panama", @"Saint Kitts and Nevis", @"Saint Lucia", @"Saint Vincent and the Grenadines", @"Trinidad and Tobago", @"United States", nil];
    NSArray *oceania = [[NSArray alloc] initWithObjects:@"Australia", @"Fiji", @"Kiribati", @"Marshall Islands", @"Micronesia", @"Nauru", @"New Zealand", @"Palau", @"Papua New Guinea", @"Samoa", @"Solomon Islands", @"Tonga", @"Tuvalu", @"Vanuatu", nil];
    NSArray *southAmerica = [[NSArray alloc] initWithObjects:@"Argentina", @"Bolivia", @"Brazil", @"Chile", @"Colombia", @"Ecuador", @"Guyana", @"Paraguay", @"Peru", @"Suriname", @"Uruguay", @"Venezuela", nil];
    
    NSArray *countriesByContinent = [[NSArray alloc] initWithObjects:africa, asia, europe, northAmerica, oceania, southAmerica, nil];
    
    [africa release];
    [asia release];
    [europe release];
    [northAmerica release];
    [oceania release];
    [southAmerica release];
    
 	BAMEasyTable *bamEasyTable = [[BAMEasyTable alloc] initWithStyle:UITableViewStyleGrouped];
    bamEasyTable.title = @"Continents/Nations";
    bamEasyTable.allowSearching = YES;
    bamEasyTable.showCountInFooter = YES;
    bamEasyTable.searchType = BAMEasyTableSearchTypeWordBeginning;
    bamEasyTable.titles = titles;
    bamEasyTable.indexTitles = indexTitles;
    [bamEasyTable loadTableFromArrayOfArrays:countriesByContinent];
    bamEasyTable.indexType = BAMEasyTableIndexTypeAlwaysShow;
    [self.navigationController pushViewController:bamEasyTable animated:YES];
    [bamEasyTable release];
    
    NSLog(@"******* Launcher titles count: %d", [titles count]);
    NSLog(@"******* Launcher indexTitles count: %d", [indexTitles count]);
    
    [countriesByContinent release];
    [titles release];
    [indexTitles release];
}
@end
