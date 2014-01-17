//
//  netraNetwork.h
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface netraNetwork : AFHTTPSessionManager
+ (instancetype)sharedClient;
@end
