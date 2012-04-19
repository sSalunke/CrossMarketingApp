//
//  ImageFetcher.h
//  IAA
//
//  Created by swapnil salunke on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageFetcherDelegate.h"


@interface ImageFetcher : NSObject{
    NSURLConnection *latestConenction;
    NSMutableData *imageData;
    NSString *curImageURL;
}

@property (nonatomic, assign) NSObject<ImageFetcherDelegate> *delegate;

- (void) fetchImage:(NSString*)imageURL;

- (void) cancelLastRequest;

@end
