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
	UILabel *about;
	UILabel *website;
	UILabel *phone;
	
	UILabel *store_name;
	UILabel *store_address;
	
	MKMapView * mapView;
}

@end
