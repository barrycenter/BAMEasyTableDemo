//
//  LaunchIndexedViewController.m
//  BAMEasyTableDemo
//
//  Created by Barry Murphy on 9/8/11.
//  Copyright 2011 Barry Murphy. All rights reserved.
//

#import "IndexedViewController.h"
#import "BAMEasyTable.h"


@implementation IndexedViewController
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
    self.title = @"Indexed Demo";
    
    // But I want a different title on the back button.
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    textView.text = @"This shows how easy it is to create an indexed table which can be searched and edited."; 

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
    NSArray *titles = [[NSArray alloc] initWithObjects:@"Alfa Romeo", @"Audi", @"BMW", @"Chrysler", @"Citroen", @"Daewoo", @"Daihatsu", @"Fiat", @"Ford", @"Honda", @"Hyundai", @"Jaguar", @"Kia", @"Lada", @"Land Rover", @"Lotus", @"Mazda", @"Mecedes Benz", @"Mitsubushi", @"Nissan", @"Peuguot", @"Porsche", @"Renault", @"Rover", @"Saab", @"Skoda", @"Subaru", @"Suzuki", @"Toyota", @"Vauxhall", @"Volkswagen", @"Volvo", nil];
    
    NSArray *indexTitles = [[NSArray alloc] initWithObjects:@"ALFA", @"AUDI", @"BMW", @"CHRY", @"CTRN", @"DWOO", @"DHAT", @"FIAT", @"FORD", @"HOND", @"HYND",@"JAG", @"KIA", @"LADA", @"LDRV", @"LOT", @"MAZ", @"MB", @"MIT", @"NSSN", @"PEUG", @"PORS", @"RNLT", @"ROV", @"SAAB", @"SKOD", @"SUBR", @"SUZ", @"TOY", @"VAUX", @"VOLK", @"VOLV", nil];
    
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
    
    NSArray *automobilesByAutomaker = [[NSArray alloc] initWithObjects:alfaRomeo, audi, bmw, chrysler, citroen, daewoo, daihatsu, fiat, ford, honda, hyundai, jaguar, kia, lada, landRover, lotus, mazda, mecedesBenz, mitsubushi, nissan, peuguot, porsche, renault, rover, saab, skoda, subaru, suzuki, toyota, vauxhall, volkswagen, volvo, nil];
    
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
    
    BAMEasyTable *bamEasyTable = [[BAMEasyTable alloc] initWithStyle:UITableViewStylePlain];
    bamEasyTable.title = @"Automaker's Models";
    bamEasyTable.allowSearching = YES;
    bamEasyTable.showCountInFooter = YES;
    bamEasyTable.searchType = BAMEasyTableSearchTypeWordBeginning;
    bamEasyTable.titles = titles;
    bamEasyTable.indexTitles = indexTitles;
    [bamEasyTable loadTableFromArrayOfArrays:automobilesByAutomaker];
    bamEasyTable.indexType = BAMEasyTableIndexTypeAlwaysShow;
    [self.navigationController pushViewController:bamEasyTable animated:YES];
    [bamEasyTable release];
    
    NSLog(@"******* Launcher titles count: %d", [titles count]);
    NSLog(@"******* Launcher indexTitles count: %d", [indexTitles count]);
    
    [automobilesByAutomaker release];
    [titles release];
    [indexTitles release];
}
@end
