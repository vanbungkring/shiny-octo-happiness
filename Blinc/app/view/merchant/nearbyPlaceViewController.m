//
//  nearbyPlaceViewController.m
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "nearbyPlaceViewController.h"

@interface nearbyPlaceViewController ()

@end

@implementation nearbyPlaceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor = [UIColor whiteColor];
		self.title = @"My Places";
		
		merchant = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-115)];
		merchant.delegate = self;
		merchant.dataSource = self;
		merchant.separatorInset = UIEdgeInsetsZero;
		merchant.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
		[self.view addSubview:merchant];
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
	cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell-nearby"]];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.my_point_wrapper.hidden = YES;
	cell.merchantCategory.hidden = YES;
	cell.merchantName.text = merchants.merchant_name;
	[cell.logo setImageWithURL:[NSURL URLWithString:merchants.merchant_logo_url] placeholderImage:Nil];
	cell.merchantAlamat.text = merchants.merchant_address;
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
		
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[blincGate getMerchant:^(NSArray *returnData, NSError *error) {
		if(!error){
			array = returnData;
			[merchant reloadData];
		}
	}];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
