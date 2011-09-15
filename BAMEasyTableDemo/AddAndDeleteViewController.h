//
//  LaunchAddDeleteViewController.h
//  BAMEasyTableDemo
//
//  Created by Barry Murphy on 9/10/11.
//  Copyright 2011 Barry Murphy. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddAndDeleteViewController : UIViewController {
    UITextView *textView;
    UIButton *launchButton;
}
@property (nonatomic, retain) IBOutlet UITextView *textView;
@property (nonatomic, retain) IBOutlet UIButton *launchButton;

- (IBAction)buttonPressed:(id)sender;

@end
