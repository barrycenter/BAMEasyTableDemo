//
//  LaunchGroupedViewController.m
//  BAMEasyTableDemo
//
//  Created by Barry Murphy on 9/8/11.
//  Copyright 2011 Barry Murphy. All rights reserved.
//

#import "GroupedViewController.h"
#import "BAMEasyTable.h"


@implementation GroupedViewController
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
    self.title = @"Grouped Demo";
    
    // But I want a different title on the back button.
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    textView.text = @"This shows how easy it is to create a grouped table which can be searched and edited."; 

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
    NSArray *titles = [[NSArray alloc] initWithObjects:@"Argentina", @"Australia", @"The Bahamas", @"Belarus", @"Belgium", @"Brazil", @"Canada", @"Cayman Islands", @"Czech Republic", @"Denmark", @"Dominican Republic", @"Estonia", @"Ethiopia", @"France", @"Germany", @"Hungary", @"India", @"Israel", @"Italy", @"Jamaica", @"Kenya", @"Latvia", @"Lithuania", @"Mexico", @"Montenegro", @"Namibia", @"Netherlands", @"New Zealand", @"Nigeria", @"People’s Republic of China", @"Poland", @"Puerto Rico", @"Romania", @"Russia", @"Scotland", @"Serbia", @"Slovakia", @"Slovenia", @"South Africa", @"South Korea", @"Spain", @"Sudan", @"Sweden", @"Switzerland", @"Trinidad and Tobago", @"Uganda", @"Ukraine", @"United Kingdom", @"United States of America", @"United States Virgin Islands", @"Venezuela", nil];
    
    NSArray *indexTitles = [[NSArray alloc] initWithObjects:@"Argentina", @"Australia", @"The Bahamas", @"Belarus", @"Belgium", @"Brazil", @"Canada", @"Cayman Islands", @"Czech Republic", @"Denmark", @"Dominican Republic", @"Estonia", @"Ethiopia", @"France", @"Germany", @"Hungary", @"India", @"Israel", @"Italy", @"Jamaica", @"Kenya", @"Latvia", @"Lithuania", @"Mexico", @"Montenegro", @"Namibia", @"Netherlands", @"New Zealand", @"Nigeria", @"People’s Republic of China", @"Poland", @"Puerto Rico", @"Romania", @"Russia", @"Scotland", @"Serbia", @"Slovakia", @"Slovenia", @"South Africa", @"South Korea", @"Spain", @"Sudan", @"Sweden", @"Switzerland", @"Trinidad and Tobago", @"Uganda", @"Ukraine", @"United Kingdom", @"United States of America", @"United States Virgin Islands", @"Venezuela", nil];
    
    NSArray *argentina = [[NSArray alloc] initWithObjects:@"Carolina Ardohain", @"Yamila Díaz", @"Luján Fernández", @"Valeria Mazza", @"Inés Rivero", @"Daniela Urzi", nil];
    NSArray *australia = [[NSArray alloc] initWithObjects:@"Jessica Gomes", @"Jessica Hart", @"Kristy Hinze", @"Miranda Kerr", @"Abbey Lee", @"Elle MacPherson", @"Catherine McNeil", @"Pania Rose", @"Sarah Stephens", @"Elyse Taylor", @"Nicole Trunfio", nil];
    NSArray *bahamas = [[NSArray alloc] initWithObjects:@"Shakara Ledard", nil];
    NSArray *belarus = [[NSArray alloc] initWithObjects:@"Katsia Damankova", @"Maryna Linchuk", nil];
    NSArray *belgium = [[NSArray alloc] initWithObjects:@"Elise Crombez", @"Anouck Lepere", @"Ingrid Seynhaeve", @"Fabienne Terwinghe", @"Jessica Van Der Steen", nil];
    NSArray *brazil = [[NSArray alloc] initWithObjects:@"Michelle Alves", @"Alessandra Ambrosio", @"Ana Paula Araujo", @"Ana Beatriz Barros", @"Leticia Birkheuer", @"Marcelle Bittar", @"Gisele Bündchen", @"Jeísa Chiminazzo", @"Daniella Cicarelli", @"Flavia de Oliveira", @"Emanuela De Paula", @"Cintia Dicker", @"Isabeli Fontana", @"Izabel Goulart", @"Ana Hickmann", @"Adriana Lima", @"Ana Claudia Michels", @"Fernanda Motta", @"Aline Nakashima", @"Raica Oliveira", @"Caroline Ribeiro", @"Daniella Sarahyba", @"Fabiana Semprebom", @"Fabiana Tambosi", @"Fernanda Tavares", @"Caroline Trentini", @"Solange Wilvert", @"Raquel Zimmermann", nil];
    NSArray *canada = [[NSArray alloc] initWithObjects:@"Linda Evangelista", @"Yasmeen Ghauri", @"Shalom Harlow", @"Tricia Helfer", @"Heather Marks", @"Andi Muise", @"Rachel Roberts", @"Coco Rocha", @"Carrie Salmon", @"Jessica Stam", @"Estella Warren", nil];
    NSArray *caymanIslands = [[NSArray alloc] initWithObjects:@"Selita Ebanks", nil];
    NSArray *czechRepublic = [[NSArray alloc] initWithObjects:@"Yana Gupta", @"Eva Herzigová", @"Karolína Kurková", @"Petra Němcová", @"Daniela Peštová", @"Hana Soukupová", @"Veronika Vařeková", @"Linda Vojtova", nil];
    NSArray *denmark = [[NSArray alloc] initWithObjects:@"May Andersen", @"Helena Christensen", @"Maria Gregersen", @"Rie Rasmussen", nil];
    NSArray *dominicanRepublic = [[NSArray alloc] initWithObjects:@"Omahyra Mota", @"Arlenis Sosa", nil];
    NSArray *estonia = [[NSArray alloc] initWithObjects:@"Carmen Kass", nil];
    NSArray *ethiopia = [[NSArray alloc] initWithObjects:@"Liya Kebede", nil];
    NSArray *france = [[NSArray alloc] initWithObjects:@"Magali Amadei", @"Laetitia Casta", @"Aurélie Claudel", @"Morgane Dubled", @"Heloise Guerin", @"Constance Jablonski", @"Noémie Lenoir", @"Audrey Marnay", nil];
    NSArray *germany = [[NSArray alloc] initWithObjects:@"Toni Garrn", @"Heidi Klum", @"Tatjana Patitz", @"Claudia Schiffer", @"Julia Stegner", @"Manon von Gerkan", nil];
    NSArray *hungary = [[NSArray alloc] initWithObjects:@"Reka Ebergenyi", @"Diana Meszaros", @"Eniko Mihalik", nil];
    NSArray *india = [[NSArray alloc] initWithObjects:@"Ujjwala Raut", nil];
    NSArray *israel = [[NSArray alloc] initWithObjects:@"Esti Ginzburg", @"Bar Refaeli", @"Shiraz Tal", nil];
    NSArray *italy = [[NSArray alloc] initWithObjects:@"Bianca Balti", nil];
    NSArray *jamaica = [[NSArray alloc] initWithObjects:@"Carla Campbell", @"Georgianna Robertson", nil];
    NSArray *kenya = [[NSArray alloc] initWithObjects:@"Ajuma Nasenyana", nil];
    NSArray *latvia = [[NSArray alloc] initWithObjects:@"Inguna Butane", @"Angelika Kallio", @"Ginta Lapina", nil];
    NSArray *lithuania = [[NSArray alloc] initWithObjects:@"Edita Vilkeviciute", nil];
    NSArray *mexico = [[NSArray alloc] initWithObjects:@"Elsa Benítez", @"Daniela de Jesus Cosio", nil];
    NSArray *montenegro = [[NSArray alloc] initWithObjects:@"Marija Vujović", nil];
    NSArray *namibia = [[NSArray alloc] initWithObjects:@"Behati Prinsloo", nil];
    NSArray *netherlands = [[NSArray alloc] initWithObjects:@"Dewi Driegen", @"Famke Janssen", @"Doutzen Kroes", @"Karen Mulder", @"Lara Stone", @"Yfke Sturm", @"Frederique van der Wal", @"Louise Vyent", nil];
    NSArray *newZealand = [[NSArray alloc] initWithObjects:@"Kylie Bax", nil];
    NSArray *nigeria = [[NSArray alloc] initWithObjects:@"Oluchi Onweagba", nil];
    NSArray *china = [[NSArray alloc] initWithObjects:@"Liu Wen", nil];
    NSArray *poland = [[NSArray alloc] initWithObjects:@"Magdalena Frackowiak", @"Anna Jagodzinska", @"Anja Rubik", @"Kasia Struss", @"Magdalena Wróbel", nil];
    NSArray *puertoRico = [[NSArray alloc] initWithObjects:@"Astrid Muñoz", nil];
    NSArray *romania = [[NSArray alloc] initWithObjects:@"Alina Vacariu", nil];
    NSArray *russia = [[NSArray alloc] initWithObjects:@"Tatiana Kovylina", @"Sasha Pivovarova", @"Natasha Poly", @"Vlada Roslyakova", @"Viera Schottertova", @"Irina Shayk", @"Katja Shchekina", @"Eugenia Volodina", @"Anne Vyalitsyna", @"Valentina Zelyaeva", nil];
    NSArray *scotland = [[NSArray alloc] initWithObjects:@"Kirsty Hume", nil];
    NSArray *serbia = [[NSArray alloc] initWithObjects:@"Maja Latinovic", nil];
    NSArray *slovakia = [[NSArray alloc] initWithObjects:@"Michaela Kocianova", @"Adriana Sklenaříková", nil];
    NSArray *slovenia = [[NSArray alloc] initWithObjects:@"Michaela Hlaváčková", nil];
    NSArray *southAfrica = [[NSArray alloc] initWithObjects:@"Georgina Grenville", @"Candice Swanepoel", @"Landi Swanepoel", nil];
    NSArray *southKorea = [[NSArray alloc] initWithObjects:@"Hyoni Kang", nil];
    NSArray *spain = [[NSArray alloc] initWithObjects:@"Clara Alonso", @"Esther Cañadas", @"Almudena Fernández", @"Vanessa Lorenzo", @"Eugenia Silva", nil];
    NSArray *sudan = [[NSArray alloc] initWithObjects:@"Alek Wek", nil];
    NSArray *sweden = [[NSArray alloc] initWithObjects:@"Mini Anden", @"Vendela Kirsebom", @"Caroline Winberg", nil];
    NSArray *switzerland = [[NSArray alloc] initWithObjects:@"Julie Ordon", nil];
    NSArray *trinidadAndTobago = [[NSArray alloc] initWithObjects:@"Teresa Lourenco", nil];
    NSArray *uganda = [[NSArray alloc] initWithObjects:@"Kiara Kabukuru", nil];
    NSArray *ukraine = [[NSArray alloc] initWithObjects:@"Nataliya Gotsiy", @"Olga Kurylenko", nil];
    NSArray *unitedKingdom = [[NSArray alloc] initWithObjects:@"Michelle Behennah", @"Naomi Campbell", @"Sophie Dahl", @"Lily Donaldson", @"Jourdan Dunn", @"Karen Elson", @"Rosie Huntington-Whiteley", @"Yasmin Le Bon", @"Heather Stewart-Whyte", @"Jacquetta Wheeler", nil];
    NSArray *usa = [[NSArray alloc] initWithObjects:@"Lily Aldridge", @"Karen Alexander", @"Danita Angell", @"K.D. Aubert", @"Lorri Bagley", @"Shaune Bagwell", @"Melissa Baker", @"Tyra Banks", @"Arlene Baxter", @"Leilani Bishop", @"Kylie Bisutti", @"Joy Bryant", @"Michelle Buswell", @"Rachel Clark", @"Shannan Click", @"Haylynn Cohen", @"Geena Davis", @"Brooklyn Decker", @"Emily DiDonato", @"Rhea Durham", @"Susan Eldridge", @"Lindsay Ellingson", @"Dani Evans", @"Angie Everhart", @"Megan Ewing", @"Lindsay Frimodt", @"Trish Goff", @"Jill Goodacre", @"Quiana Grant", @"Kimberly Guilfoyle", @"Bridget Hall", @"Melissa Haro", @"Erin Heatherton", @"Emma Heming", @"Susan Holmes", @"Chanel Iman", @"Jaime King", @"Damaris Lewis", @"Angela Lindvall", @"Sessilee Lopez", @"Nicola Mar", @"Josie Maran", @"Jarah Mariano", @"Catherine McCord", @"Elaine Irwin Mellencamp", @"Ariel Meredith", @"Ali Michael", @"Alyssa Miller", @"Marisa Miller", @"Chandra North", @"Beverly Peele", @"Audrey Quock", @"Frankie Rayder", @"Hilary Rhoda", @"Maggie Rizer", @"Rebecca Romijn", @"Cameron Russell", @"Stephanie Seymour", @"Molly Sims", @"Amber Smith", @"Kim Smith", @"Michelle Ray Smith", @"Ali Stephens", @"Niki Taylor", @"Christine Teigen", @"Kate Upton", @"Erin Wasson", @"Veronica Webb", @"Jessica White", @"Rachel Williams", @"Kara Young", nil];
    NSArray *virginIslands = [[NSArray alloc] initWithObjects:@"Hannah Davis", nil];
    NSArray *venezuela = [[NSArray alloc] initWithObjects:@"Patricia Velásquez", nil];
    
    NSArray *victoriasSecretModelsByCountry = [[NSArray alloc] initWithObjects:argentina, australia, bahamas, belarus, belgium, brazil, canada, caymanIslands, czechRepublic, denmark, dominicanRepublic, estonia, ethiopia, france, germany, hungary, india, israel, italy, jamaica, kenya, latvia, lithuania, mexico, montenegro, namibia, netherlands, newZealand, nigeria, china, poland, puertoRico, romania, russia, scotland, serbia, slovakia, slovenia, southAfrica, southKorea, spain, sudan, sweden, switzerland, trinidadAndTobago, uganda, ukraine, unitedKingdom, usa, virginIslands, venezuela, nil];
    
    [argentina release];
    [australia release];
    [bahamas release];
    [belarus release];
    [belgium release];
    [brazil release];
    [canada release];
    [caymanIslands release];
    [czechRepublic release];
    [denmark release];
    [dominicanRepublic release];
    [estonia release];
    [ethiopia release];
    [france release];
    [germany release];
    [hungary release];
    [india release];
    [israel release];
    [italy release];
    [jamaica release];
    [kenya release];
    [latvia release];
    [lithuania release];
    [mexico release];
    [montenegro release];
    [namibia release];
    [newZealand release];
    [nigeria release];
    [china release];
    [poland release];
    [puertoRico release];
    [romania release];
    [russia release];
    [scotland release];
    [serbia release];
    [slovakia release];
    [slovenia release];
    [southAfrica release];
    [southKorea release];
    [spain release];
    [sudan release];
    [sweden release];
    [switzerland release];
    [trinidadAndTobago release];
    [uganda release];
    [ukraine release];
    [unitedKingdom release];
    [virginIslands release];
    [venezuela release];
    

    
 	BAMEasyTable *bamEasyTable = [[BAMEasyTable alloc] initWithStyle:UITableViewStyleGrouped];
    bamEasyTable.title = @"Victoria's Secret";
    bamEasyTable.allowSearching = YES;
    bamEasyTable.showCountInFooter = YES;
    bamEasyTable.searchType = BAMEasyTableSearchTypeWordBeginning;
    bamEasyTable.titles = titles;
    //bamEasyTable.indexTitles = indexTitles;
    [bamEasyTable loadTableFromArrayOfArrays:victoriasSecretModelsByCountry];
    bamEasyTable.indexType = BAMEasyTableIndexTypeNeverShow;
    [self.navigationController pushViewController:bamEasyTable animated:YES];
    [bamEasyTable release];
    
    NSLog(@"******* victoriasSecretModelsByCountry count: %d", [victoriasSecretModelsByCountry count]);
    NSLog(@"******* Launcher titles count: %d", [titles count]);
    NSLog(@"******* Launcher indexTitles count: %d", [indexTitles count]);
    
    [victoriasSecretModelsByCountry release];
    [titles release];
    [indexTitles release];
}

@end
