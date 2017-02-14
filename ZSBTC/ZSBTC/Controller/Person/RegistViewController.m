//
//  RegistViewController.m
//  ZSBTC
//
//  Created by DJ on 17/1/13.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "RegistViewController.h"

#import "PasswordController.h"
@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = Light_WhiteColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextBtnClick:(UIButton *)sender {
    [self.view endEditing:YES];
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Person" bundle:nil];
    PasswordController *Vc = [story instantiateViewControllerWithIdentifier:@"PasswordController"];
    if ([self.title isEqualToString:@"注册1/3"]) {
        Vc.title = @"注册2/3";
    }else{
        Vc.title = @"找回密码2/2";
    }
    
    [self.navigationController pushViewController:Vc animated:YES];
}
- (IBAction)ViewTouchClick:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
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
