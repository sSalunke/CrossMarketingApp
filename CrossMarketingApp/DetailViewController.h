//
//  DetailViewController.h
//  CrossMarketingApp
//
//  Created by swapnil salunke on 12/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LazyImageLoader.h"

@interface DetailViewController : UIViewController

@property (retain, nonatomic) IBOutlet LazyImageLoader *imageHolder;

@property (retain, nonatomic) IBOutlet UILabel *appTitle;

@property (retain, nonatomic) IBOutlet UITextView *appDescription;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *barButtonPrevious;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *barButtonNext;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *barButtonGetApplication;

@property (retain, nonatomic) IBOutlet UIToolbar *descToolBar;

@property (nonatomic,readwrite) NSInteger currentIndex;
@property (nonatomic, copy) NSArray *arrayOfItems;

- (IBAction)getPreviousItem:(id)sender;

- (IBAction)getNextItem:(id)sender;

- (IBAction)getTheApplication:(id)sender;


@end
