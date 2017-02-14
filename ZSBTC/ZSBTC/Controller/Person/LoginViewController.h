//
//  LoginViewController.h
//  ZSBTC
//
//  Created by DJ on 17/1/13.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : SuperViewController
@property (weak, nonatomic) IBOutlet UIImageView *backImg;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *accountImg;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImg;
@property (weak, nonatomic) IBOutlet UITextField *acountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end
