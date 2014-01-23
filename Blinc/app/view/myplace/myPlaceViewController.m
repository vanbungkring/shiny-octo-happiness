//
//  myPlaceViewController.m
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "myPlaceViewController.h"
#import "myplaceDetailViewController.h"
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
		
		tablePlace = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-115)];
		tablePlace.delegate = self;
		tablePlace.dataSource = self;
		tablePlace.separatorInset = UIEdgeInsetsZero;
		tablePlace.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
		[self.view addSubview:tablePlace];
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 155*0.5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *cells = @"cell";
	blincCell *cell = [[blincCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
	if (!cell) {
		cell = [[blincCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
	}
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	myplaceDetailViewController *detail = [[myplaceDetailViewController alloc]init];
	[self.navigationController pushViewController:detail animated:YES];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
	
}
- (NSString *)tabBackgroundImageName {
    return @"my-place";
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
