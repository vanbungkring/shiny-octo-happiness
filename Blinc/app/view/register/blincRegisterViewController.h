//
//  blincRegisterViewController.h
//  Blinc
//
//  Created by Flash on 1/16/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface blincRegisterViewController : UIViewController<UIScrollViewDelegate>
{
	UIView *wrapper;
	UIScrollView *scrollview;
	UITextField *username;
	UITextField *password;
	UITextField *password_again;
	UIButton *register_button;
	UILabel *terms;
	
}
@end
