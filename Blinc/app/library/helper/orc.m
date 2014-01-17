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
NSString* const serverUrl = @"http://192.241.173.178/ipin/index.php/api/";
#else
NSString *const serverUrl = @"http://192.241.173.178/ipin/index.php/api/";
#endif
@end
