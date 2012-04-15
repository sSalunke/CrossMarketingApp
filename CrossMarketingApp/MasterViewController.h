//
//  MasterViewController.h
//  CrossMarketingApp
//
//  Created by swapnil salunke on 12/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (nonatomic, strong) NSArray *arrayOfRecords;

@end
