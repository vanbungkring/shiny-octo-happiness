//
//  orc.m
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "orc.h"

@implementation orc

#ifdef DEBUG
NSString* const serverUrl = @"http://dev.getblinc.com:8080/api/v1/";
#else
NSString *const serverUrl = @"http://dev.getblinc.com:8080/api/v1/";
#endif
NSString *const first_token = @"dc67bbf0f93e3740523956e58e62bf7bc2cc7904db43de5d9fccbb2993ac5771";


static orc *sharedObject;

+ (orc*)sharedInstance
{
	if (sharedObject == nil) {
        sharedObject = [[super allocWithZone:NULL] init];
    }
	
    return sharedObject;
}
+(void)setTokenCredentials:(NSString *)username email:(NSString *)email token:(NSString *)token{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:username forKey:@"username"];
    [defaults setObject:email forKey:@"email"];
    [defaults setObject:token forKey:@"token"];
    [defaults synchronize];
    NSLog(@"Data saved");
	
}
+(NSUserDefaults *)getCrredentials{
	return [NSUserDefaults standardUserDefaults];
}

@end
