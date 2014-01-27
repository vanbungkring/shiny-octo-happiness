//
//  myplaceDetailViewController.h
//  Blinc
//
//  Created by Flash on 1/18/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myplaceDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	UITableView *table_place;
	UIImageView *_headerImage;
	UIImageView *avatar;
	UILabel *about;
	UILabel *place_name;
	UILabel *website;
	UILabel *phone;
	
	UILabel *store_name;
	UILabel *store_address;
	UIView *wrapper;
	UILabel *user_point;
	MKMapView * mapView;
	
}
@property (nonatomic,strong)blincGate *data_pass;
@end
