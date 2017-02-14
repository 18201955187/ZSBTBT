//
//  CollectionController.m
//  ZSBTC
//
//  Created by DJ on 17/1/25.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "CollectionController.h"

#import "CollectionNavBar.h"

@interface CollectionController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)CollectionNavBar *NavBarView;
@property (nonatomic,strong)NSMutableArray *TypedataArray;
@property (nonatomic,strong)NSString *titleStr;
@end

@implementation CollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.NavBarView];
    
}


- (NSMutableArray *)TypedataArray{
    if (!_TypedataArray) {
        _TypedataArray = [[NSMutableArray alloc]initWithObjects:@"商品",@"店铺", nil];
    }
    return _TypedataArray;
}

- (CollectionNavBar*)NavBarView{
    if (!_NavBarView) {
        __block typeof (self)Blockself = self;
        _NavBarView = [[CollectionNavBar alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, NavBar_Hight) NavBarType:NavBarType_BackHideen_No titleArray:self.TypedataArray WithBackBlock:^{
            [Blockself.navigationController popViewControllerAnimated:YES];
        } selectIndexBlock:^(NSInteger index) {
            switch (index) {
                case 0:
                {
                    self.titleStr = @"商品";
                    [Blockself.tableView reloadData];
                
                }
                    break;
                case 1:
                {
                    self.titleStr = @"店铺";
                    [Blockself.tableView reloadData];
                
                }
                    break;
                    
                default:
                    break;
            }
        }];
    }
    return _NavBarView;
}


- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavBar_Hight, Screen_Width, Screen_Height-NavBar_Hight) style:UITableViewStylePlain];
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
    cell.textLabel.text = self.titleStr;
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
