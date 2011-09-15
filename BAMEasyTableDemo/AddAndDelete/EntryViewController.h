//
//  EntryViewController.h
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


#import <UIKit/UIKit.h>

@class DictionaryEntry;

@protocol EntryViewControllerDelegate;

@interface EntryViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate> {
    id<EntryViewControllerDelegate> delegate;
    BOOL shouldBeginInEditMode, userDidMakeChanges;
    DictionaryEntry *entry;
    UILabel *termLabel, *alsoTermLabel, *lexicalCategoryLabel;
    UITextView *definitionTextView, *definitionEntryTextView;
    UITextField *termEntryTextField, *lexicalCategoryEntryTextField, *alsoTermEntryTextField;
    UIImageView *entryFormImage;
}
@property (assign) id<EntryViewControllerDelegate> delegate;
@property (assign) BOOL shouldBeginInEditMode;
@property (nonatomic, retain) DictionaryEntry *entry;
@property (nonatomic, retain) IBOutlet UILabel *termLabel, *alsoTermLabel, *lexicalCategoryLabel;
@property (nonatomic, retain) IBOutlet UITextView *definitionTextView, *definitionEntryTextView;
@property (nonatomic, retain) IBOutlet UITextField *termEntryTextField, *lexicalCategoryEntryTextField, *alsoTermEntryTextField;
@property (nonatomic, retain) IBOutlet UIImageView *entryFormImage;

- (void)setLabels;
- (void)showEditingControls;
- (void)hideEditingControls;

@end

@protocol EntryViewControllerDelegate <NSObject>
@optional
- (void)entryViewfinishedEditing:(DictionaryEntry *)entry;
@end