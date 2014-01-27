//
//  qrcodeViewController.m
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "qrcodeViewController.h"

@interface qrcodeViewController ()

@end

@implementation qrcodeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor = [UIColor whiteColor];
		
		email = [[UILabel alloc]init];
		email.text = @"arie@wego.com";
		email.font = [UIFont fontWithName:@"HelveticaNeue" size:18.5];
		email.textAlignment = NSTextAlignmentCenter;
		email.textColor = [UIColor colorWithRed:0.608 green:0.6 blue:0.6 alpha:1];
		
		usercode = [[UILabel alloc]init];
		usercode.text = @"code number : 88899889";
		usercode.font = [UIFont fontWithName:@"HelveticaNeue" size:13.5];
		usercode.textAlignment = NSTextAlignmentCenter;
		usercode.textColor = [UIColor colorWithRed:0.608 green:0.6 blue:0.6 alpha:1];
		
		image = [[UIImageView alloc]init];
		if(!IS_IPHONE_5){
			image.frame = CGRectMake(85, 40, 150, 150);
			email.frame = CGRectMake(0, 210, 320, 30);
			usercode.frame = CGRectMake(0, 230, 320, 30);
			
		}
		else{
			image.frame = CGRectMake(66, 40, 188, 188);
			email.frame = CGRectMake(0, 248, 320, 30);
			usercode.frame = CGRectMake(0, 268, 320, 30);
		}
		email.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"username"];
		image.image = [UIImage mdQRCodeForString:[[NSUserDefaults standardUserDefaults]objectForKey:@"username"] size:image.bounds.size.width fillColor:[UIColor blackColor]];
		[self.view addSubview:image];
		[self.view addSubview:email];
		[self.view addSubview:usercode];
		
		UIImageView *info = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-200, 320, 87.5)];
		[info setImage:[UIImage imageNamed:@"info-scan"]];
		
		[self.view addSubview:info];
    }
    return self;
}
- (NSString *)tabBackgroundImageName {
    return @"scan";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
