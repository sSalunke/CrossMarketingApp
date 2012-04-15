//
//  AppInfo.m
//  CrossMarketingApp
//
//  Created by Swapnil Salunke on 16/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo
@synthesize imageView;
@synthesize appTitle;
@synthesize appShortDesc;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [imageView release];
    [appTitle release];
    [appShortDesc release];
    [super dealloc];
}
@end
