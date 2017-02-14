//
//  UserViewController.m
//  ZSBTC
//
//  Created by DJ on 17/1/10.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "UserViewController.h"


#import "ZFNavigationController.h"
#import "UserMessageHeaderView.h"
#import "UserMessageController.h"
#import "UserSetController.h"
#import "LoginViewController.h"

#import "UesrCommonTypeCell.h"
#import "UserOrderStatusCell.h"
#import "UserAccountCell.h"
#import "UereGeneralActionCell.h"

#import "OrderViewController.h"
#import "OrderDeBackController.h"

#import "AssetsController.h"
#import "AssetsRedPackController.h"
#import "AssetsIntegralController.h"
#import "AssetsMoneyBalanceController.h"
#import "AssetsPleaceTicketController.h"

#import "CollectionController.h"
#import "HistoryController.h"


@interface UserViewController ()
@property (nonatomic,strong)UserMessageHeaderView*userMessageHeaderView;

@end

@implementation UserViewController

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadTableView];
}





- (void)loadTableView{
    
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([UserOrderStatusCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([UserOrderStatusCell class])];
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([UesrCommonTypeCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([UesrCommonTypeCell class])];
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([UserAccountCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([UserAccountCell class])];
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([UereGeneralActionCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([UereGeneralActionCell class])];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    __block typeof(self) BlockSelf = self;
    self.userMessageHeaderView = [[UserMessageHeaderView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 160) withHeaderImgView_Block:^{
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"User" bundle:nil];
        UserMessageController *Vc = [story instantiateViewControllerWithIdentifier:@"UserMessageController"];
        Vc.title = @"我的帐户";
        [BlockSelf.navigationController pushViewController:Vc animated:YES];
    }];
    
    self.userMessageHeaderView.loginBlock = ^{
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Person" bundle:nil];
        LoginViewController *Vc = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
        ZFNavigationController *nav = [[ZFNavigationController alloc]initWithRootViewController:Vc];
        [BlockSelf presentViewController:nav animated:YES completion:nil];
        
    };
    self.tableView.tableHeaderView = self.userMessageHeaderView;
}


- (IBAction)setBtnClick:(UIButton *)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"User" bundle:nil];
    UserSetController *Vc = [story instantiateViewControllerWithIdentifier:@"UserSetController"];
    Vc.title = @"设置";
    [self.navigationController pushViewController:Vc animated:YES];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 3;
    }
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0 && indexPath.row == 0) {
        return 50;
    }
    else if (indexPath.section == 1){
        if (indexPath.row==0) {
            return 50;
        }
        return 60;
    }
    return 65;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 12)];
    view.backgroundColor = Color_RGB(240, 240, 240);
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 0;
    }
    return 12.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UesrCommonTypeCell *cell = [UesrCommonTypeCell msGetInstance];
            __block typeof(self) BlockSelf = self;
            [cell LoadUesrCommonTypeCell:@"我的订单" editTitle:@"查看全部订单" withClickBlock:^{
                UIStoryboard *story = [UIStoryboard storyboardWithName:@"Order" bundle:nil];
                OrderViewController *Vc = [story instantiateViewControllerWithIdentifier:@"OrderViewController"];
                Vc.title = @"我的订单";
                Vc.index = NSOrderStatus_Type_Total;
                [BlockSelf.navigationController pushViewController:Vc animated:YES];
            }];
            return cell;
        }
        else{
            UserOrderStatusCell*cell = [UserOrderStatusCell msGetInstance];
            __block typeof(self) BlockSelf = self;
            [cell LoadUserOrderStatusCellWithStatus_Block:^(NSOrderStatus_Type OrderStatus_Type) {
                
                if (OrderStatus_Type == NSOrderStatus_Type_BackGood) {
                    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Order" bundle:nil];
                    OrderDeBackController *Vc = [story instantiateViewControllerWithIdentifier:@"OrderDeBackController"];
                    Vc.title = @"退款／退货";
                    [BlockSelf.navigationController pushViewController:Vc animated:YES];
                }
                else{
                    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Order" bundle:nil];
                    OrderViewController *Vc = [story instantiateViewControllerWithIdentifier:@"OrderViewController"];
                    Vc.title = @"我的订单";
                    Vc.index = OrderStatus_Type;
                    [BlockSelf.navigationController pushViewController:Vc animated:YES];
                }
            }];
            return cell;
        
        }
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0 ) {
            UesrCommonTypeCell *cell = [UesrCommonTypeCell msGetInstance];
            __block typeof(self) Blockself = self;
            [cell LoadUesrCommonTypeCell:@"我的资产" editTitle:@"联名卡／礼品卡" withClickBlock:^{
                
                UIStoryboard *story = [UIStoryboard storyboardWithName:@"Assets" bundle:nil];
                AssetsController *Vc = [story instantiateViewControllerWithIdentifier:@"AssetsController"];
                Vc.title = @"我的资产";
                [Blockself.navigationController pushViewController:Vc animated:YES];
            }];
            return cell;
        }
        else{
            UserAccountCell *cell = [UserAccountCell msGetInstance];
            [cell LoadUserAccountCellWithTypeBlock:^(NSInteger index) {
                switch (index) {
                    case 0:{
                        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Assets" bundle:nil];
                        AssetsPleaceTicketController *Vc = [story instantiateViewControllerWithIdentifier:@"AssetsPleaceTicketController"];
                        Vc.title = @"我的抵用卷";
                        [self.navigationController pushViewController:Vc animated:YES];
                    
                    }
                        
                        break;
                    case 1:
                    {
                        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Assets" bundle:nil];
                        AssetsRedPackController *Vc = [story instantiateViewControllerWithIdentifier:@"AssetsRedPackController"];
                        Vc.title = @"我的红包";
                        [self.navigationController pushViewController:Vc animated:YES];
                    }
                       
                        break;
                    case 2:
                    {
                        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Assets" bundle:nil];
                        AssetsMoneyBalanceController *Vc = [story instantiateViewControllerWithIdentifier:@"AssetsMoneyBalanceController"];
                        Vc.title = @"帐户余额";
                        [self.navigationController pushViewController:Vc animated:YES];
                    
                    }
                        break;
                    case 3:
                    {
                        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Assets" bundle:nil];
                        AssetsIntegralController *Vc = [story instantiateViewControllerWithIdentifier:@"AssetsIntegralController"];
                        Vc.title = @"我的积分";
                        [self.navigationController pushViewController:Vc animated:YES];
                    
                    }
                        break;
                        
                    default:
                        break;
                }
            }];
            return cell;
        }
    }
    else{
        if (indexPath.row == 0 ) {
            UereGeneralActionCell *cell = [UereGeneralActionCell msGetInstance];
            [cell LoadUereGeneralActionCellWithOne_Block:^(NSInteger index) {
                switch (index) {
                    case 0:
                    {
                        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Action" bundle:nil];
                        CollectionController *Vc = [story instantiateViewControllerWithIdentifier:@"CollectionController"];
                        [self.navigationController pushViewController:Vc animated:YES];
                    }
                        break;
                    case 1:
                    {
                        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Action" bundle:nil];
                        HistoryController *Vc = [story instantiateViewControllerWithIdentifier:@"HistoryController"];
                        Vc.title = @"购物足迹";
                        [self.navigationController pushViewController:Vc animated:YES];
                    
                    }
                        break;
                    case 2:
                    {}
                        break;
                    case 3:
                    {}
                        break;
                        
                    default:
                        break;
                }
            }];
            
            
            
            
            
            return cell;
        }
        else if (indexPath.row == 1){
            UereGeneralActionCell *cell = [UereGeneralActionCell msGetInstance];
            [cell LoadUereGeneralActionCell_Two];
            return cell;
        
        }
        else{
            UereGeneralActionCell *cell = [UereGeneralActionCell msGetInstance];
            [cell LoadUereGeneralActionCell_Three];
            return cell;
        }
    }
}

-(void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
