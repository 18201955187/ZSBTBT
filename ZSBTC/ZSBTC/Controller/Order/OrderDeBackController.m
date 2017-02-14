//
//  OrderDeBackController.m
//  ZSBTC
//
//  Created by DJ on 17/1/23.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "OrderDeBackController.h"

#import "HMSegmentedControl.h"

#import "OrderBackMoneyController.h"
#import "OrderBackGoodController.h"
#import "OrderDeBackNavBar.h"
@interface OrderDeBackController ()<UIScrollViewDelegate>
@property (nonatomic,strong)OrderBackGoodController*OrderBackGoodVc;
@property (nonatomic,strong)OrderBackMoneyController*OrderBackMoneyVc;



@property (nonatomic,strong)UIScrollView *contentScroller;
@property (nonatomic,strong)NSArray* TypedataArray;

@property (nonatomic,strong)OrderDeBackNavBar*orderDeBackNavBar;

@end

@implementation OrderDeBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self LoadUI];

}

- (void)LoadUI{
    [self.view addSubview:self.orderDeBackNavBar];
    
    [self.view addSubview:self.contentScroller];
    
    [self addChildVC];
}

- (void)addChildVC{
    [self addChildViewController:self.OrderBackMoneyVc];
    [self addChildViewController:self.OrderBackGoodVc];
}

-(OrderBackMoneyController*)OrderBackMoneyVc{
    if (!_OrderBackMoneyVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Order" bundle:nil];
        _OrderBackMoneyVc= [story instantiateViewControllerWithIdentifier:@"OrderBackMoneyController"];
    }
    return _OrderBackMoneyVc;
}

-(OrderBackGoodController*)OrderBackGoodVc{
    if (!_OrderBackGoodVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Order" bundle:nil];
        _OrderBackGoodVc= [story instantiateViewControllerWithIdentifier:@"OrderBackGoodController"];
    }
    return _OrderBackGoodVc;
}

- (void)scrollViewToPage:(NSInteger)index{
    self.contentScroller.contentOffset = CGPointMake(index *Screen_Width, 0);
    switch (index) {
        case 0:
        {
            self.OrderBackGoodVc.view.frame = CGRectMake(index*Screen_Width, 0, Screen_Width, Screen_Height-NavBar_Hight);
            self.OrderBackGoodVc.view.backgroundColor = [UIColor whiteColor];
            [self.contentScroller addSubview:self.OrderBackGoodVc.view];
            
        }
            break;
        case 1:
        {
            self.OrderBackMoneyVc.view.frame = CGRectMake(index*Screen_Width,0 , Screen_Width, Screen_Height-NavBar_Hight);
            self.OrderBackMoneyVc.view.backgroundColor = [UIColor whiteColor];
            [self.contentScroller addSubview:self.OrderBackMoneyVc.view];
            
        }
            break;
            
        default:
            break;
    }
}



- (OrderDeBackNavBar*)orderDeBackNavBar{
    if (!_orderDeBackNavBar) {
        __block typeof (self)Blockself = self;
        _orderDeBackNavBar = [[OrderDeBackNavBar alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, NavBar_Hight) NavBarType:NavBarType_BackHideen_No titleArray:self.TypedataArray WithBackBlock:^{
            [Blockself.navigationController popViewControllerAnimated:YES];
        }];
        _orderDeBackNavBar.segmentControl_Block = ^(NSInteger index){
            [Blockself scrollViewToPage:index];
        };
        [_orderDeBackNavBar setSegmentControlIndex:0];
        
    }
    return _orderDeBackNavBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)TypedataArray{
    if (!_TypedataArray) {
        _TypedataArray = [[NSMutableArray alloc]initWithObjects:@"我要退款",@"我要退货", nil];
    }
    return _TypedataArray;
}

- (UIScrollView*)contentScroller{
    if (!_contentScroller) {
        _contentScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NavBar_Hight, Screen_Width, Screen_Height-NavBar_Hight)];
        _contentScroller.contentSize = CGSizeMake(self.TypedataArray.count*Screen_Width, Screen_Height-NavBar_Hight);
        _contentScroller.backgroundColor = [UIColor whiteColor];
        _contentScroller.pagingEnabled = YES;
        _contentScroller.bounces = NO;
        _contentScroller.delegate = self;
        _contentScroller.showsHorizontalScrollIndicator = NO;
        _contentScroller.showsVerticalScrollIndicator = NO;
    }
    return _contentScroller;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger current = scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame);
    
    [_orderDeBackNavBar setSegmentControlIndex:current];
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
