//
//  LazyImageLoader.h
//  CrossMarketingApp
//
//  Created by swapnil salunke on 13/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "ImageFetcher.h"

@interface LazyImageLoader : UIImageView<ImageFetcherDelegate>


-(void)getAppImageLazilyWithImagePath:(NSString *)imagePath; 

@end
