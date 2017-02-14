//
//  AssetsMoneyBalanceController.m
//  ZSBTC
//
//  Created by DJ on 17/1/25.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "AssetsMoneyBalanceController.h"

#import "SegmentedView.h"

@interface AssetsMoneyBalanceController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)SegmentedView*segmentedView;
@property (nonatomic,strong)NSMutableArray *titleArray;
@property (nonatomic,copy) NSString *titleStr;

@end

@implementation AssetsMoneyBalanceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavBar:NavBarType_BackHideen_No title:self.title];
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.segmentedView];
}

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 110, Screen_Width, Screen_Height-110) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
    
    
}

- (NSMutableArray*)titleArray{
    if (!_titleArray) {
        _titleArray = [[NSMutableArray alloc]initWithObjects:@"全部",@"存入",@"支出",nil];
    }
    return _titleArray;
}


- (SegmentedView*)segmentedView{
    if (!_segmentedView) {
        __block typeof(self) BlockSelf = self;
        _segmentedView = [[SegmentedView alloc]initWithFrame:CGRectMake(20, 75, Screen_Width-40, 30) titleArray:self.titleArray  textFont:14 Radius:5.0 borderWidth:1.0 LayerColor:Common_NomalColor backNormalColor:[UIColor whiteColor] backSelectColor:Common_NomalColor defaultSelectIndex:0 withSelectIndexBlock:^(NSInteger index) {
            switch (index) {
                case 0:
                {
                    self.titleStr = @"全部";
                    [BlockSelf.tableView reloadData];
                    
                }
                    break;
                case 1:
                {
                    self.titleStr = @"存入";
                    [BlockSelf.tableView reloadData];
                    
                }
                    break;
                case 2:
                {
                    self.titleStr = @"支出";
                    [BlockSelf.tableView reloadData];
                    
                }
                    break;
                    
                default:
                    break;
            }
            
        }];
    }
    return _segmentedView;
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
