//
//  AssetsController.m
//  ZSBTC
//
//  Created by DJ on 17/1/24.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "AssetsController.h"
#import "UserAssetsToolBar.h"

@interface AssetsController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UserAssetsToolBar *AssetsToolBar;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation AssetsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = Light_WhiteColor;
    
    [self initNavBar:NavBarType_BackHideen_No title:self.title];
    
    [self.view addSubview:self.AssetsToolBar];
    
    [self.view addSubview:self.tableView];
}

- (UserAssetsToolBar*)AssetsToolBar{
    if (!_AssetsToolBar) {
        _AssetsToolBar = [[UserAssetsToolBar alloc]initWithFrame:CGRectMake(0, NavBar_Hight, Screen_Width, 57) withTap_Block:^(NSInteger TapTag) {
            ZFLog(@"%ld",TapTag);
        }];
        _AssetsToolBar.backgroundColor = [UIColor whiteColor];
    }
    return _AssetsToolBar;
}

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavBar_Hight+57+15, Screen_Width, Screen_Height-NavBar_Hight-57-15) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark--UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *celler = @"celler";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:celler];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celler];
    }
    cell.textLabel.text = @"我的资产";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
