//
//  DetailViewController.h
//  CrossMarketingApp
//
//  Created by swapnil salunke on 12/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *imageHolder;

@property (retain, nonatomic) IBOutlet UILabel *appTitle;

@property (retain, nonatomic) IBOutlet UITextView *appDescription;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *barButtonPrevious;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *barButtonNext;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *barButtonGetApplication;

@property (retain, nonatomic) IBOutlet UIToolbar *descToolBar;

- (IBAction)getPreviousItem:(id)sender;

- (IBAction)getNextItem:(id)sender;

- (IBAction)getTheApplication:(id)sender;


@end
