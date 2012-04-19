//
//  ImageCache.h
//  CrossMarketingApp
//
//  Created by swapnil salunke on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCache : NSObject

{
    NSMutableDictionary *cache;
}

+ (ImageCache *)sharedImageCache;
- (BOOL) isImageCached:(NSString*)imageURL;
- (UIImage*) getCachedImage:(NSString*)imageURL;
- (void) cacheImage:(UIImage*)image key:(NSString*)imageURL;
- (void) flushCache;

@end
