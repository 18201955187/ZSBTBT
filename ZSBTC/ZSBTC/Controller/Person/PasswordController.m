//
//  PasswordController.m
//  ZSBTC
//
//  Created by DJ on 17/1/16.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "PasswordController.h"
#import "SetMessageController.h"
#import "LoginViewController.h"

@interface PasswordController ()

@end

@implementation PasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=Light_WhiteColor;
    if ([self.title isEqualToString:@"注册2/3"]) {
        [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    }
    else{
        [self.nextBtn setTitle:@"完成" forState:UIControlStateNormal];
    }
}
- (IBAction)nextBtnClick:(UIButton *)sender {
    if ([self.title isEqualToString:@"注册2/3"]) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Person" bundle:nil];
        SetMessageController *Vc = [story instantiateViewControllerWithIdentifier:@"SetMessageController"];
        Vc.title = @"注册3/3";
        [self.navigationController pushViewController:Vc animated:YES];
    }
    else{
        for (UIViewController *Vc in self.navigationController.viewControllers) {
            if ([Vc isKindOfClass:[LoginViewController class]]) {
                [self.navigationController popToViewController:Vc animated:YES];
            }
        }
    }
    
    
}
- (IBAction)ViewTouchClick:(UITapGestureRecognizer *)sender {
    [self.textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
