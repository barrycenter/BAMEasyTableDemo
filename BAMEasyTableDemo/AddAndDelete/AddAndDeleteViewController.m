//
//  LaunchAddDeleteViewController.m
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


#import "AddAndDeleteViewController.h"
#import "BAMEasyTable.h"
#import "DictionaryEntry.h"
#import "EntryViewController.h"

@implementation AddAndDeleteViewController
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
    [bamEasyTable release];
    [entries release];
    [titles release];
    [textView release];
    [launchButton release];
    [blueGrayColor release];
    
    [super dealloc];
}


#pragma mark - View Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setting the title used by the navigationBar of the current page.
    self.title = @"Add & Delete Demo";
    
    // But I want a different title on the back button.
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    // Just a little text to describe the demo.
    textView.text = @"Tremendous customization is possible. BAMEasyTable will automatically animate the removal of an item. Obviously, you are responsible for actually updating the underlying data model.\n\nLikewise, you are responsible for providing an edit view if you want to allow adding items. Then, you simply tell BAMEasyTable where to place the new object and it'll do the rest.";
    
    // I'm putting a yellow button graphic as the background for the button.
    UIImage *buttonImage = [[UIImage imageNamed:@"Button.png"] stretchableImageWithLeftCapWidth:16 topCapHeight:16];
    [launchButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    // I'm also going to use this color a lot in this demo.
    blueGrayColor = [[UIColor colorWithRed:71.0f/255.0f green:88.0f/255.0f blue:150.0f/255.0f alpha:1.0f] retain];
}

- (void)viewDidUnload {
    [self setTextView:nil];
    [self setLaunchButton:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - IBAction Methods

- (IBAction)buttonPressed:(id)sender {
    // This time I'm loading my array of arrays elsewhere.
    [self loadEntries];
    
    // And I'm simply using the same section titles as my index titles.
    NSMutableArray *indexTitles = [titles copy];
    
    // Footer titles are being generated for demonstration of the footers if you uncomment them in the BAMEasyTable property assignments.
    NSMutableArray *footerTitles = [[NSMutableArray alloc] init];
    for (int i=0; i < [titles count]; i++) {
        [footerTitles addObject:[NSString stringWithFormat:@"Footer for section '%@'", [titles objectAtIndex:i]]];
    }
    
    // Initialize the BAMEasyTable. (I'm using the plain style.)
    bamEasyTable = [[BAMEasyTable alloc] initWithStyle:UITableViewStylePlain];
    bamEasyTable.delegate = self;
    bamEasyTable.title = @"Blogger Dictionary";
    bamEasyTable.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Terms" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    bamEasyTable.tableView.separatorColor = blueGrayColor;
    
    // Setting options
    bamEasyTable.showAddButtonWhileEditing = YES; // NO is default
    bamEasyTable.showCountInFooter = YES;         // YES is default.
    bamEasyTable.allowSearching = YES;            // YES is default.
    bamEasyTable.allowRemoving = YES;             // NO is default.
    bamEasyTable.allowMoving = NO;                // NO is default.
    bamEasyTable.cellStyle = UITableViewCellStyleSubtitle;         // UITableViewCellStyleDefault is default.
    bamEasyTable.editButtonType = BAMEasyTableEditButtonTypeRight; // BAMEasyTableEditButtonTypeNone is default.
    bamEasyTable.searchType = BAMEasyTableSearchTypeWordBeginning; // BAMEasyTableSearchTypeWordBeginning is default. Can also  beBAMEasyTableSearchTypeWordBeginning, BAMEasyTableSearchTypeEndingOnly, BAMEasyTableSearchTypeWordEnding, or BAMEasyTableSearchTypeSubstring.

    // I only want the index to show up if there are over 20 items in the table.
    bamEasyTable.indexType = BAMEasyTableIndexTypeThreshold;
    bamEasyTable.indexThreshold = 20;
    
    // I only want the section titles to show up if there are over 20 items in the table.
    bamEasyTable.sectionHeaderType = BAMEasyTableSectionHeaderTypeThreshold;
    bamEasyTable.sectionHeaderThreshold = 20;
    
    // These are just to make the footer prettier by saying "X Presidents" rather than the default "X Items".
    bamEasyTable.countLabelTextSingular = @"Blogger Term";
    bamEasyTable.countLabelTextPlural = @"Blogger Terms";
    
    // But if you don't want a footer with the count in your table, simply uncomment the line below.
    //bamEasyTable.showCountInFooter = NO;
    
    // You can pass in the name of a method that returns a string for these two:
    bamEasyTable.textStringMethodName = @"term";
    bamEasyTable.detailStringMethodName = @"definition";
    
    // Uncomment the line below to see how to search more than just the main text. In the DictionaryEnrty class there is a method called "searchString" which concatenates the term, alsoTerm and definition into a single string. When this class is passed to BAMEasyTable, it will be used to determine if the cell matches the search term.
    //bamEasyTable.searchStringMethodName = @"searchString";
    
    // Setting some colors just because I can. ;)
    bamEasyTable.searchHeaderColor = blueGrayColor;
    bamEasyTable.topBoundsViewColor = blueGrayColor;
    bamEasyTable.countLabel.textColor = blueGrayColor;
    
    // Changing the font of the count footer is easy, too.
    bamEasyTable.countLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    
    // Pass in my titles array.
    bamEasyTable.headerTitles = (NSArray *)titles;
    
    // Pass in my index titles array.
    bamEasyTable.indexTitles = (NSArray *)indexTitles;
    
    // Pass in the footers if you like. Just uncommnet the line below.
    //bamEasyTable.footerTitles = (NSArray *)footerTitles;
    
    // Since I have an array of arrays I use the loadTableFromArrayOfArrays: method instead of the loadTableFromArray: method.
    // NOTE: It is important to load the table after setting all of your options. Once the table is loaded, you should not change the options.
    [bamEasyTable loadTableFromArrayOfArrays:(NSArray *)entries];
    
    // Push the BAMEasyTable onto the navigation controller.
    [self.navigationController pushViewController:bamEasyTable animated:YES];
    
    // Release everything when you're done.
    [indexTitles release];
}

#pragma mark - BAMEasyTableDelegate Methods

- (void)bamEasyTable:(BAMEasyTable *)easyTable didSelectObject:(id)selectedObject {
    // This delegate method will be called when a user selects an item in the table. The object is provided so that you can access whatever data you need from the object. However, the index path is not provided since the object may be in a search result and hence have a different index path that you may be expecting.
    DictionaryEntry *entry = (DictionaryEntry *)selectedObject;
    EntryViewController *entryViewController = [[EntryViewController alloc] init];
    entryViewController.entry = entry;
    entryViewController.delegate = self;
    [self.navigationController pushViewController:entryViewController animated:YES];
    [entryViewController release];
}

- (void)bamEasyTable:(BAMEasyTable *)easyTable cellForCustomization:(UITableViewCell *)cell withObject:(id)currentObject {
    // If you need to customize one of UITableView's standard cells you can simply use this delegate which is called after each cell is created but prior to adding it to the table. In this example, I'm changing the accessory type, selection style and text label font of every cell. Make sure any code here is lightweight or it can slow down your table scrolling. The object is provided so that you can access whatever data you need from the object. However, the index path is not provided since the object may be in a search result and hence have a different index path that you may be expecting.
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.textColor = blueGrayColor;
    cell.textLabel.font = [UIFont fontWithName:@"Georgia-Bold" size:18.0f];
}

- (void)bamEasyTableAddButtonPressed:(BAMEasyTable *)easyTable {
    // Since we're now showing the add button, we should respond to this delegate so we can handle the display of a form for editing the item.
    EntryViewController *entryViewController = [[EntryViewController alloc] init];
    DictionaryEntry *entry = [[DictionaryEntry alloc] init];
    entryViewController.entry = entry;
    [entry release];
    entryViewController.delegate = self;
    entryViewController.shouldBeginInEditMode = YES;
    [self.navigationController pushViewController:entryViewController animated:YES];
    [entryViewController release];
}

- (CGFloat)bamEasyTable:(BAMEasyTable *)easyTable heightForHeaderInSection:(NSInteger)section {
    // This simply returns the height for the section header. This delegate is only needed if you are providing a custom header view.
    return 30;
}

- (UIView *)bamEasyTable:(BAMEasyTable *)easyTable viewForHeaderInSection:(NSInteger)section withTitle:(NSString *)title {
    // You can provide a custom UIView to be used as the header for any section.
    UIView *sectionHeaderView = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 30.0f)] autorelease];
    [sectionHeaderView setBackgroundColor:blueGrayColor];
    UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10.0f, 6.0f, 310.0f, 18.0f)] autorelease];

    titleLabel.text = title;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    titleLabel.shadowColor = [UIColor darkGrayColor];
    titleLabel.shadowOffset = CGSizeMake(-1.0f, 1.0f);
    [sectionHeaderView addSubview:titleLabel];
    return sectionHeaderView;
}

- (void)bamEasyTable:(BAMEasyTable *)easyTable didRemoveItemAtIndexPath:(NSIndexPath *)indexPath {
    // When an item is deleted from the table this delegate is called. This delegat will not called if you directly call BAMEasyTable's removeRowsAtIndexPaths:withRowAnimation: method to keep your code from double deleting items.
    NSMutableArray *newSection = [[NSMutableArray alloc] initWithArray:[entries objectAtIndex:indexPath.section]];
    [newSection removeObjectAtIndex:indexPath.row];
    [entries replaceObjectAtIndex:indexPath.section withObject:newSection];
    //titles = [[NSArray alloc] initWithArray:newTitles];
    [newSection release];

    //[[entries objectAtIndex:indexPath.section] removeIndex:indexPath.row];
    [self saveEntries];
}

- (BOOL)bamEasyTable:(BAMEasyTable *)easyTable canRemoveSection:(NSUInteger)section {
    // This delegate is optional. If you leave it out it will default to YES.
    // You can keep BAMEasyTable from deleting a section when it becomes empty by specifying NO.
    return YES;
}

- (void)bamEasyTable:(BAMEasyTable *)easyTable didRemoveSection:(NSUInteger)section {  
    // When a section is automatically removed by BAMEasyTable, this delegate will be called. It will not be called if you directly call BAMEasyTable's removeSections:withRowAnimation: method to keep your code from double deleting sections.
    [entries removeObjectAtIndex:section];
    [titles removeObjectAtIndex:section];
    [self saveEntries];
}

// Uncomment these two methods to create a custom footer view.
/*- (CGFloat)bamEasyTable:(BAMEasyTable *)easyTable heightForFooterInSection:(NSInteger)section {
    // This simply returns the height for the section footer. This delegate is only needed if you are providing a custom footer view.
    return 30;
}

- (UIView *)bamEasyTable:(BAMEasyTable *)easyTable viewForFooterInSection:(NSInteger)section withTitle:(NSString *)title {
    // You can provide a custom UIView to be used as the footer for any section.
    UIView *sectionHeaderView = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 30.0f)] autorelease];
    [sectionHeaderView setBackgroundColor:[UIColor whiteColor]];
    UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10.0f, 6.0f, 310.0f, 18.0f)] autorelease];
    
    titleLabel.text = title;
    titleLabel.textColor = blueGrayColor;
    titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [sectionHeaderView addSubview:titleLabel];
    return sectionHeaderView;
}*/


#pragma mark - EntryViewControllerDelegate Methods

- (void)entryViewfinishedEditing:(DictionaryEntry *)entry {
    // This is a delegate from the PresidentViewController which is resposible for adding and deleting entries.
    NSIndexPath *indexPath = nil;
    
    // Checking to see if the entry already exists in our data.
    for (int i=0; i < [entries count]; i++) {
        NSMutableArray *section = (NSMutableArray *)[entries objectAtIndex:i];
        if ([section containsObject:entry]) {
            indexPath = [NSIndexPath indexPathForRow:[section indexOfObject:entry] inSection:i];
        }
    }
    if (indexPath != nil) {
        // The entry already exists so we update the entry in our table.
        [bamEasyTable.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else {
        // The entry is new.
        // First let's check to see if there is already an appropriate title in our titles array.
        NSString *firstCharacter = [[[[entry.term substringToIndex:1] uppercaseString] copy] autorelease];
        NSInteger titleIndex = 0;
        BOOL titleAlreadyExists = NO;
        for (int i=0; i < [titles count]; i++) {
            if ([firstCharacter compare:[titles objectAtIndex:i]] == NSOrderedSame) {
                titleAlreadyExists = YES;
                titleIndex = i;
            }
        }
        
        if (!titleAlreadyExists) {
            // There's no title already so we need to figure out where to put the new title.
            if ([firstCharacter compare:[titles objectAtIndex:0]] == NSOrderedAscending) {
                titleIndex = 0;
            }
            else {
                titleIndex = 0;
                for (int i=0; i < [titles count]; i++) {
                    if ([firstCharacter compare:[titles objectAtIndex:i]] == NSOrderedDescending) {
                        titleIndex = i+1;
                    }
                } 
            }
            
            // There's no title already so we create a new title in the table.
            [bamEasyTable insertSection:titleIndex withHeaderTitle:firstCharacter indexTitle:firstCharacter  footerTitle:nil rowAnimation:UITableViewRowAnimationRight];
            // Then add the object to that new section.
            [bamEasyTable insertRowObject:entry atIndexPath:[NSIndexPath indexPathForRow:0 inSection:titleIndex] withRowAnimation:UITableViewRowAnimationRight];
            
            // We also need to update our own entries and titles array.
            if (titleIndex < [titles count]) {
                [titles insertObject:firstCharacter atIndex:titleIndex];
                [entries insertObject:[NSArray arrayWithObject:entry] atIndex:titleIndex];
            } else {
                [titles addObject:firstCharacter];
                [entries addObject:[NSArray arrayWithObject:entry]];
            }
        } else {
            // The section already exists so we need to create a temporary section to replace our old one.
            NSMutableArray *newSection = [[NSMutableArray alloc] initWithArray:[entries objectAtIndex:titleIndex]];
            
            // Add our new object to the new section.
            [newSection addObject:entry];
            
            // Sort the new section so the new row will be in the right location.
            NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"term" ascending:YES selector:@selector(caseInsensitiveCompare:)];
            NSArray *sortedSection = [newSection sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
            [sortDescriptor release];
            [newSection release];
            
            // Figure out where the new row was added.
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sortedSection indexOfObject:entry] inSection:titleIndex];
            
            // Then insert the new row into our table.
            [bamEasyTable insertRowObject:entry atIndexPath:indexPath withRowAnimation:UITableViewRowAnimationRight];
            
            // Finally, we need to update our own entries array.
            [entries replaceObjectAtIndex:titleIndex withObject:sortedSection];
        }
    }
    // Save the changes to disk.
    [self saveEntries];
}


#pragma mark - Data Methods

- (NSString *)titlesFilePath {
    // This the file path for the titles plist.
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DictionaryTitles.plist"];
}

- (NSString *)entriesFilePath {
    // This the file path for the entries plist.
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DictionaryEntries.plist"];
}

- (void)loadEntries {
    BOOL forceReloadFromArrays = YES; // Change to yes to recreate the data from the arrays.
    
    // If the file already exists then load it otherwise create the arrays.
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self entriesFilePath]] && [[NSFileManager defaultManager]fileExistsAtPath:[self titlesFilePath]] && !forceReloadFromArrays) {
        titles = [[NSMutableArray arrayWithContentsOfFile:[self titlesFilePath]] retain];
        entries =  [[NSKeyedUnarchiver unarchiveObjectWithFile:[self entriesFilePath]] retain];
    } else {
        [self createEntriesArray];
        [self saveEntries];
    }
}

- (void)saveEntries {
    // Writes our arrays to disk.
    [titles writeToFile:[self titlesFilePath] atomically:NO];
    [NSKeyedArchiver archiveRootObject:entries toFile:[self entriesFilePath]];
}

- (void)createEntriesArray {
    // Just like the other demos, we creat a bunch of arrays.
    NSArray *terms = [[NSArray alloc] initWithObjects:@"Atom", @"audioblog", @"autocasting", @"blawg", @"bleg", @"blog carnival", @"blog client", @"blogger", @"bloggernacle", @"Bloggies", @"blogosphere", @"BlogPatrol", @"blogroll", @"blogware", @"BOBs, The", @"catblogging", @"collaborative blog", @"comment spam", @"desktop blogging client", @"fisking", @"flog", @"feeds", @"j-blog", @"legal blog", @"litblog", @"milblog", @"moblog", @"mommy blog", @"multiblog", @"NaBloPoMo", @"permalink", @"phlog", @"photoblog", @"pingback", @"podcasting", @"post", @"post slug", @"RSS", @"RSS aggregator", @"RSS feed", @"search engine friendly URL", @"spam blog", @"Slashdot effect", @"subscribe", @"templates", @"theme", @"trackback", @"vlog", @"vlogger", @"warblog", @"weblog", nil];
    
    NSArray *lexicalCategories = [[NSArray alloc] initWithObjects:@"noun", @"noun", @"verb", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"verb", @"noun", @"noun", @"noun", @"verb", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"verb", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"verb", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", @"noun", nil];
    
    NSArray *alsoTerms = [[NSArray alloc] initWithObjects:@"", @"", @"", @"", @"", @"", @"weblog client", @"", @"", @"", @"", @"", @"", @"", @"", @"Friday catblogging", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"reader or feedreader", @"", @"fancy URL", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", nil];
    
    NSArray *definitions = [[NSArray alloc] initWithObjects:
                            @"A popular feed format developed as an alternative to RSS.",
                            @"A blog where the posts consist mainly of voice recordings sent by mobile phone, sometimes with some short text message added for metadata purposes. (cf. podcasting)",
                            @"Automated form of podcasting that allows bloggers and blog readers to generate audio versions of text blogs from RSS feeds.",
                            @"A law blog.",
                            @"An entry in a blog requesting information or contributions.",
                            @"A blog article that contains links to other articles covering a specific topic. Most blog carnivals are hosted by a rotating list of frequent contributors to the carnival, and serve to both generate new posts by contributors and highlight new bloggers posting matter in that subject area.",
                            @"Software to manage (post, edit) blogs from operating system with no need to launch a web browser. A typical blog client has an editor, a spell-checker and a few more options that simplify content creation and editing.",
                            @"A person who runs a blog. Also blogger.com, a popular blog hosting web site. Rarely: weblogger.",
                            @"Blogs written by and for Mormons (a portmanteau of ""blog"" and ""Tabernacle""). Generally refers to faithful Mormon bloggers and sometimes refers to a specific grouping of faithful Mormon bloggers.",
                            @"One of the most popular blog awards.",
                            @"All blogs, or the blogging community.",
                            @"A free blog counter that allows bloggers to track visitors and provides related web analytics data such as pageviews, keywords, and countries.",
                            @"A list of other blogs that a blogger might recommend by providing links to them (usually in a sidebar list).",
                            @"A category of software which consists of a specialized form of a Content Management System specifically designed for creating and maintaining weblogs.",
                            @"The largest international blog awards.",
                            @"The practice of posting pictures of cats, in typical cat postures and expressions, on a blog. Sometimes a comment on the cat or the situation shown is provided. 'Catblogging' as a distinct and defined practice originated on Calpundit.com, by Kevin Drum. He also established Friday as the canonical catblogging day.",
                            @"A blog (often focused on a single issue or political stripe) on which multiple users enjoy posting permission. Also known as group blog.",
                            @"Like e-mail spam. Robot “spambots” flood a blog with advertising in the form of bogus comments. A serious problem that requires bloggers and blog platforms to have tools to exclude some users or ban some addresses in comments.",
                            @"An off-line blog management tool used for posting, editing and archiving posts.",
                            @"To rebut a blog entry in a line-by-line fashion.",
                            @"1. A portmanteau of ""fake"" and ""blog"". A blog that's ghostwritten by someone, such as in the marketing department.\n\n2. A food blog; sometimes, a blog dedicated to food porn.",
                            @"RSS Feeds.",
                            @"1. A journalist blog.\n\n2. A blog with a Jewish focus.",
                            @"A blog about law.",
                            @"A blog that focuses primarily on the topic of literature.",
                            @"A term for blogs written by members or veterans of any branch of military service. A contraction of military and blog.",
                            @"A portmanteau of ""mobile"" and ""blog"". A blog featuring posts sent mainly by mobile phone, using SMS or MMS messages. They are often photoblogs.",
                            @"A blog featuring discussions especially about home and family.",
                            @"A blog constructed as a conversation between more than two people.",
                            @"A portmanteau of National Blog Posting Month. Writing a post every day for a month on one's blog. Began in 2006 as an alternative challenge to National Novel Writing Month, which is an annual challenge to write a 50,000 word novel in the month of November. After a couple years of holding NaBloPoMo exclusively in November, the challenge was expanded to include participants every month though prizes are only awarded in November.",
                            @"Permanent link. The unique URL of a single post.",
                            @"1. Type of blog utilizing the Gopher protocol instead of HTTP.\n\n2. A photoblog. A portmanteau of ""photo"" and ""blog"".",
                            @"A blog mostly containing photos, posted constantly and chronologically.",
                            @"The alert in the trackback system that notifies the original poster of a blog post when someone else writes an entry concerning the original post.",
                            @"Posting audio and video material on a blog and its RSS feed, for digital players. A contraction of ""iPod"" and ""broadcasting"" but the term can refer to any blog of audio content regardless of whether an iPod is used.",
                            @"An entry written and published to a blog.",
                            @"For blogs with common language URLs, the post slug is the portion of the URL that represents the post. Example: http://example.com/2008/01/this-is-the-post-slug",
                            @"The abbreviation for Really Simple Syndication which is a family of Web feed formats used to publish frequently updated content such as blog entries, news headlines or podcasts.",
                            @"Software or online service allowing a blogger to read an RSS feed, especially the latest posts on their favorite blogs.",
                            @"A file containing a blog’s latest posts. It is read by an RSS aggregator/reader and immediately updates when a blog has been updated. It may contain only the title of the post, the title plus the first few lines of a post, or the entire post.",
                            @"A rewritten URL used to provide shorter and more relevant-looking links to web pages.",
                            @"A blog which is composed of spam. A Spam blog or any blog whose creator doesn't add any written value.",
                            @"A temporary slowing or shutdown of a web server caused by excess traffic from a link posted to a popular website. Named after the news aggregator site, Slashdot, but the term refers to any similar instance from any popular site.",
                            @"The term used when a blogs feed is added to a feed aggregator. Some blogging platforms have internal subscriptions, this allows readers to receive a notification when there are new posts in a blog.",
                            @"Templates, used on the ""back end"" of a blog that work together to handle information and present it on a blog.",
                            @"A group of images and styling code (often CSS) that can me applied to change the visual design and layout of a blog.",
                            @"A system that allows a blogger to see when someone has written a post referencing the blogger’s original post. The system works by sending a ""ping"" between the blogs, and therefore providing an alert.",
                            @"A video blog.",
                            @"A video blogger (e.g. someone who records himself interviewing people of a certain field).",
                            @"A blog devoted mostly or wholly to covering news events concerning an ongoing war.",
                            @"A blog. As opposed to the usual contraction of ""blog"".", nil];
    
    // Create an array of arrays with our custom objects in appropriate sections and create a titles array.
    NSString *currentCharacter = @"";
    NSString *previousCharacter = @"";
    entries = [[NSMutableArray alloc] init];
    titles = [[NSMutableArray alloc] init];
    NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
    NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"term" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    
    for (int i=0; i < [terms count]; i++) {
        DictionaryEntry *entry = [[DictionaryEntry alloc] init];
        entry.term = [terms objectAtIndex:i];
        entry.alsoTerm = [alsoTerms objectAtIndex:i];
        entry.lexicalCategory = [lexicalCategories objectAtIndex:i];
        entry.definition = [definitions objectAtIndex:i];
        
        currentCharacter = [[[[entry.term substringToIndex:1] uppercaseString] copy] autorelease];
        if (![currentCharacter isEqualToString:previousCharacter]) {
            [titles addObject:[[currentCharacter copy] autorelease]];
            if ([sectionArray count] > 0) {
                [entries addObject:[sectionArray sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]]];
            }
            [sectionArray removeAllObjects];
        }
        [sectionArray addObject:entry];
        previousCharacter = [[currentCharacter copy] autorelease];
        
        [entry release];
    }
    [entries addObject:[sectionArray sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]]];
    
    // Then release everything when we're done.
    [sortDescriptor release];
    [sectionArray release];
    [terms release];
    [alsoTerms release];
    [lexicalCategories release];
    [definitions release];
}

@end
