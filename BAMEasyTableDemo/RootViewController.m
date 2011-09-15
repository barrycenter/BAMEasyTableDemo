//
//  RootViewController.m
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


#import "RootViewController.h"
#import "SimpleViewController.h"
#import "GroupedViewController.h"
#import "IndexedViewController.h"
#import "AddAndDeleteViewController.h"
#import "DetailAndImageViewController.h"

@implementation RootViewController

@synthesize simpleButton;
@synthesize groupedButton;
@synthesize indexedButton;
@synthesize addAndDeleteButton;
@synthesize detailAndImageButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setting the title used by the navigationBar of the current page.
    self.title = @"BAMEasyTable Demo";
    
    // But I want a different title on the back button.
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Demos" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    // Okay, I'm a control freak and want a different color navigationBar even in a demo app.
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.0f];
    
    // I'm also putting a yellow button graphic as the background for all of the buttons.
    UIImage *buttonImage = [[UIImage imageNamed:@"Button.png"] stretchableImageWithLeftCapWidth:16 topCapHeight:16];
    [simpleButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [groupedButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [indexedButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [detailAndImageButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [addAndDeleteButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
}

- (void)viewDidUnload {
    [self setSimpleButton:nil];
    [self setGroupedButton:nil];
    [self setIndexedButton:nil];
    [self setDetailAndImageButton:nil];
    [self setAddAndDeleteButton:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [simpleButton release];
    [groupedButton release];
    [indexedButton release];
    [detailAndImageButton release];
    [addAndDeleteButton release];
    [super dealloc];
}


#pragma mark - IBAction Methods

- (IBAction)buttonPressed:(id)sender {
    // Find which button was pressed.
    if (sender == simpleButton) {
        // Creating and pushing the simple demo view.
        SimpleViewController *simpleDemo = [[SimpleViewController alloc] initWithNibName:@"SimpleViewController" bundle:nil];
        [self.navigationController pushViewController:simpleDemo animated:YES];
        [simpleDemo release];
    } else if (sender == groupedButton) {
        // Creating and pushing the grouped demo view.
        GroupedViewController *groupedDemo = [[GroupedViewController alloc] initWithNibName:@"GroupedViewController" bundle:nil];
        [self.navigationController pushViewController:groupedDemo animated:YES];
        [groupedDemo release];
    } else if (sender == indexedButton) {
        // Creating and pushing the indexed demo view.
        IndexedViewController *indexedDemo = [[IndexedViewController alloc] initWithNibName:@"IndexedViewController" bundle:nil];
        [self.navigationController pushViewController:indexedDemo animated:YES];
        [indexedDemo release];
    } else if (sender == detailAndImageButton) {
        // Creating and pushing the detail and images demo view.
        DetailAndImageViewController *detailAndImageDemo = [[DetailAndImageViewController alloc] initWithNibName:@"DetailAndImageViewController" bundle:nil];
        [self.navigationController pushViewController:detailAndImageDemo animated:YES];
        [detailAndImageDemo release];
    } else if (sender == addAndDeleteButton) {
        // Creating and pushing the add and remove demo view.
        AddAndDeleteViewController *addAndRemoveDemo = [[AddAndDeleteViewController alloc] initWithNibName:@"AddAndDeleteViewController" bundle:nil];
        [self.navigationController pushViewController:addAndRemoveDemo animated:YES];
        [addAndRemoveDemo release];
    }
}


@end
