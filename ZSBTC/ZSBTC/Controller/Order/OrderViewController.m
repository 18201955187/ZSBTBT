//
//  OrderViewController.m
//  ZSBTC
//
//  Created by DJ on 17/1/20.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "OrderViewController.h"

#import "HMSegmentedControl.h"

#import "OrderTotalListController.h"
#import "OrderWaitPayController.h"
#import "OrderWaitSendGoodController.h"
#import "OrderWaitGetGoodController.h"
#import "OrderWaitEvaluationController.h"

@interface OrderViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)HMSegmentedControl* segmentControl;
@property (nonatomic,strong)UIView*bottomLinView;
@property (nonatomic,strong)NSArray* TypedataArray;
@property (nonatomic,strong)UIScrollView *contentScroller;

@property (nonatomic,strong)OrderTotalListController *OrderTotalListVc;
@property (nonatomic,strong)OrderWaitPayController *OrderWaitPayVc;
@property (nonatomic,strong)OrderWaitSendGoodController *OrderWaitSendGoodVc;
@property (nonatomic,strong)OrderWaitGetGoodController *OrderWaitGetGoodVc;
@property (nonatomic,strong)OrderWaitEvaluationController *OrderWaitEvaluationVc;
@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavBar:NavBarType_BackHideen_No title:self.title];
    
    [self LoadUI];
    
    [self addChildVC];

}

- (void)LoadUI{
    [self.view addSubview:self.bottomLinView];
    [self.view addSubview:self.segmentControl];
    [self.view addSubview:self.contentScroller];

}

- (void)addChildVC{
    [self addChildViewController:self.OrderTotalListVc];
    [self addChildViewController:self.OrderWaitPayVc];
    [self addChildViewController:self.OrderWaitSendGoodVc];
    [self addChildViewController:self.OrderWaitGetGoodVc];
    [self addChildViewController:self.OrderWaitEvaluationVc];
}

- (UIScrollView*)contentScroller{
    if (!_contentScroller) {
        _contentScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NavBar_Hight+40, Screen_Width, Screen_Height-NavBar_Hight-40)];
        _contentScroller.contentSize = CGSizeMake(self.TypedataArray.count*Screen_Width, Screen_Height-NavBar_Hight-40);
        _contentScroller.backgroundColor = [UIColor whiteColor];
        _contentScroller.pagingEnabled = YES;
        _contentScroller.bounces = NO;
        _contentScroller.delegate = self;
        _contentScroller.showsHorizontalScrollIndicator = NO;
        _contentScroller.showsVerticalScrollIndicator = NO;
    }
    return _contentScroller;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)TypedataArray{
    if (!_TypedataArray) {
        _TypedataArray = [[NSMutableArray alloc]initWithObjects:@"全部",@"待付款",@"待发货",@"待收货",@"待评价", nil];
    }
    return _TypedataArray;
}

-(UIView*)bottomLinView{
    if (!_bottomLinView) {
        _bottomLinView = [[UIView alloc]init];
        _bottomLinView.frame = CGRectMake(0, 103, Screen_Width, 1);
        _bottomLinView.backgroundColor = ToolLinViewColor;
    }
    return _bottomLinView;
}

- (HMSegmentedControl*)segmentControl{
    if (!_segmentControl) {
        _segmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:self.TypedataArray];
        _segmentControl.font = [UIFont systemFontOfSize:14];
        [_segmentControl  setFrame:CGRectMake(0, 64, Screen_Width, 40)];
        _segmentControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        _segmentControl.selectedSegmentIndex = self.index;
        __block typeof(self) BlockSelf = self;
        [_segmentControl  setIndexChangeBlock:^(NSInteger index) {
            [BlockSelf scrollViewToPage:index];
        }];
        _segmentControl .selectionIndicatorHeight = 2.0f;
        _segmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
        _segmentControl.textColor = [UIColor blackColor];
        _segmentControl .selectedTextColor = [UIColor blackColor];
        _segmentControl.backgroundColor = [UIColor clearColor];
        _segmentControl .selectionIndicatorColor = Common_NomalColor;
        _segmentControl .selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _segmentControl .shouldAnimateUserSelection = YES;
        [self scrollViewToPage:_segmentControl.selectedSegmentIndex];
        
    }
    return _segmentControl;
}






- (void)scrollViewToPage:(NSInteger)index{
    
    ZFLog(@"%ld",index);
    self.segmentControl.selectedSegmentIndex = index;
    self.contentScroller.contentOffset = CGPointMake(index *Screen_Width, 0);
    
    switch (index) {
        case 0:
        {
            self.OrderTotalListVc.view.frame = CGRectMake(index*Screen_Width, 0, Screen_Width, Screen_Height-NavBar_Hight-40);
            self.OrderTotalListVc.view.backgroundColor = [UIColor whiteColor];
            [self.contentScroller addSubview:self.OrderTotalListVc.view];
        
        }
            break;
        case 1:
        {
            self.OrderWaitPayVc.view.frame = CGRectMake(index*Screen_Width,0 , Screen_Width, Screen_Height-NavBar_Hight-40);
            self.OrderWaitPayVc.view.backgroundColor = [UIColor whiteColor];
            [self.contentScroller addSubview:self.OrderWaitPayVc.view];
            
        }
            break;
        case 2:
        {
            self.OrderWaitSendGoodVc.view.frame = CGRectMake(index*Screen_Width,0 , Screen_Width, Screen_Height-NavBar_Hight-40);
            self.OrderWaitSendGoodVc.view.backgroundColor = [UIColor whiteColor];
            [self.contentScroller addSubview:self.OrderWaitSendGoodVc.view];
            
        }
            break;
        case 3:
        {
            self.OrderWaitGetGoodVc.view.frame = CGRectMake(index*Screen_Width,0 , Screen_Width, Screen_Height-NavBar_Hight-40);
            self.OrderWaitGetGoodVc.view.backgroundColor = [UIColor whiteColor];
            [self.contentScroller addSubview:self.OrderWaitGetGoodVc.view];
            
        }
            break;
        case 4:
        {
            self.OrderWaitEvaluationVc.view.frame = CGRectMake(index*Screen_Width,0 , Screen_Width, Screen_Height-NavBar_Hight-40);
            self.OrderWaitEvaluationVc.view.backgroundColor = [UIColor whiteColor];
            [self.contentScroller addSubview:self.OrderWaitEvaluationVc.view];
            
        }
            break;
            
        default:
            break;
    }
    

}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger current = scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame);
    
    [self scrollViewToPage:current];
}






- (OrderTotalListController*)OrderTotalListVc{
    if (!_OrderTotalListVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Order" bundle:nil];
        _OrderTotalListVc= [story instantiateViewControllerWithIdentifier:@"OrderTotalListController"];
    }
    return _OrderTotalListVc;
}

- (OrderWaitPayController*)OrderWaitPayVc{
    if (!_OrderWaitPayVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Order" bundle:nil];
        _OrderWaitPayVc= [story instantiateViewControllerWithIdentifier:@"OrderWaitPayController"];
    }
    return _OrderWaitPayVc;
}

- (OrderWaitSendGoodController*)OrderWaitSendGoodVc{
    if (!_OrderWaitSendGoodVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Order" bundle:nil];
        _OrderWaitSendGoodVc= [story instantiateViewControllerWithIdentifier:@"OrderWaitSendGoodController"];
    }
    return _OrderWaitSendGoodVc;
}
- (OrderWaitGetGoodController*)OrderWaitGetGoodVc{
    if (!_OrderWaitGetGoodVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Order" bundle:nil];
        _OrderWaitGetGoodVc= [story instantiateViewControllerWithIdentifier:@"OrderWaitGetGoodController"];
    }
    return _OrderWaitGetGoodVc;
}
- (OrderWaitEvaluationController*)OrderWaitEvaluationVc{
    if (!_OrderWaitEvaluationVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Order" bundle:nil];
        _OrderWaitEvaluationVc= [story instantiateViewControllerWithIdentifier:@"OrderWaitEvaluationController"];
    }
    return _OrderWaitEvaluationVc;
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
