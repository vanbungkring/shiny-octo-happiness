//
//  blincLoginViewController.h
//  Blinc
//
//  Created by Flash on 1/3/14.
//  Copyright (c) 2014 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface blincLoginViewController : UIViewController<UITextFieldDelegate>
{
	UIView *wrapper;
	UIScrollView *scrollview;
	UITextField *userName;
	UITextField *password;
	UIButton *login_button;
	UILabel *terms;
}
@end
