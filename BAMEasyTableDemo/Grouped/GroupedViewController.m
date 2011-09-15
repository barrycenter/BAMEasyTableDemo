//
//  LaunchGroupedViewController.m
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


#import "GroupedViewController.h"
#import "BAMEasyTable.h"


@implementation GroupedViewController
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
    self.title = @"Grouped Demo";
    
    // But I want a different title on the back button.
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    // Just a little text to describe the demo.
    textView.text = @"Grouped tables are just as easy. Simply initialize with the grouped style, pass in an array of group tiles, and, finally, pass in an array which contains an array for each group you would like in your table.\n\nOnce again, you'll have a completely searchable table with minimal coding.\n\n"; 

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
    
    // Then I create an array of all those sections in the order I want them to appear.
    NSArray *victoriasSecretModelsByCountry = [[NSArray alloc] initWithObjects:argentina, australia, bahamas, belarus, belgium, brazil, canada, caymanIslands, czechRepublic, denmark, dominicanRepublic, estonia, ethiopia, france, germany, hungary, india, israel, italy, jamaica, kenya, latvia, lithuania, mexico, montenegro, namibia, netherlands, newZealand, nigeria, china, poland, puertoRico, romania, russia, scotland, serbia, slovakia, slovenia, southAfrica, southKorea, spain, sudan, sweden, switzerland, trinidadAndTobago, uganda, ukraine, unitedKingdom, usa, virginIslands, venezuela, nil];
    
    // All the sections are now retained by the array of arrays so I should release them.
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
    
    // Then I create an array of titles, one for each section in the same order as the sections created earlier.
    NSArray *titles = [[NSArray alloc] initWithObjects:@"Argentina", @"Australia", @"The Bahamas", @"Belarus", @"Belgium", @"Brazil", @"Canada", @"Cayman Islands", @"Czech Republic", @"Denmark", @"Dominican Republic", @"Estonia", @"Ethiopia", @"France", @"Germany", @"Hungary", @"India", @"Israel", @"Italy", @"Jamaica", @"Kenya", @"Latvia", @"Lithuania", @"Mexico", @"Montenegro", @"Namibia", @"Netherlands", @"New Zealand", @"Nigeria", @"People’s Republic of China", @"Poland", @"Puerto Rico", @"Romania", @"Russia", @"Scotland", @"Serbia", @"Slovakia", @"Slovenia", @"South Africa", @"South Korea", @"Spain", @"Sudan", @"Sweden", @"Switzerland", @"Trinidad and Tobago", @"Uganda", @"Ukraine", @"United Kingdom", @"United States of America", @"United States Virgin Islands", @"Venezuela", nil];
    
    
    // Initialize the BAMEasyTable. (I'm using the grouped style.)
 	BAMEasyTable *bamEasyTable = [[BAMEasyTable alloc] initWithStyle:UITableViewStyleGrouped];
    
    // Setting the title for the navigation controller.
    bamEasyTable.title = @"Victoria's Secret Models";
    
    // I'm setting a delegate so this instance can be called when a row has been selected.
    bamEasyTable.delegate = self;
    
    // Setting the titles array for the BAMEasyTable.
    bamEasyTable.headerTitles = titles;
    
    // These are just to make the footer prettier by saying "X Models" rather than the default "X Items".
    bamEasyTable.countLabelTextSingular = @"Model";
    bamEasyTable.countLabelTextPlural = @"Models";
    
    // But if you don't want a footer with the count in your table, simply uncomment the line below.
    //bamEasyTable.showCountInFooter = NO;
    
    // Now I use the loadTableFromArrayOfArrays: method instead of the loadTableFromArray: method used in the simple demo.
    // NOTE: It is important to load the table after setting all of your options. Once the table is loaded, you should not change the options.
    [bamEasyTable loadTableFromArrayOfArrays:victoriasSecretModelsByCountry];
    
    // Push the BAMEasyTable onto the navigation controller.
    [self.navigationController pushViewController:bamEasyTable animated:YES];
    
    // Release everything when you're done.
    [bamEasyTable release];
    [victoriasSecretModelsByCountry release];
    [titles release];
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
