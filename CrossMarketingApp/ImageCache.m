//
//  ImageCache.m
//  CrossMarketingApp
//
//  Created by swapnil salunke on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageCache.h"

@implementation ImageCache

+ (ImageCache *)sharedImageCache
{
    static ImageCache *sharedImageCache = nil;
    
    @synchronized(self)
    {
        if (!sharedImageCache)
            sharedImageCache = [[ImageCache alloc] init];
        
        return sharedImageCache;
    }
}

- (id) init
{
    self = [super init];
    
    cache = [[[NSMutableDictionary alloc] init] retain];
    
    return self;
}

- (void) flushCache
{
    [cache removeAllObjects];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}
- (id)retain {
    return self;
}
- (unsigned)retainCount {
    return UINT_MAX; //denotes an object that cannot be released
}
- (oneway void)release {
    // never release
}

- (BOOL) isImageCached:(NSString*)imageURL
{
    bool exist = NO;
    @synchronized(self)
    {
        if([[cache allKeys] containsObject:imageURL])
            exist = YES;
    }
    
    return exist;
}

- (UIImage*) getCachedImage:(NSString*)imageURL
{
    if ([self isImageCached:imageURL])
        return [cache objectForKey:imageURL];
    else
        return nil;
}

- (void) cacheImage:(UIImage*)image key:(NSString*)imageURL
{
    [cache setObject:image forKey:imageURL];
}

- (void)dealloc
{
    [cache release];
    [super dealloc];
}


@end
