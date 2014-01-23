//
//  blincCell.m
//  Blinc
//
//  Created by Flash on 1/17/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import "blincCell.h"

@implementation blincCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//		self.contentView.backgroundColor = []
		self.logo = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 39.5, 39.5)];
		self.logo.layer.masksToBounds = YES;
		self.logo.layer.cornerRadius = 5;
		self.logo.image = [UIImage imageNamed:@"location"];
		
		self.merchantName = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, 200, 20)];
		self.merchantName.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:17];
		self.merchantName.text = @"Starbucks";
		self.merchantName.textColor =[UIColor colorWithRed:0.467 green:0.467 blue:0.467 alpha:1];
									  
		self.merchantAlamat = [[UILabel alloc]initWithFrame:CGRectMake(60, 30, 200, 18)];
		self.merchantAlamat.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
		self.merchantAlamat.textColor =[UIColor colorWithRed:0.765 green:0.765 blue:0.765 alpha:1];
		self.merchantAlamat.text = @"Kemang Timur 2";
		
		self.merchantCategory = [[UILabel alloc]initWithFrame:CGRectMake(60, 45, 200, 18)];
		self.merchantCategory.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
		self.merchantCategory.text = @"Kemang Timur 2  -";
		self.merchantCategory.textColor =[UIColor colorWithRed:0.765 green:0.765 blue:0.765 alpha:1];
		
		self.my_point_wrapper = [[UIView alloc]initWithFrame:CGRectMake(255, 20, 34, 34)];
		self.my_point_wrapper.backgroundColor= [UIColor clearColor];
		self.my_point_wrapper.layer.cornerRadius = 34*0.5;

		self.myPoint = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 34, 34)];
		self.myPoint.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
		self.myPoint.textColor = [UIColor whiteColor];
		self.myPoint.textAlignment = NSTextAlignmentCenter;
		self.myPoint.text = @"99";
		[self.my_point_wrapper addSubview:self.myPoint];
		
		[self.contentView addSubview:self.logo];
		[self.contentView addSubview:self.merchantAlamat];
		[self.contentView addSubview:self.merchantCategory];
		[self.contentView addSubview:self.merchantName];
		[self.contentView addSubview:self.my_point_wrapper];
		self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell"]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
	UIImageView *selecetedCellBG = [[UIImageView alloc] initWithFrame:self.contentView.frame];
	[selecetedCellBG setImage:[UIImage imageNamed:@"cell-selection"]];//Set Name for selected Cell
	[selecetedCellBG setBackgroundColor:[UIColor clearColor]];
	[self setSelectedBackgroundView:selecetedCellBG ];
    // Configure the view for the selected state
}

@end
