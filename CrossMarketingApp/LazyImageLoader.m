//
//  LazyImageLoader.m
//  CrossMarketingApp
//
//  Created by swapnil salunke on 13/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LazyImageLoader.h"

@implementation LazyImageLoader


-(void)getAppImageLazilyWithImagePath:(NSString *)imagePath;
{
    
    ImageFetcher  *imageFetcher = [[ImageFetcher alloc]init];
    
    imageFetcher.delegate = self;
    
    [imageFetcher fetchImage:imagePath];
    
    [imageFetcher autorelease];
    
    
}
- (void)imageFetcher:(ImageFetcher *)fetcher didLoadImage:(UIImage *)image imageURL:(NSString*)url
{
    [UIView animateWithDuration:0.2 
                          delay:0.0 
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL finished)
     {
         [self setImage:image];
         [UIView animateWithDuration:0.2
                             delay:0.0
                           options:UIViewAnimationOptionCurveLinear
                        animations:^{
                            self.alpha = 1;
                        } completion:^(BOOL finished)
        {}];
     }];
     }
- (void)imageFetcher:(ImageFetcher *)fetcher couldNotLoadImage:(NSError *)error
{
    NSLog(@"Failed to load original Image");
    
   // [self setImage:[UIImage imageNamed:@"Icon-72.png"]];
}



@end
