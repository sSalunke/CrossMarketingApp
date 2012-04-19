//
//  ServiceConsumerDelegate.h
//  IAA
//
//  Created by swapnil salunke on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImageFetcher;

@protocol ImageFetcherDelegate

@required
- (void)imageFetcher:(ImageFetcher *)fetcher didLoadImage:(UIImage *)image imageURL:(NSString*)url;
- (void)imageFetcher:(ImageFetcher *)fetcher couldNotLoadImage:(NSError *)error;
@end