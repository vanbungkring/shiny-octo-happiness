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
	return array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 155*0.5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *cells = @"cell";
	blincGate *merchants = [array objectAtIndex:indexPath.row];
	blincCell *cell = [[blincCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
	if (!cell) {
		cell = [[blincCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
	}
	cell.my_point_wrapper.hidden = NO;
	cell.merchantCategory.hidden = YES;
	cell.merchantName.text = merchants.merchant_name;
	[cell.logo setImageWithURL:[NSURL URLWithString:merchants.merchant_logo_url] placeholderImage:Nil];
	cell.merchantAlamat.text = merchants.merchant_address;
	cell.myPoint.text = merchants.place_checkin_points;

	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	myplaceDetailViewController *p = [[myplaceDetailViewController alloc]init];
	p.data_pass = [array objectAtIndex:indexPath.row];
	NSLog(@"data->%@",[array objectAtIndex:indexPath.row]);
	[self.navigationController pushViewController:p animated:YES];
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
	[blincGate getPlace:^(NSArray *returnData, NSError *error) {
		array = returnData;
		[tablePlace reloadData];
	}];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
