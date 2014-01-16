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
		self.view.backgroundColor = [UIColor whiteColor];
		self.title = @"Register";
    }
    return self;
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
