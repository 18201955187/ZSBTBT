//
//  ProductEvaluationController.m
//  ZSBTC
//
//  Created by DJ on 17/1/23.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ProductEvaluationController.h"

#import "EvaluationToolView.h"

#define BottomBarHight 46

@interface ProductEvaluationController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)EvaluationToolView *evaluationToolView;
@property (nonatomic,copy)NSString *cellstr;
@end

@implementation ProductEvaluationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.evaluationToolView];
}

- (EvaluationToolView*)evaluationToolView{
    if (!_evaluationToolView) {
        __block typeof(self) BlockSelf = self;
        _evaluationToolView = [[EvaluationToolView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 46) withTap_Block:^(NSInteger TapTag) {
            
            switch (TapTag) {
                case 0:
                    self.cellstr = @"全部评价";
                    break;
                case 1:
                    self.cellstr = @"好评";
                    break;
                case 2:
                    self.cellstr = @"中评";
                    break;
                case 3:
                    self.cellstr = @"差价";
                    break;
                case 4:
                    self.cellstr = @"晒图";
                    break;
                    
                default:
                    break;
            }
            
            [BlockSelf.tableView reloadData];
        }];
        
    }
    return _evaluationToolView;
}

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 46, self.view.width, Screen_Height-NavBar_Hight-BottomBarHight-46) style:UITableViewStylePlain];
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
    cell.textLabel.text = self.cellstr;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
