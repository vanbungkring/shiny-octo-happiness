//
//  blincAppDelegate.m
//  Blinc
//
//  Created by Flash on 1/3/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "blincAppDelegate.h"
#import "blincLoginViewController.h"

@implementation blincAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-200.f, 0) forBarMetrics:UIBarMetricsDefault];
	[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
	NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor clearColor];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-Light" size:18], NSFontAttributeName, nil]];
    // Override point for customization after application launch.
	[self checkToken];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

	[self.window makeKeyAndVisible];
    return YES;
}
- (void)checkToken{
	int x=0;
	if(x==1){
		[self showIntro];
	}
	else{
		[self.window.rootViewController dismissViewControllerAnimated:YES completion:Nil];
		[self loadpage];
	}
	
}
-(void)loadpage{

	
	UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"nearbyPlaceViewController") alloc]init]];
	[navigationController1.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
	UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"qrcodeViewController") alloc]init]];
	[navigationController2.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav-qr"] forBarMetrics:UIBarMetricsDefault];
	UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"myPlaceViewController") alloc]init]];
	[navigationController3.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
	
	RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[navigationController1, navigationController2,
                                           navigationController3]];
	self.window.rootViewController=tabBarController;
	tabBarController.selectedIndex = 1;
	[self customizeTabBarForController:tabBarController];
	
	
}
- (void)customizeTabBarForController:(RDVTabBarController *)tabBarControllers {
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarControllers tabBar] items]) {
		switch (index) {
			case 0:
				[item setBackgroundSelectedImage:[UIImage imageNamed:@"location-active"] withUnselectedImage:[UIImage imageNamed:@"location"]];
				break;
			case 1:
				[item setBackgroundSelectedImage:[UIImage imageNamed:@"scan_active"] withUnselectedImage:[UIImage imageNamed:@"scan"]];
				break;
				
			default:
				[item setBackgroundSelectedImage:[UIImage imageNamed:@"my-place-active"] withUnselectedImage:[UIImage imageNamed:@"my-place"]];
				break;
		}
		[item setTitle:@""];
        
        index++;
    }
}
   
-(void)showIntro{
	// Init the pages texts, and pictures.
	NSArray *tutorialLayers = nil;
	if ([[UIScreen mainScreen] bounds].size.height == 568) {
		ICETutorialPage *layer1 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"1-568h"];
		ICETutorialPage *layer2 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"Location-568h"];
		ICETutorialPage *layer3 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"Map-568h"];
		ICETutorialPage *layer4 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"PromoDetails-568h"];
		ICETutorialPage *layer5 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"PromoListt-568h"];
		ICETutorialPage *layer6 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"Radius-568h"];
		ICETutorialPage *layer7 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"Category-568h"];
		ICETutorialPage *layer8 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"SlideCode-568h"];
		tutorialLayers  = @[layer1,layer2,layer3,layer4,layer5,layer6,layer7,layer8];
		
		//this is iphone 5 xib
    } else {
		ICETutorialPage *layer1 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"1"];
		ICETutorialPage *layer2 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"Locationsss"];
		ICETutorialPage *layer3 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"Map"];
		ICETutorialPage *layer4 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"PromoDetails"];
		ICETutorialPage *layer5 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"PromoListt"];
		ICETutorialPage *layer6 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"Radius"];
		ICETutorialPage *layer7 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"Category"];
		ICETutorialPage *layer8 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"SlideCode"];
		tutorialLayers  = @[layer1,layer2,layer3,layer4,layer5,layer6,layer7,layer8];
		
    }
    
    // Set the common style for SubTitles and Description (can be overrided on each page).
    ICETutorialLabelStyle *subStyle = [[ICETutorialLabelStyle alloc] init];
    [subStyle setFont:TUTORIAL_SUB_TITLE_FONT];
    [subStyle setTextColor:TUTORIAL_LABEL_TEXT_COLOR];
    [subStyle setLinesNumber:TUTORIAL_SUB_TITLE_LINES_NUMBER];
    [subStyle setOffset:TUTORIAL_SUB_TITLE_OFFSET];
	
    
    ICETutorialLabelStyle *descStyle = [[ICETutorialLabelStyle alloc] init];
    [descStyle setFont:TUTORIAL_DESC_FONT];
    [descStyle setTextColor:TUTORIAL_LABEL_TEXT_COLOR];
    [descStyle setLinesNumber:TUTORIAL_DESC_LINES_NUMBER];
    [descStyle setOffset:TUTORIAL_DESC_OFFSET];
    
    // Load into an array.
    
    // Override point for customization after application launch.
	if ([[UIScreen mainScreen] bounds].size.height == 568) {
		self.viewController = [[ICETutorialController alloc] initWithNibName:@"ICETutorialController_iPhone4"
                                                                      bundle:nil
                                                                    andPages:tutorialLayers];
		
    } else {
		self.viewController = [[ICETutorialController alloc] initWithNibName:@"ICETutorialController_iPhone"
                                                                      bundle:nil
                                                                    andPages:tutorialLayers];
    }
    
    // Set the common styles, and start scrolling (auto scroll, and looping enabled by default)
    [self.viewController setCommonPageSubTitleStyle:subStyle];
    [self.viewController setCommonPageDescriptionStyle:descStyle];
	
	
	__unsafe_unretained typeof(self) weakSelf = self;
    // Set button 1 action.
    [self.viewController setButton1Block:^(UIButton *button){
        [weakSelf call:@"blincRegisterViewController"];
    }];
    
    // Set button 2 action, stop the scrolling.
	
    [self.viewController setButton2Block:^(UIButton *button){
        
        [weakSelf call:@"blincLoginViewController"];
    }];
    
    // Run it.
    [self.viewController startScrolling];
	
	self.window.rootViewController=self.viewController;
	
}
-(void)call:(NSString*)status{
	
	UINavigationController *navO= [[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(status) alloc]init]];
	navO.modalTransitionStyle = UIModalPresentationFormSheet;
	[navO.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
	
	[self.window.rootViewController presentViewController:navO animated:YES completion:nil];
	
	
}
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
