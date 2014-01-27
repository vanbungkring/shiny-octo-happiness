//
//  blincGate.h
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface blincGate : NSObject
/////merchantlist
@property(nonatomic,strong)NSString *merchant_id;
@property(nonatomic,strong)NSString *merchant_name;
@property(nonatomic,strong)NSString *merchant_address;
@property(nonatomic,strong)NSString *merchant_logo_url;

@property(nonatomic,strong)NSString *place_checkin_points;
@property(nonatomic,strong)NSString *place_user_total_points;


-(id)initWithMerchant:(NSDictionary *)dictionary;
-(id)initWithPlace:(NSDictionary *)dictionary;


+ (NSURLSessionDataTask *)getPlace:(void (^)(NSArray *returnData, NSError *error))block;
+ (NSURLSessionDataTask *)getMerchant:(void (^)(NSArray *returnData, NSError *error))block;
+ (NSURLSessionDataTask *)getMerchantDetail:(void (^)(NSArray *returnData, NSError *error))block;
+ (NSURLSessionDataTask *)getMerchantRewards:(void (^)(NSArray *returnData, NSError *error))block;

@end
