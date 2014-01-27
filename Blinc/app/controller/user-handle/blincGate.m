
//  blincGate.m
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "blincGate.h"

@implementation blincGate

-(id)initWithMerchant:(NSDictionary *)dictionary{
	self = [super init];
	if(self){
		self.merchant_id = [[dictionary objectForKey:@"id"] stringValue];
		self.merchant_name = [dictionary objectForKey:@"name"];
		self.merchant_address = [dictionary objectForKey:@"address"];
		if([dictionary objectForKey:@"logo_url"]==[NSNull null])
			self.merchant_logo_url = @"";
		else
			self.merchant_logo_url = [dictionary objectForKey:@"logo_url"];
		
	}
	return self;
}
-(id)initWithPlace:(NSDictionary *)dictionary{
	self = [super init];
	if(self){
		self.merchant_id = [[dictionary objectForKey:@"id"] stringValue];
		self.merchant_name = [dictionary objectForKey:@"name"];
		self.merchant_address = [dictionary objectForKey:@"address"];
		self.place_checkin_points = [[dictionary objectForKey:@"checkin_points"]stringValue];
		self.place_user_total_points = [[dictionary objectForKey:@"user_total_points"]stringValue];
		if([dictionary objectForKey:@"logo_url"]==[NSNull null])
			self.merchant_logo_url = @"";
		else
			self.merchant_logo_url = [dictionary objectForKey:@"logo_url"];
		
	}
	return self;
}
+ (NSURLSessionDataTask *)getMerchant:(void (^)(NSArray *returnData, NSError *error))block{
	[netraNetwork sharedClient].requestSerializer = [AFJSONRequestSerializer serializer];
	[[netraNetwork sharedClient].requestSerializer setValue:[NSString stringWithFormat:@"Token %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"token"]] forHTTPHeaderField:@"Authorization"];
	[netraNetwork sharedClient].responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
	return [[netraNetwork sharedClient]GET:@"merchants" parameters:Nil success:^(NSURLSessionDataTask *task, id responseObject) {
		NSMutableArray *mutablePosts = [[NSMutableArray alloc]initWithCapacity:[responseObject count]];
		for (NSDictionary *attributes in responseObject) {
			
			blincGate *merchant = [[blincGate alloc] initWithMerchant:attributes];
			if(![mutablePosts containsObject:merchant]){
				[mutablePosts addObject:merchant];
			}
		}
		if (block) {
            block([NSArray arrayWithArray:mutablePosts], nil);
        }

	} failure:^(NSURLSessionDataTask *task, NSError *error) {
	
	}];

}
+ (NSURLSessionDataTask *)getPlace:(void (^)(NSArray *returnData, NSError *error))block{
	[netraNetwork sharedClient].requestSerializer = [AFJSONRequestSerializer serializer];
	[[netraNetwork sharedClient].requestSerializer setValue:[NSString stringWithFormat:@"Token 611dbe4e840b4c26b54add0003be1331652976431dc8442c5d5e3541d3549202"/*[[NSUserDefaults standardUserDefaults] objectForKey:@"token"]*/] forHTTPHeaderField:@"Authorization"];
	[netraNetwork sharedClient].responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
	return [[netraNetwork sharedClient]GET:@"me/places" parameters:Nil success:^(NSURLSessionDataTask *task, id responseObject) {
		NSLog(@"log->%@",responseObject);
		NSMutableArray *mutablePosts = [[NSMutableArray alloc]initWithCapacity:[responseObject count]];
	
		for (NSDictionary *attributes in responseObject) {
			NSLog(@"attr-->%@",attributes);
			blincGate *place = [[blincGate alloc] initWithPlace:attributes];
			if(![mutablePosts containsObject:place]){
				[mutablePosts addObject:place];
			}
		}
		if (block) {
            block([NSArray arrayWithArray:mutablePosts], nil);
        }

	} failure:^(NSURLSessionDataTask *task, NSError *error) {
		
	}];
	
}
@end
