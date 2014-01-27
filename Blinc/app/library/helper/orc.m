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
+(void) setToken:(NSString *)tokens{
	orc *shared = [orc sharedInstance];
    shared.token = tokens;
}
+(NSString *)getToken{
	orc *shared = [orc sharedInstance];
	return shared.token;
}
+(void)showAlert:(NSString *)title message:(NSString *)message{

	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
	[alert show];
}
@end
