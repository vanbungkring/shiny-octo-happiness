//
//  blincAppDelegate.h
//  Blinc
//
//  Created by Flash on 1/3/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface blincAppDelegate : UIResponder <UIApplicationDelegate>
{
	UINavigationController *nav;
	
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ICETutorialController *viewController;
-(void)checkToken;
@end
