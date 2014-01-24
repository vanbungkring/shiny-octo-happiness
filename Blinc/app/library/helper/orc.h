//
//  orc.h
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface orc : NSObject
extern NSString *const serverUrl;
extern NSString *const first_token;
+(orc *) sharedInstance;
+(void)setTokenCredentials:(NSString *)username email:(NSString *)email token:(NSString *)token;
+(NSUserDefaults *)getCrredentials;
@end
