//
//  blincGate.h
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface blincGate : NSObject
+ (NSURLSessionDataTask *)getPlace:(void (^)(NSArray *returnData, NSError *error))block;
+ (NSURLSessionDataTask *)getMerchant:(void (^)(NSArray *returnData, NSError *error))block;
+ (NSURLSessionDataTask *)getMerchantDetail:(void (^)(NSArray *returnData, NSError *error))block;
+ (NSURLSessionDataTask *)getMerchantRewards:(void (^)(NSArray *returnData, NSError *error))block;
+ (NSURLSessionDataTask *)login:(void (^)(NSArray *returnData, NSError *error))block;
+ (NSURLSessionDataTask *)register:(void (^)(NSArray *returnData, NSError *error))block;

@end
