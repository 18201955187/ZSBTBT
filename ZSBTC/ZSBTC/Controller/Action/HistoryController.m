//
//  HistoryController.m
//  ZSBTC
//
//  Created by DJ on 17/1/25.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "HistoryController.h"
#import "SegmentedView.h"

@interface HistoryController ()

@property (nonatomic,strong)SegmentedView*segmentedView;
@property (nonatomic,strong)NSMutableArray *titleArray;
@property (nonatomic,strong)NSString *titleStr;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation HistoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavBar:NavBarType_BackHideen_No title:self.title];
    
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.segmentedView];
}

- (NSMutableArray*)titleArray{
    if (!_titleArray) {
        _titleArray = [[NSMutableArray alloc]initWithObjects:@"买过滴",@"看过滴",nil];
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
                    self.titleStr = @"买过滴";
                    [BlockSelf.tableView reloadData];
                    
                }
                    break;
                case 1:
                {
                    self.titleStr = @"看过滴";
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

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 110, Screen_Width, Screen_Height-110) style:UITableViewStylePlain];
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
