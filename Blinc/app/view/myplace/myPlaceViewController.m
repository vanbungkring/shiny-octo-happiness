//
//  myPlaceViewController.m
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "myPlaceViewController.h"

@interface myPlaceViewController ()

@end

@implementation myPlaceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor = [UIColor whiteColor];
		self.title = @"My Places";
    }
    return self;
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
