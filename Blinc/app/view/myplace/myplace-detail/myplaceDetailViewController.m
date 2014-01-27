//
//  myplaceDetailViewController.m
//  Blinc
//
//  Created by Flash on 1/18/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "myplaceDetailViewController.h"

@interface myplaceDetailViewController ()

@end
static CGFloat kImageOriginHight = 240.f;
@implementation myplaceDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.view.backgroundColor = [UIColor whiteColor];
		_headerImage = [[UIImageView alloc]init];
		_headerImage.layer.masksToBounds = YES;
		_headerImage.contentMode = UIViewContentModeScaleAspectFit;
		
		table_place = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-115)];
		table_place.delegate = self;
		table_place.dataSource = self;
		table_place.contentInset = UIEdgeInsetsMake(kImageOriginHight, 0, 0, 0);
		table_place.separatorInset = UIEdgeInsetsZero;
		table_place.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
		
		avatar = [[UIImageView alloc]initWithFrame:CGRectMake((320-90)/2, -kImageOriginHight+80, 90, 90)];
		avatar.layer.cornerRadius = 10;
		avatar.layer.borderColor  = [UIColor lightGrayColor].CGColor;
		avatar.layer.masksToBounds = YES;
		
		place_name = [[UILabel alloc]initWithFrame:CGRectMake(20, -kImageOriginHight+180, 280, 28)];
		place_name.text = @"starbuck";
		place_name.textColor  = [UIColor whiteColor];
		place_name.textAlignment = NSTextAlignmentCenter;
		place_name.textColor = [UIColor whiteColor];
		place_name.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
		
		
		
		_headerImage.frame = CGRectMake(0, -kImageOriginHight, table_place.frame.size.width, kImageOriginHight);
		wrapper = [[UIView alloc]initWithFrame:_headerImage.frame];
		wrapper.backgroundColor = [UIColor blackColor];
		wrapper.alpha = .5;
		
		[table_place addSubview:_headerImage];
		[table_place addSubview:wrapper];
		[table_place addSubview:avatar];
		[table_place addSubview:place_name];

		about = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 280, 10)];
		about.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
		about.textColor = [UIColor colorWithRed:0.427 green:0.431 blue:0.443 alpha:1];
		about.numberOfLines = 3;
		
		website = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 280, 10)];
		website.textColor = [UIColor colorWithRed:0.427 green:0.431 blue:0.443 alpha:1];
		website.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:13];
		
		phone = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 280, 10)];
		phone.textColor = [UIColor colorWithRed:0.427 green:0.431 blue:0.443 alpha:1];
		phone.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:13];
		
		store_name = [[UILabel alloc]initWithFrame:CGRectMake(20, 190, 280, 20)];
		store_name.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:13];
		store_name.textColor = [UIColor colorWithRed:0.427 green:0.431 blue:0.443 alpha:1];
		
		store_address = [[UILabel alloc]initWithFrame:CGRectMake(20, 220, 280, 30)];
		store_address.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
		store_address.textColor = [UIColor colorWithRed:0.427 green:0.431 blue:0.443 alpha:1];
		store_address.numberOfLines = 0;
		
		mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 150)];
		
		user_point =[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 320, 44)];
		user_point.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:26];
		user_point.textColor = [UIColor colorWithRed:0.89 green:0.714 blue:0 alpha:1];
		user_point.textAlignment = NSTextAlignmentCenter;
		[self.view addSubview:table_place];
		
        // Custom initialization
    }
    return self;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset  = scrollView.contentOffset.y;
    if (yOffset < -kImageOriginHight) {
        CGRect f = _headerImage.frame;
        f.origin.y = yOffset;
        f.size.height =  -yOffset;
        _headerImage.frame = f;
		wrapper.frame = f;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	switch (indexPath.row) {
		case 0:
			return 140;
			break;
		case 2:
			return 284;
			break;
		case 3:
			return 122.5;
			break;
		default:
			return 36;
			break;
	}
	return 155*0.5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *cells = @"cell";
	UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
	if (!cell) {
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
	}
	
	about.text = @"is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type ";
	[about sizeToFit];
	
	website.text = @"www.starbuck.co.id";
	phone.text = @"(+62) 21.777.88.99";
	
	store_address.text = @"Jl. Kemang Raya Jakarta - \n12760 Jakarta Selatan";
	[store_address sizeToFit];
	
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	switch (indexPath.row) {
		case 0:
			[cell.contentView addSubview:about];
			[cell.contentView addSubview:website];
			[cell.contentView addSubview:phone];
			break;
		case 2:
			[cell.contentView addSubview:mapView];
			[cell.contentView addSubview:store_name];
			[cell.contentView addSubview:store_address];
			break;
		case 3:
			[cell.contentView addSubview:user_point];
			cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"point-here"]];
			break;
		case 1:
			
			cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"see-rewards"]];
			break;
		default:
			break;
	}
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
	NSLog(@"datapass->%@",self.data_pass);
	user_point.text = self.data_pass.place_user_total_points;
	store_name.text = self.data_pass.merchant_name;
	
	self.title = self.data_pass.merchant_name;
	[_headerImage setImageWithURL:[NSURL URLWithString:self.data_pass.merchant_logo_url] placeholderImage:Nil];
	[avatar setImageWithURL:[NSURL URLWithString:self.data_pass.merchant_logo_url] placeholderImage:Nil];
	place_name.text = self.data_pass.merchant_name;
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
