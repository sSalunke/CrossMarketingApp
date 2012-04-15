//
//  AppInfo.h
//  CrossMarketingApp
//
//  Created by Swapnil Salunke on 16/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LazyImageLoader.h"

@interface AppInfo : UITableViewCell

@property (retain, nonatomic) IBOutlet LazyImageLoader *imageView;
@property (retain, nonatomic) IBOutlet UILabel *appTitle;
@property (retain, nonatomic) IBOutlet UILabel *appShortDesc;

@end
