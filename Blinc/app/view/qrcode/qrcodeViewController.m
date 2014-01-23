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
		image = [[UIImageView alloc]initWithFrame:CGRectMake(60, 20, 200, 200)];
		 image.image = [UIImage mdQRCodeForString:@"lorem ipsum dolor sit amet" size:image.bounds.size.width fillColor:[UIColor blackColor]];
		[self.view addSubview:image];
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
