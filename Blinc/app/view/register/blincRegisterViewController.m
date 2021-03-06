//
//  blincRegisterViewController.m
//  Blinc
//
//  Created by Flash on 1/16/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "blincRegisterViewController.h"

@interface blincRegisterViewController ()

@end

@implementation blincRegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
		self.view.backgroundColor = [UIColor colorWithRed:0.941 green:0.941 blue:0.941 alpha:1];
		self.title = @"Register";
		
		scrollview  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
		scrollview.contentSize = CGSizeMake(320, 550);
		
		wrapper = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 504)];
		wrapper.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"register-login-form"]];
		
		///texfield here
		username = [[UITextField alloc]initWithFrame:CGRectMake(72, 220, 176, 36)];
		username.backgroundColor = [UIColor whiteColor];
		username.placeholder = @"Your Name";
		username.tag = 1;
		username.text = @"Arie";
		username.delegate = self;
		username.layer.borderWidth = 1;
		username.layer.borderColor = [UIColor colorWithRed:0.925 green:0.925 blue:0.925 alpha:1].CGColor;
		username.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
		username.layer.cornerRadius =5;
		username.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
		
		password = [[UITextField alloc]initWithFrame:CGRectMake(72, 270, 176, 36)];
		password.backgroundColor = [UIColor whiteColor];
		password.placeholder = @"Your Email";
		password.text = @"Email@yahoo.com";
		password.layer.borderWidth = 1;
		password.tag=2;
		password.delegate = self;
		password.layer.borderColor = [UIColor colorWithRed:0.925 green:0.925 blue:0.925 alpha:1].CGColor;
		password.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
		password.layer.cornerRadius =5;
		password.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);

		password_again = [[UITextField alloc]initWithFrame:CGRectMake(72, 320, 176, 36)];
		password_again.backgroundColor = [UIColor whiteColor];
		password_again.placeholder = @"Password";
		password_again.text = @"Email@yahoo.com";
		password_again.delegate = self;
		password_again.layer.borderWidth = 1;
		password_again.tag = 3;
		password_again.layer.borderColor = [UIColor colorWithRed:0.925 green:0.925 blue:0.925 alpha:1].CGColor;
		password_again.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
		password_again.layer.cornerRadius =5;
		password_again.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
		
		register_button = [[UIButton alloc]initWithFrame:CGRectMake(72, 380, 176, 44.5)];
		[register_button setBackgroundImage:[UIImage imageNamed:@"register-button"] forState:UIControlStateNormal];
		[register_button addTarget:self action:@selector(signUptoServer) forControlEvents:UIControlEventTouchUpInside];
		
		terms = [[UILabel alloc]initWithFrame:CGRectMake(20, 430, 280, 55)];
		terms.text = @"By signing in, I accept BLINC*’s Terms of Service and Privacy Policy";
		terms.numberOfLines = 2;
		terms.textAlignment = NSTextAlignmentCenter;
		terms.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
		terms.textColor = [UIColor colorWithRed:0.769 green:0.769 blue:0.769 alpha:1];
		
		
		
		[wrapper addSubview:username];
		[wrapper addSubview:password];
		[wrapper addSubview:password_again];
		[wrapper addSubview:register_button];
		[wrapper addSubview:terms];
		[scrollview addSubview:wrapper];
		[self.view addSubview:scrollview];
		
    }
    return self;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
	if(textField.tag==1){
		NSLog(@"1");
		[scrollview setContentOffset:CGPointMake(0,70) animated:YES];
		[scrollview setUserInteractionEnabled:NO];
	}
	else if (textField.tag==2){
		NSLog(@"2");
		[scrollview setContentOffset:CGPointMake(0,140) animated:YES];
		[scrollview setUserInteractionEnabled:NO];
	}
	else if (textField.tag==3){
		NSLog(@"3");
		[scrollview setContentOffset:CGPointMake(0,210) animated:YES];
		[scrollview setUserInteractionEnabled:NO];
	}
	else{
		[textField resignFirstResponder];
	}
	return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
	
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.tag==1){
		NSLog(@"tag==1");
		[username resignFirstResponder];
		[password becomeFirstResponder];
		[scrollview setContentOffset:CGPointMake(0,140) animated:YES];
		[scrollview setUserInteractionEnabled:NO];
	}
	if(textField.tag==2){
		NSLog(@"tag==2");
		[password resignFirstResponder];
		[password_again becomeFirstResponder];
		[scrollview setContentOffset:CGPointMake(0,210) animated:YES];
		[scrollview setUserInteractionEnabled:NO];
	}
	if(textField.tag==3){
		NSLog(@"tag==3");
		[textField resignFirstResponder];
		[scrollview setContentOffset:CGPointMake(0,0) animated:YES];
		[scrollview setUserInteractionEnabled:YES];
	}
	
	return YES;
}
-(void)signUptoServer{
	[blincBrain signUptoServer:@{@"name":username.text,@"email":password.text,@"password":password_again.text}];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
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
