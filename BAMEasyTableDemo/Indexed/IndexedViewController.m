//
//  LaunchIndexedViewController.m
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


#import "IndexedViewController.h"
#import "BAMEasyTable.h"


@implementation IndexedViewController
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
    self.title = @"Indexed Demo";
    
    // But I want a different title on the back button.
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    // Just a little text to describe the demo.
    textView.text = @"Next is an example with an index along the right side. It's as easy as passing in an arrays of titles and index titles and then loading the table from an array which contains an array for each group you would like in your table.\n\nThe table is fully searchable and the index is created automatically."; 

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
    // Okay, the data in this example is more complex than the simple demo. Basically, I'm creating an array of NSStrings for each section I want in my table.
    NSArray *alfaRomeo = [[NSArray alloc] initWithObjects:@"145", @"146", @"155", @"156", @"164", @"Spider", @"Lusso", nil];
    NSArray *audi = [[NSArray alloc] initWithObjects:@"A3", @"A4", @"A6", @"A8", nil];
    NSArray *bmw = [[NSArray alloc] initWithObjects:@"3 series", @"5 series", @"7 series", @"8 series", @"Z3", nil];
    NSArray *chrysler = [[NSArray alloc] initWithObjects:@"Neon", @"Jeep", @"Wrangler", @"Cherokee", @"Grand Cherokee", @"Voyager", nil];
    NSArray *citroen = [[NSArray alloc] initWithObjects:@"AX", @"Saxo", @"ZX", @"Xsara", @"Xantia", @"XM", @"Synergie", nil];
    NSArray *daewoo = [[NSArray alloc] initWithObjects:@"Lanos", @"Nexia", @"Nubira", @"Espero", @"Leganza", nil];
    NSArray *daihatsu = [[NSArray alloc] initWithObjects:@"Cuore", @"Sirion", @"Charade", @"Move", @"Grand Move", @"Terios", @"Sportrak", @"Fourtrak", nil];
    NSArray *fiat = [[NSArray alloc] initWithObjects:@"Cinquecento", @"Seicento", @"Uno", @"Punto", @"Bravo", @"Brava", @"Tipo", @"Tempra", @"Marea", @"Coupe", @"Ulysse", nil];
    NSArray *ford = [[NSArray alloc] initWithObjects:@"Ka", @"Fiesta", @"Escort", @"Focus", @"Mondeo", @"Puma", @"Probe", @"Cougar", @"Scorpio", @"Granada", @"Galaxy", @"Maverick", @"Explorer", nil];
    NSArray *honda = [[NSArray alloc] initWithObjects:@"Civic", @"Concerto", @"Accord", @"Integra", @"Prelude", @"Shuttle", @"Legend", @"NSX", nil];
    NSArray *hyundai = [[NSArray alloc] initWithObjects:@"Atoz", @"Accent", @"Lantra", @"Coupe", @"Sonata", nil];
    NSArray *jaguar = [[NSArray alloc] initWithObjects:@"XJ6", @"XJ8", @"XJR", @"XJS", @"XK8", nil];
    NSArray *kia = [[NSArray alloc] initWithObjects:@"Pride", @"Mentor", @"Sportage", nil];
    NSArray *lada = [[NSArray alloc] initWithObjects:@"Samara", @"Riva", @"Niva", @"Hussar", @"Cossack", nil];
    NSArray *landRover = [[NSArray alloc] initWithObjects:@"Freelander", @"Disovery", @"Range Rover", nil];
    NSArray *lotus = [[NSArray alloc] initWithObjects:@"Elan", @"Elise", @"Esprit", nil];
    NSArray *mazda = [[NSArray alloc] initWithObjects:@"121", @"323", @"626", @"MX-3", @"MX-5", @"MX-6", @"Xedos", @"RX7", nil];
    NSArray *mecedesBenz = [[NSArray alloc] initWithObjects:@"A Class", @"C Class", @"E Class", @"S Class", @"V Class", nil];
    NSArray *mitsubushi = [[NSArray alloc] initWithObjects:@"Colt", @"Lancer", @"Carisma", @"Galant", @"Space Runner", @"Space Wagon", @"Sigma", @"Shogun", nil];
    NSArray *nissan = [[NSArray alloc] initWithObjects:@"Micra", @"Almera", @"Primera", @"QX", @"Serena", @"Terrano", @"Patrol", nil];
    NSArray *peuguot = [[NSArray alloc] initWithObjects:@"106", @"206", @"306", @"405", @"406", @"605", @"806", nil];
    NSArray *porsche = [[NSArray alloc] initWithObjects:@"911", @"968", @"Boxter", nil];
    NSArray *renault = [[NSArray alloc] initWithObjects:@"5", @"Clio", @"19", @"Megane", @"Laguna", @"Safrane", @"Espace", nil];
    NSArray *rover = [[NSArray alloc] initWithObjects:@"Mini", @"Metro/100", @"200 series", @"400 series", @"600 series", @"800 series", nil];
    NSArray *saab = [[NSArray alloc] initWithObjects:@"90", @"9000", @"9-3", @"9-5", nil];
    NSArray *skoda = [[NSArray alloc] initWithObjects:@"Favorit", @"Felicia", @"Octavia", nil];
    NSArray *subaru = [[NSArray alloc] initWithObjects:@"Justy", @"Impreza", @"Legacy", @"Forester", nil];
    NSArray *suzuki = [[NSArray alloc] initWithObjects:@"Alto", @"Swift", @"Baleno", @"Wagon R+", @"Vitara", @"Grand Vitara", nil];
    NSArray *toyota = [[NSArray alloc] initWithObjects:@"Starlet", @"Corolla", @"Carina", @"Avensis", @"Camry", @"MR2", @"Paseo", @"Celica", @"Supra", @"Picnic", @"Previa", @"Rav-4", @"4Runner", @"Landcruiser", @"Colarado", nil];
    NSArray *vauxhall = [[NSArray alloc] initWithObjects:@"Corsa", @"Astra", @"Cavalier", @"Vectra", @"Omega", @"Tigra", @"Calibra", @"Sintra", @"Frontera", @"Monterey", nil];
    NSArray *volkswagen = [[NSArray alloc] initWithObjects:@"Polo", @"Golf", @"Passat", @"Corrado", @"Sharan", nil];
    NSArray *volvo = [[NSArray alloc] initWithObjects:@"440", @"480", @"S40", @"V40", @"850", @"S70", @"940", @"960", @"C70", nil];
    
    // Then I create an array of all those sections in the order I want them to appear.
    NSArray *automobilesByAutomaker = [[NSArray alloc] initWithObjects:alfaRomeo, audi, bmw, chrysler, citroen, daewoo, daihatsu, fiat, ford, honda, hyundai, jaguar, kia, lada, landRover, lotus, mazda, mecedesBenz, mitsubushi, nissan, peuguot, porsche, renault, rover, saab, skoda, subaru, suzuki, toyota, vauxhall, volkswagen, volvo, nil];
    
    // All the sections are now retained by the array of arrays so I should release them.
    [alfaRomeo release];
    [audi release];
    [bmw release];
    [chrysler release];
    [citroen release];
    [daewoo release];
    [daihatsu release];
    [fiat release];
    [ford release];
    [honda release];
    [hyundai release];
    [jaguar release];
    [kia release];
    [lada release];
    [landRover release];
    [lotus release];
    [mazda release];
    [mecedesBenz release];
    [mitsubushi release];
    [nissan release];
    [peuguot release];
    [porsche release];
    [renault release];
    [rover release];
    [saab release];
    [skoda release];
    [subaru release];
    [suzuki release];
    [toyota release];
    [vauxhall release];
    [volkswagen release];
    [volvo release];
    
    // Then I create an array of titles, one for each section in the same order as the sections created earlier.
    NSArray *titles = [[NSArray alloc] initWithObjects:@"Alfa Romeo", @"Audi", @"BMW", @"Chrysler", @"Citroen", @"Daewoo", @"Daihatsu", @"Fiat", @"Ford", @"Honda", @"Hyundai", @"Jaguar", @"Kia", @"Lada", @"Land Rover", @"Lotus", @"Mazda", @"Mecedes Benz", @"Mitsubushi", @"Nissan", @"Peuguot", @"Porsche", @"Renault", @"Rover", @"Saab", @"Skoda", @"Subaru", @"Suzuki", @"Toyota", @"Vauxhall", @"Volkswagen", @"Volvo", nil];
    
    // And then I do the same for the index. Creating an array of index titles in the same order.
    NSArray *indexTitles = [[NSArray alloc] initWithObjects:@"ALFA", @"AUDI", @"BMW", @"CHRY", @"CTRN", @"DWOO", @"DHAT", @"FIAT", @"FORD", @"HOND", @"HYND",@"JAG", @"KIA", @"LADA", @"LDRV", @"LOT", @"MAZ", @"MB", @"MIT", @"NSSN", @"PEUG", @"PORS", @"RNLT", @"ROV", @"SAAB", @"SKOD", @"SUBR", @"SUZ", @"TOY", @"VAUX", @"VOLK", @"VOLV", nil];
    

    // Initialize the BAMEasyTable. (I'm using the plain style.)
    BAMEasyTable *bamEasyTable = [[BAMEasyTable alloc] initWithStyle:UITableViewStylePlain];
    
    // Setting the title for the navigation controller.
    bamEasyTable.title = @"Automobile Models";
    
    // I'm setting a delegate so this instance can be called when a row has been selected.
    bamEasyTable.delegate = self;
    
    // Setting the titles array for the BAMEasyTable.
    bamEasyTable.headerTitles = titles;
    
    // The titles will automatically display if you pass in an array of titles. But you could tell BAMEasyTable not to show them by uncommenting the line below.
    //bamEasyTable.titleType = BAMEasyTableTitleTypeNeverShow;
    
    // There is also a threshold title type that will only display the titles if a threshold value is reached. Uncomment the lines below to see the title threshold working. 
    //bamEasyTable.titleType = BAMEasyTableTitleTypeThreshold;
    //bamEasyTable.titleThreshold = 205; // or try a larger number to see titles disappear.
    
    // Setting the index titles array for the BAMEasyTable.
    bamEasyTable.indexTitles = indexTitles;
    
    // The index titles will also automatically display if you pass in an array of titles. But you could tell BAMEasyTable not to show them by uncommenting the line below.
    //bamEasyTable.indexType = BAMEasyTableIndexTypeNeverShow;
    
    // Uncomment the lines below to see the index title threshold working. 
    //bamEasyTable.indexType = BAMEasyTableIndexTypeThreshold;
    //bamEasyTable.indexThreshold = 205; // or try a larger number to see titles disappear.
    
    // These are just to make the footer prettier by saying "X Models" rather than the default "X Items".
    bamEasyTable.countLabelTextSingular = @"Model";
    bamEasyTable.countLabelTextPlural = @"Models";
    
    // But if you don't want a footer with the count in your table, simply uncomment the line below.
    //bamEasyTable.showCountInFooter = NO;

    // Now I use the loadTableFromArrayOfArrays: method instead of the loadTableFromArray: method used in the simple demo.
    // NOTE: It is important to load the table after setting all of your options. Once the table is loaded, you should not change the options.
    [bamEasyTable loadTableFromArrayOfArrays:automobilesByAutomaker];
    
    // Push the BAMEasyTable onto the navigation controller.
    [self.navigationController pushViewController:bamEasyTable animated:YES];
    
    // Release everything when you're done.
    [bamEasyTable release];
    [automobilesByAutomaker release];
    [titles release];
    [indexTitles release];
}


#pragma mark - BAMEasyTableDelegate Methods

- (void)bamEasyTable:(BAMEasyTable *)easyTable didSelectObject:(id)selectedObject {
    // This delegate method will be called when a user selects an item in the table. The object is provided so that you can access whatever data you need from the object. However, the index path is not provided since the object may be in a search result and hence have a different index path that you may be expecting.
    NSString *selectedModel = (NSString *)selectedObject;
    
    // I'm just creating an alert.
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:selectedModel message:@"was selected." delegate:nil cancelButtonTitle:@"Yeah, I know" otherButtonTitles:nil];
    
    // And showing it to the user.
    [alert show];
    
    // Then, of course, I release it.
    [alert release];
}

- (void)bamEasyTable:(BAMEasyTable *)easyTable cellForCustomization:(UITableViewCell *)cell withObject:(id)currentObject {
    // If you need to customize your cells you can simply use this delegate which is called after each cell is created but prior to adding it to the table. In this example, I'm changing selection style of every cell. Make sure any code here is lightweight or it can slow down your table scrolling. The object is provided so that you can access whatever data you need from the object. However, the index path is not provided since the object may be in a search result and hence have a different index path that you may be expecting.
    cell.selectionStyle = UITableViewCellEditingStyleNone;
}

@end
