//
//  AssetsRedPackController.m
//  ZSBTC
//
//  Created by DJ on 17/1/25.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "AssetsRedPackController.h"

#import "RedPackNetUseController.h"
#import "RedPackAlreadyUsedController.h"
#import "RedPackOutDateController.h"

#import "HMSegmentedControl.h"


@interface AssetsRedPackController ()<UIScrollViewDelegate>

@property (nonatomic,strong)RedPackNetUseController*RedPackNetUseVc;
@property (nonatomic,strong)RedPackAlreadyUsedController*RedPackAlreadyUsedVc;
@property (nonatomic,strong)RedPackOutDateController*RedPackOutDateVc;
@property (nonatomic,strong)NSMutableArray *TypedataArray;

@property (nonatomic,strong)UIScrollView *contentScroller;
@property (nonatomic,strong)HMSegmentedControl* segmentControl;
@property (nonatomic,strong)UIView *bottomLinView;

@end

@implementation AssetsRedPackController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavBar:NavBarType_BackHideen_No title:self.title];
    [self LoadUI];
    
}

- (void)LoadUI{
    [self addchildVC];
    [self.view addSubview:self.contentScroller];
    [self.view addSubview:self.segmentControl];
    [self.view addSubview:self.bottomLinView];
}

- (NSMutableArray *)TypedataArray{
    if (!_TypedataArray) {
        _TypedataArray = [[NSMutableArray alloc]initWithObjects:@"未使用/0",@"已使用/0",@"已过期/0", nil];
    }
    return _TypedataArray;
    
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


-(UIView*)bottomLinView{
    if (!_bottomLinView) {
        _bottomLinView = [[UIView alloc]init];
        _bottomLinView.frame = CGRectMake(0, 103.5, Screen_Width, 0.5);
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
        _segmentControl .selectedTextColor = Common_NomalColor;
        _segmentControl.backgroundColor = [UIColor clearColor];
        _segmentControl .selectionIndicatorColor = Common_NomalColor;
        _segmentControl .selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _segmentControl .shouldAnimateUserSelection = YES;
        [self scrollViewToPage:_segmentControl.selectedSegmentIndex];
        
    }
    return _segmentControl;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger current = scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame);
    self.segmentControl.selectedSegmentIndex = current;
    [self scrollViewToPage:current];
}





- (void)addchildVC{
    [self addChildViewController:self.RedPackNetUseVc];
    [self addChildViewController:self.RedPackAlreadyUsedVc];
    [self addChildViewController:self.RedPackOutDateVc];
}

- (RedPackNetUseController*)RedPackNetUseVc{
    if (!_RedPackNetUseVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Assets" bundle:nil];
        _RedPackNetUseVc= [story instantiateViewControllerWithIdentifier:@"RedPackNetUseController"];
    }
    return _RedPackNetUseVc;
}

- (RedPackAlreadyUsedController*)RedPackAlreadyUsedVc{
    if (!_RedPackAlreadyUsedVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Assets" bundle:nil];
        _RedPackAlreadyUsedVc= [story instantiateViewControllerWithIdentifier:@"RedPackAlreadyUsedController"];
    }
    return _RedPackAlreadyUsedVc;
}

- (RedPackOutDateController*)RedPackOutDateVc{
    if (!_RedPackOutDateVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Assets" bundle:nil];
        _RedPackOutDateVc= [story instantiateViewControllerWithIdentifier:@"RedPackOutDateController"];
    }
    return _RedPackOutDateVc;
}


- (void)scrollViewToPage:(NSInteger)index{
    
    self.contentScroller.contentOffset = CGPointMake(index *Screen_Width, 0);
    
    switch (index) {
        case 0:
        {
            self.RedPackNetUseVc.view.frame = CGRectMake(index*Screen_Width, 0, Screen_Width, Screen_Height-NavBar_Hight-40);
            self.RedPackNetUseVc.view.backgroundColor = [UIColor whiteColor];
            [self.contentScroller addSubview:self.RedPackNetUseVc.view];
        }
            break;
        case 1:
        {
            self.RedPackAlreadyUsedVc.view.frame = CGRectMake(index*Screen_Width,0 , Screen_Width, Screen_Height-NavBar_Hight-40);
            self.RedPackAlreadyUsedVc.view.backgroundColor = [UIColor blueColor];
            [self.contentScroller addSubview:self.RedPackAlreadyUsedVc.view];
            
        }
            break;
        case 2:
        {
            self.RedPackOutDateVc.view.frame = CGRectMake(index*Screen_Width,0 , Screen_Width, Screen_Height-NavBar_Hight-40);
            self.RedPackOutDateVc.view.backgroundColor = [UIColor grayColor];
            [self.contentScroller addSubview:self.RedPackOutDateVc.view];
        }
            break;
       
        default:
            break;
    }
    
    
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
