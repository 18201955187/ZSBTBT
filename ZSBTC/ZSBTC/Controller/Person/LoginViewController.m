//
//  LoginViewController.m
//  ZSBTC
//
//  Created by DJ on 17/1/13.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "PasswordController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self EditNavBar];
}

- (void)EditNavBar{
    self.title = @"登录";
    
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbtn setTitle:@"关闭" forState:UIControlStateNormal];
    [leftbtn setTitleColor:Common_NomalColor forState:UIControlStateNormal];
    leftbtn.titleLabel.font = [UIFont systemFontOfSize:14];
    leftbtn.frame = CGRectMake(0, 0, 44, 22);
    [leftbtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithCustomView:leftbtn];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"注册" forState:UIControlStateNormal];
    [rightBtn setTitleColor:Common_NomalColor forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    rightBtn.frame = CGRectMake(0, 0, 44, 22);
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)rightBtnClick:(UIButton*)sender{
    [self.view endEditing:YES];
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Person" bundle:nil];
    RegistViewController *Vc = [story instantiateViewControllerWithIdentifier:@"RegistViewController"];
    Vc.title = @"注册1/3";
    [self.navigationController pushViewController:Vc animated:YES];
}

- (void)leftBtnClick:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)loginBtnClick:(UIButton *)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (IBAction)forgetPasswordBtnClick:(UIButton *)sender {
    [self.view endEditing:YES];
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Person" bundle:nil];
    RegistViewController *Vc = [story instantiateViewControllerWithIdentifier:@"RegistViewController"];
    Vc.title = @"找回密码1/2";
    [self.navigationController pushViewController:Vc animated:YES];
}
- (IBAction)SavePasswordBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.saveBtn setImage:[UIImage imageNamed:@"pssword"] forState:UIControlStateNormal];
    }
    else{
        [self.saveBtn setImage:[UIImage imageNamed:@"password_selected"] forState:UIControlStateNormal];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touchClick:(UITapGestureRecognizer *)sender {
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
