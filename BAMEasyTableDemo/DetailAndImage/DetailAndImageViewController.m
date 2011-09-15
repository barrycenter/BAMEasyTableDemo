//
//  LaunchCustomObjectViewController.m
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


#import "DetailAndImageViewController.h"
#import "BAMEasyTable.h"
#import "USPresident.h"
#import "PresidentViewController.h"


@implementation DetailAndImageViewController
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
    [presidents release];
    
    [super dealloc];
}


#pragma mark - View Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setting the title used by the navigationBar of the current page.
    self.title = @"Details & Images Demo";
    
    // But I want a different title on the back button.
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    // Just a little text to describe the demo.
    textView.text = @"BAMEasyTable allows you to set details and images by passing in custom objects and the names of the methods that provide the required information.\n\nIt's very simple. You just pass in the name of the method your custom data object uses to retrive the string or image you wish to place in the table cell.\n\nAlso, in this demo you can tap the edit button to reorder the table.";
    
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
    // First let's start with several arrays of data to populate our custom USPresident data object.
    NSArray *names = [[NSArray alloc] initWithObjects:@"George Washington", @"John Adams", @"Thomas Jefferson", @"James Madison", @"James Monroe", @"John Quincy Adams", @"Andrew Jackson", @"Martin Van Buren", @"William Henry Harrison", @"John Tyler", @"James K. Polk", @"Zachary Taylor", @"Millard Fillmore", @"Franklin Pierce", @"James Buchanan", @"Abraham Lincoln", @"Andrew Johnson", @"Ulysses S. Grant", @"Rutherford B. Hayes", @"James A. Garfield", @"Chester A. Arthur", @"Grover Cleveland", @"Benjamin Harrison", @"Grover Cleveland", @"William McKinley", @"Theodore Roosevelt", @"William Howard Taft", @"Woodrow Wilson", @"Warren G. Harding", @"Calvin Coolidge", @"Herbert Hoover", @"Franklin D. Roosevelt", @"Harry S. Truman", @"Dwight D. Eisenhower", @"John F. Kennedy", @"Lyndon B. Johnson", @"Richard M. Nixon", @"Gerald R. Ford", @"Jimmy Carter", @"Ronald Reagan", @"George H. W. Bush", @"Bill Clinton", @"George W. Bush", @"Barack H. Obama", nil];
    
    NSArray *filenameSubstrings = [[NSArray alloc] initWithObjects:@"Washington", @"Adams1", @"Jefferson", @"Madison", @"Monroe", @"Adams2", @"Jackson", @"VanBuren", @"Harrison1", @"Tyler", @"Polk", @"Taylor", @"Fillmore", @"Pierce", @"Buchanan", @"Lincoln", @"Johnson1", @"Grant", @"Hayes", @"Garfield", @"Arthur", @"Cleveland", @"Harrison2", @"Cleveland", @"McKinley", @"Roosevelt1", @"Taft", @"Wilson", @"Harding", @"Coolidge", @"Hoover", @"Roosevelt2", @"Truman", @"Eisenhower", @"Kennedy", @"Johnson2", @"Nixon", @"Ford", @"Carter", @"Reagan", @"Bush1", @"Clinton", @"Bush2", @"Obama", nil];
    
    NSArray *parties = [[NSArray alloc] initWithObjects:@"", @"Federalist", @"Democratic-Republican", @"Democratic-Republican", @"Democratic-Republican", @"Democratic-Republican", @"Democrat", @"Democrat", @"Whig", @"Whig", @"Democrat", @"Whig", @"Whig", @"Democrat", @"Democrat", @"Republican", @"Democrat", @"Republican", @"Republican", @"Republican", @"Republican", @"Democrat", @"Republican", @"Democrat", @"Republican", @"Republican", @"Republican", @"Democrat", @"Republican", @"Republican", @"Republican", @"Democrat", @"Democrat", @"Republican", @"Democrat", @"Democrat", @"Republican", @"Republican", @"Democrat", @"Republican", @"Republican", @"Democrat", @"Republican", @"Democrat", nil];
    
    NSArray *termStartDates = [[NSArray alloc] initWithObjects:@"Apr 30, 1789", @"Mar 4, 1797", @"Mar 4, 1801", @"Mar 4, 1809", @"Mar 4, 1817", @" Mar 4, 1825", @"Mar 4, 1829", @"Mar 4, 1837", @"Mar 4, 1841", @"Apr 4, 1841", @"Mar 4, 1845", @"Mar 4, 1849", @"Jul 9, 1850", @"Mar 4, 1853", @"Mar 4, 1857", @"Mar 4, 1861", @"Apr 15, 1865", @"Mar 4, 1869", @" Mar 4, 1877", @"Mar 4, 1881", @"Sep 19, 1881", @"Mar 4, 1885", @"Mar 4, 1889", @"Mar 4, 1893", @"Mar 4, 1897", @"Sep 14, 1901", @"Mar 4, 1909", @"Mar 4, 1913", @"Mar 4, 1921", @"Aug 2, 1923", @"Mar 4, 1929", @"Mar 4, 1933", @"Apr 12, 1945", @"Jan 20, 1953", @"Jan 20, 1961", @"Nov 22, 1963", @"Jan 20, 1969", @"Aug 9, 1974", @"Jan 20, 1977", @"Jan 20, 1981", @"Jan 20, 1989", @"Jan 20, 1993", @"Jan 20, 2001", @"Jan 20, 2009", nil];
    
    NSArray *termEndDates = [[NSArray alloc] initWithObjects:@"Mar 4, 1797", @"Mar 4, 1801", @"Mar 4, 1809", @"Mar 4, 1817", @"Mar 4, 1825", @"Mar 4, 1829", @"Mar 4, 1837", @"Mar 4, 1841", @"April 4, 1841", @"Mar 4, 1845", @"Mar 4, 1849", @"July 9, 1850", @"Mar 4, 1853", @"Mar 4, 1857", @"Mar 4, 1861", @"April 15, 1865", @"Mar 4, 1869", @"Mar 4, 1877", @"Mar 4, 1881", @"September 19, 1881", @"Mar 4, 1885", @"Mar 4, 1889", @"Mar 4, 1893", @"Mar 4, 1897", @"September 14, 1901", @"Mar 4, 1909", @"Mar 4, 1913", @"Mar 4, 1921", @"August 2, 1923", @"Mar 4, 1929", @"Mar 4, 1933", @"April 12, 1945", @"Jan 20, 1953", @"January 20, 1961", @"November 22, 1963", @"Jan 20, 1969", @"August 9, 1974", @"Jan 20, 1977", @"Jan 20, 1981", @"Jan 20, 1989", @"Jan 20, 1993", @"Jan 20, 2001", @"Jan 20, 2009", @"", nil];
    
    // First I create an array to hold my custom objects.
    presidents = [[NSMutableArray alloc] init];
    
    // Then I iterate through the arrays to create a series of USPresident objects and add them to the array.
    for (int i=0; i < [names count]; i++) {
        USPresident *president = [[USPresident alloc] init];
        president.order = i + 1;
        president.name = [names objectAtIndex:i];
        president.party = [parties objectAtIndex:i];
        president.termStart = [termStartDates objectAtIndex:i];
        president.termEnd = [termEndDates objectAtIndex:i];
        president.filenameSubstring = [filenameSubstrings objectAtIndex:i];
        [presidents addObject:president];
        [president release];
    }
    
    // Initialize the BAMEasyTable. (I'm using the plain style.)
 	BAMEasyTable *bamEasyTable = [[BAMEasyTable alloc] initWithStyle:UITableViewStylePlain];
    bamEasyTable.title = @"US Presidents";
    bamEasyTable.delegate = self;
    bamEasyTable.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Presidents" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    // Setting options
    bamEasyTable.showCountInFooter = YES; // YES is default
    bamEasyTable.allowSearching = YES;    // YES is default.
    bamEasyTable.allowRemoving = NO;      // NO is default.
    bamEasyTable.allowMoving = YES;       // NO is default.
    bamEasyTable.cellStyle = UITableViewCellStyleSubtitle;         // UITableViewCellStyleDefault is default.
    bamEasyTable.editButtonType = BAMEasyTableEditButtonTypeRight; // BAMEasyTableEditButtonTypeNone is default.
    bamEasyTable.searchType = BAMEasyTableSearchTypeWordBeginning; // BAMEasyTableSearchTypeWordBeginning is default. Can also  beBAMEasyTableSearchTypeWordBeginning, BAMEasyTableSearchTypeEndingOnly, BAMEasyTableSearchTypeWordEnding, or BAMEasyTableSearchTypeSubstring.
    
    // Any standard UITableView options can be set like this:
    bamEasyTable.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // These are just to make the footer prettier by saying "X Presidents" rather than the default "X Items".
    bamEasyTable.countLabelTextSingular = @"President";
    bamEasyTable.countLabelTextPlural = @"Presidents";
    
    // But if you don't want a footer with the count in your table, simply uncomment the line below.
    //bamEasyTable.showCountInFooter = NO;
    
    // *** THIS IS THE MEAT OF THIS DEMO ***
    // You can pass in the name of a method that returns a string for these two:
    bamEasyTable.textStringMethodName = @"name";
    bamEasyTable.detailStringMethodName = @"termString";
    
    // *** AND THIS ONE, TOO ***
    // Or a method which returns an image for this one:
    bamEasyTable.imageMethodName = @"icon";
    
    // Since I only have a single containing array, I use the loadTableFromArray: method instaead of the loadTableFromArrayOfArrays: method.
    // NOTE: It is important to load the table after setting all of your options. Once the table is loaded, you should not change the options.
    [bamEasyTable loadTableFromArray:(NSArray *)presidents];
    
    // Push the BAMEasyTable onto the navigation controller.
    [self.navigationController pushViewController:bamEasyTable animated:YES];
    
    // Release everything when you're done.
    [bamEasyTable release];
}


#pragma mark - BAMEasyTable Delegate Methods

- (void)bamEasyTable:(BAMEasyTable *)easyTable didSelectObject:(id)selectedObject {
    // This delegate method will be called when a user selects an item in the table. The object is provided so that you can access whatever data you need from the object. However, the index path is not provided since the object may be in a search result and hence have a different index path that you may be expecting.
    USPresident *currentPresident = (USPresident *)selectedObject;
    PresidentViewController *presidentViewController = [[PresidentViewController alloc] init];
    presidentViewController.name = currentPresident.name;
    presidentViewController.party = currentPresident.party;
    presidentViewController.term = [currentPresident termString];
    presidentViewController.number= [NSString stringWithFormat:@"%d", currentPresident.order];
    presidentViewController.portrait = [currentPresident portrait];
    [self.navigationController pushViewController:presidentViewController animated:YES];
    [presidentViewController release];
}

- (void)bamEasyTable:(BAMEasyTable *)easyTable cellForCustomization:(UITableViewCell *)cell withObject:(id)currentObject {
    // If you need to customize your cells you can simply use this delegate which is called after each cell is created but prior to adding it to the table. In this example, I'm changing the accessory type and selection style of every cell. Make sure any code here is lightweight or it can slow down your table scrolling. The object is provided so that you can access whatever data you need from the object. However, the index path is not provided since the object may be in a search result and hence have a different index path that you may be expecting.
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
}

- (void)bamEasyTable:(BAMEasyTable *)easyTable movedRowFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    // This delegate is called when the user moves an item from one row to another. So that you can update your underlying data model.
    USPresident *president = [presidents objectAtIndex:fromIndexPath.row];
    [presidents removeObjectAtIndex:fromIndexPath.row];
    [presidents insertObject:president atIndex:toIndexPath.row];
    
    // If you like, you can uncomment the line below to see the new order in your console.
    //for (USPresident *president in presidents)  NSLog(@"%@", president.name);
}


@end
