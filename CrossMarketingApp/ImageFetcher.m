//
//  ImageFetcher.m
//  IAA
//
//  Created by swapnil salunke on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageFetcher.h"
#import "ImageCache.h"

@implementation ImageFetcher

@synthesize delegate;

- (id)init {
    self = [super init];
    if (self) {
        // Initialization code here.
    }

    return self;
}

- (void)fetchImage:(NSString *)imageURL {
    [curImageURL release];
    curImageURL = [imageURL retain];

    [self cancelLastRequest];

    if ([[ImageCache sharedImageCache] isImageCached:imageURL]) {
        if ([self.delegate respondsToSelector:@selector(imageFetcher:didLoadImage:imageURL:)]) {
            [self.delegate imageFetcher:self didLoadImage:[[ImageCache sharedImageCache] getCachedImage:imageURL] imageURL:imageURL];
        }
    }
    else {
        NSURL *ImageURL = [NSURL URLWithString:imageURL];
        NSURLRequest *request = [NSURLRequest requestWithURL:ImageURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:120];
        [imageData release];
        imageData = [[NSMutableData alloc] init];
        latestConenction = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    }
}

- (void)cancelLastRequest {
    LogDebug(@"CancelLastRequest");
    if (latestConenction) {
        [latestConenction cancel];
        [latestConenction release];
        latestConenction = nil;
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [imageData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    LogDebug(@"connectionDidFailWithError");
    if ([self.delegate respondsToSelector:@selector(imageFetcher:couldNotLoadImage:)]) {
        [self.delegate imageFetcher:self couldNotLoadImage:error];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    LogDebug(@"connectionDidFinishLoading");
    UIImage *image = [[[UIImage alloc] initWithData:imageData] autorelease];

    if (![[ImageCache sharedImageCache] isImageCached:curImageURL])
        [[ImageCache sharedImageCache] cacheImage:image key:curImageURL];
    else
        image = [[ImageCache sharedImageCache] getCachedImage:curImageURL];

    if ([self.delegate respondsToSelector:@selector(imageFetcher:didLoadImage:imageURL:)]) {
        [self.delegate imageFetcher:self didLoadImage:image imageURL:curImageURL];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    if ([response respondsToSelector:@selector(statusCode)]) {
        int statusCode = [((NSHTTPURLResponse *) response) statusCode];
        LogDebug(@"didReceiveResponse - %d", statusCode);
        if (statusCode >= 400) {
            [connection cancel];  // stop connecting; no more delegate messages
            NSDictionary *errorInfo
                    = [NSDictionary dictionaryWithObject:[NSString stringWithFormat:
                            NSLocalizedString(@"Server returned status code %d", @""),
                            statusCode]
                                                  forKey:NSLocalizedDescriptionKey];
            NSError *statusError
                    = [NSError errorWithDomain:@"Error"
                                          code:statusCode
                                      userInfo:errorInfo];
            [self connection:connection didFailWithError:statusError];
        }
    }
}

- (void)dealloc {
    [latestConenction cancel];
    [latestConenction release];
    [curImageURL release];
    [imageData release];
    [super dealloc];
}

@end
