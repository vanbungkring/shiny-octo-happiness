//
//  blincLoginViewController.m
//  Blinc
//
//  Created by Flash on 1/3/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "blincLoginViewController.h"

@interface blincLoginViewController ()

@end

@implementation blincLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor = [UIColor whiteColor];
		self.title = @"Login";
		
		self.view.backgroundColor = [UIColor colorWithRed:0.941 green:0.941 blue:0.941 alpha:1];
		
		scrollview  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
		scrollview.contentSize = CGSizeMake(320, 500);
		
		wrapper = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 504)];
		wrapper.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"register-login-form"]];
		
		///texfield here
		userName = [[UITextField alloc]initWithFrame:CGRectMake(72, 220, 176, 36)];
		userName.backgroundColor = [UIColor whiteColor];
		userName.placeholder = @"Username";
		userName.layer.borderWidth = 0.8;
		userName.layer.borderColor = [UIColor colorWithRed:0.925 green:0.925 blue:0.925 alpha:1].CGColor;
		userName.font = [UIFont fontWithName:@"HeleticaNeue Bold" size:14];
		userName.layer.cornerRadius =5;
		
		password = [[UITextField alloc]initWithFrame:CGRectMake(72, 270, 176, 36)];
		password.backgroundColor = [UIColor whiteColor];
		password.placeholder = @"password";
		password.layer.borderWidth = 0.8;
		password.layer.borderColor = [UIColor colorWithRed:0.925 green:0.925 blue:0.925 alpha:1].CGColor;
		password.font = [UIFont fontWithName:@"HeleticaNeue Bold" size:14];
		password.layer.cornerRadius =5;

		login_button = [[UIButton alloc]initWithFrame:CGRectMake(72, 330, 176, 44.5)];
		login_button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login-button"]];
		
		[wrapper addSubview:login_button];
		[wrapper addSubview:userName];
		[wrapper addSubview:password];
		[scrollview addSubview:wrapper];
		[self.view addSubview:scrollview];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
	[close setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
	UIEdgeInsets buttonEdges = UIEdgeInsetsMake(0, 0, 0, 0);
	[close setImageEdgeInsets:buttonEdges];
	[close addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
	[close setFrame:CGRectMake(0, 0, 40, 40)];
	[[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:close]];
	// Do any additional setup after loading the view.
}
-(void)close:(id)sender{
	[self.navigationController dismissViewControllerAnimated:YES completion:Nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
