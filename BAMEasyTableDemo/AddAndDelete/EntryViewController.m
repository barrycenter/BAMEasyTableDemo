//
//  EntryViewController.m
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


#import "EntryViewController.h"
#import "DictionaryEntry.h"


@implementation EntryViewController

@synthesize delegate;
@synthesize shouldBeginInEditMode;
@synthesize entry;
@synthesize termLabel, alsoTermLabel, lexicalCategoryLabel;
@synthesize definitionTextView, definitionEntryTextView;
@synthesize termEntryTextField, lexicalCategoryEntryTextField, alsoTermEntryTextField;
@synthesize entryFormImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        shouldBeginInEditMode = NO;
        userDidMakeChanges = NO;
    }
    return self;
}

- (void)dealloc {
    [entry release];
    [termLabel release];
    [alsoTermLabel release];
    [lexicalCategoryLabel release];
    [definitionTextView release];
    [definitionEntryTextView release];
    [termEntryTextField release];
    [lexicalCategoryEntryTextField release];
    [alsoTermEntryTextField release];
    [entryFormImage release];
    
    [super dealloc];
}


#pragma mark - View Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"Definition";
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setLabels];
    
    [self hideEditingControls];
    
    termEntryTextField.delegate = self;
    lexicalCategoryEntryTextField.delegate = self;
    alsoTermEntryTextField.delegate = self;
    definitionEntryTextView.delegate = self;
    
    UIColor *blueGrayColor = [UIColor colorWithRed:71.0f/255.0f green:88.0f/255.0f blue:150.0f/255.0f alpha:1.0f];
    lexicalCategoryLabel.textColor = blueGrayColor;
    alsoTermLabel.textColor = blueGrayColor;
    
    if (shouldBeginInEditMode) [self setEditing:YES animated:NO];
}

- (void)viewDidUnload {
    [self setTermLabel:nil];
    [self setAlsoTermLabel:nil];
    [self setLexicalCategoryLabel:nil];
    [self setDefinitionTextView:nil];
    [self setTermEntryTextField:nil];
    [self setLexicalCategoryEntryTextField:nil];
    [self setDefinitionEntryTextView:nil];
    [self setAlsoTermEntryTextField:nil];
    [self setEntryFormImage:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setLabels {
    termLabel.text = entry.term;
    lexicalCategoryLabel.text = entry.lexicalCategory;
    definitionTextView.text = entry.definition;
    
    termEntryTextField.text = entry.term;
    lexicalCategoryEntryTextField.text = entry.lexicalCategory;
    definitionEntryTextView.text = entry.definition;
    
    if (entry.alsoTerm == nil || [entry.alsoTerm isEqualToString:@""]) {
        alsoTermLabel.text = @"";
        alsoTermEntryTextField.text = @"";
    }
    else {
        alsoTermLabel.text = [NSString stringWithFormat:@"also: %@", entry.alsoTerm];
        alsoTermEntryTextField.text = entry.alsoTerm;
    }
}

- (void)showEditingControls {
    termLabel.hidden = YES;
    alsoTermLabel.hidden = YES;
    lexicalCategoryLabel.hidden = YES;
    definitionTextView.hidden = YES;
    
    entryFormImage.hidden = NO;
    termEntryTextField.hidden = NO;
    alsoTermEntryTextField.hidden = NO;
    lexicalCategoryEntryTextField.hidden = NO;
    definitionEntryTextView.hidden = NO;
}

- (void)hideEditingControls {
    termLabel.hidden = NO;
    alsoTermLabel.hidden = NO;
    lexicalCategoryLabel.hidden = NO;
    definitionTextView.hidden = NO;
    
    entryFormImage.hidden = YES;
    termEntryTextField.hidden = YES;
    alsoTermEntryTextField.hidden = YES;
    lexicalCategoryEntryTextField.hidden = YES;
    definitionEntryTextView.hidden = YES;
    
    [termEntryTextField resignFirstResponder];
    [alsoTermEntryTextField resignFirstResponder];
    [lexicalCategoryEntryTextField resignFirstResponder];
    [definitionEntryTextView resignFirstResponder];
}


#pragma mark - Button Response Methods

- (void)setEditing:(BOOL)editing animated:(BOOL)animate {
    [super setEditing:editing animated:animate];
    if(editing) {
        [self showEditingControls];
    }
    else {
        [self hideEditingControls];
        
        if (self.entry.term != termEntryTextField.text && termEntryTextField.text != nil && ![termEntryTextField.text isEqualToString:@""]) {
            self.entry.term = termEntryTextField.text;
            userDidMakeChanges = YES;
        }
        if (self.entry.alsoTerm != alsoTermEntryTextField.text) {
            self.entry.alsoTerm = alsoTermEntryTextField.text;
            userDidMakeChanges = YES;
        }
        if (self.entry.lexicalCategory != lexicalCategoryEntryTextField.text) {
            self.entry.lexicalCategory = lexicalCategoryEntryTextField.text;
            userDidMakeChanges = YES;
        }
        if (self.entry.definition != definitionEntryTextView.text) {
            self.entry.definition = definitionEntryTextView.text;
            userDidMakeChanges = YES;
        }
        
        [self setLabels];
        
        if (userDidMakeChanges && self.delegate != nil && [self.delegate respondsToSelector:@selector(entryViewfinishedEditing:)] && entry.term != nil && ![entry.term isEqualToString:@""]) {
            [self.delegate entryViewfinishedEditing:entry];
        }
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField != alsoTermEntryTextField) {
        // Clumsy, I know. But I didn't want to ass any more complexity to this demo.
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        CGRect rect = self.view.frame;
        rect.origin.y = 0.0f;
        rect.size.height = 416.0;
        self.view.frame = rect;
        
        [UIView commitAnimations];
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (self.view.frame.origin.y > -50.0f) {
        // Clumsy, I know. But I didn't want to ass any more complexity to this demo.
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        
        CGRect rect = self.view.frame;
        rect.origin.y = -50.0f;
        rect.size.height = 456.0f;
        self.view.frame = rect;
        
        [UIView commitAnimations];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (userDidMakeChanges && self.delegate != nil && [self.delegate respondsToSelector:@selector(entryViewfinishedEditing:)]) {
        [self.delegate entryViewfinishedEditing:entry];
    }
}

@end
