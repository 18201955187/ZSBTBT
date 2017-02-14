//
//  SuperViewController.m
//  ZSBTB
//
//  Created by DJ on 16/12/15.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "SuperViewController.h"




@interface SuperViewController ()
@property (nonatomic,strong)ZSNavBarView*navBarView;



@end

@implementation SuperViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (void)initNavBar:(NavBarType)navBarType title:(NSString*)title{
    ZSNavBarView*navBarView = [[ZSNavBarView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, NavBar_Hight) NavBarType:navBarType title:title WithBackBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.navBarView = navBarView;
    [self.view addSubview:self.navBarView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
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
