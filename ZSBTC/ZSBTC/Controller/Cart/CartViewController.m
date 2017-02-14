//
//  CartViewController.m
//  ZSBTC
//
//  Created by DJ on 17/1/10.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "CartViewController.h"
#import "LoginViewController.h"
#import "ZFNavigationController.h"

#import "AppDelegate.h"

@interface CartViewController ()
@property (nonatomic,copy)AppDelegate *appDelegate;
@property (nonatomic,assign)NSInteger cartNumber;

@end




@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavBar:self.navBarType title:@"购物车"];
    
    self.cartNumber = 0;
    [self.appDelegate.tabBarViewController setCartabBarItembadgeValue:[NSString stringWithFormat:@"%ld",self.cartNumber]];
}

- (AppDelegate*)appDelegate{
    if (!_appDelegate) {
        _appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    }
    return _appDelegate;
}


- (IBAction)subtractBtnClick:(UIButton *)sender {
    if (self.cartNumber==0) {
        return;
    }
    else{
        self.cartNumber = self.cartNumber-1;
        [self.appDelegate.tabBarViewController setCartabBarItembadgeValue:[NSString stringWithFormat:@"%ld",self.cartNumber]];
    }
}

- (IBAction)addbtnClick:(UIButton *)sender {
    self.cartNumber = self.cartNumber+1;
    [self.appDelegate.tabBarViewController setCartabBarItembadgeValue:[NSString stringWithFormat:@"%ld",self.cartNumber]];
}

- (IBAction)loginBtnClick:(UIButton *)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Person" bundle:nil];
    LoginViewController *Vc = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
    ZFNavigationController *nav = [[ZFNavigationController alloc]initWithRootViewController:Vc];
    [self presentViewController:nav animated:YES completion:nil];
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
