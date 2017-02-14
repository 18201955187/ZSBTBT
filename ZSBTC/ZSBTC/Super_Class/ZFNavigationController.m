//
//  ZFNavigationController.m
//  ZSBTB
//
//  Created by DJ on 16/12/13.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "ZFNavigationController.h"

@interface ZFNavigationController ()<UINavigationBarDelegate,UINavigationControllerDelegate>

@end

@implementation ZFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureNavigationAttr];
}


- (void)configureNavigationAttr{
    [[UINavigationBar appearance] setTintColor:Common_NomalColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName :Common_NomalColor}];
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
