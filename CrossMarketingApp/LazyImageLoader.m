//
//  LazyImageLoader.m
//  CrossMarketingApp
//
//  Created by swapnil salunke on 13/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LazyImageLoader.h"

@interface LazyImageLoader()
{
    NSMutableData *imageData;
}

@end

@implementation LazyImageLoader

-(void)getAppImageLazilyWithImagePath:(NSString *)imagePath;
{
    
    NSURL *url = [[NSURL alloc]initWithString:imagePath];
    
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:imageRequest delegate:self startImmediately:YES];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSInteger statusCode;
    if ([response isKindOfClass:[NSHTTPURLResponse class]])
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        statusCode = [httpResponse statusCode];
    }   
    
    if (statusCode == 200) 
    {
        if (imageData) 
        {
            [imageData release];
            imageData = nil;
        }
        imageData = [[NSMutableData alloc]init];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [imageData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [connection release];
    
    UIImage *newImage = [UIImage imageWithData:imageData];
    
    if (!newImage) {
        
        [self setImage:[UIImage imageNamed:@"Icon-72.png"]];
        return; 
    }
    
    [self performSelectorOnMainThread:@selector(setImage:) withObject:newImage waitUntilDone:YES];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Failed to fetch image");
    
   // [self setImage:[UIImage imageNamed:@"Icon-72.png"]];
}


@end
