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
@end
