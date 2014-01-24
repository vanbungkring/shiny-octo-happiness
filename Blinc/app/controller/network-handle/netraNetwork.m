//
//  netraNetwork.m
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "netraNetwork.h"

@implementation netraNetwork

+ (instancetype)sharedClient {
    static netraNetwork *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
		NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
		
		[config setHTTPAdditionalHeaders:@{@"content-Type": @"application/json"}];
		[config setHTTPAdditionalHeaders:@{@"Authorization":@"Token 5896720b0f2d85009e5dc9df89f2d8aceea55466078b7a2093ae7e5c897fcaa5"}];
		NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                          diskCapacity:50 * 1024 * 1024
                                                              diskPath:nil];
        
        [config setURLCache:cache];
		
		_sharedClient = [[netraNetwork alloc] initWithBaseURL:[NSURL URLWithString:serverUrl]
										sessionConfiguration:config];
		
		_sharedClient.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
		
	
    });
    
    return _sharedClient;
}
@end
