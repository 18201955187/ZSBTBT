//
//  ProductController.m
//  ZSBTC
//
//  Created by DJ on 17/1/10.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ProductController.h"
#import "AppDelegate.h"

#import "ZFTypeSelectView.h"
#import "ProductDetal_BottomBarView.h"
#import "ProductDetalNavBar.h"
#import "GuiGeView.h"

#import "CartViewController.h"
#import "ProductSizeModel.h"

#import "ProductMessageController.h"
#import "ProductDetalController.h"
#import "ProductEvaluationController.h"

#define BottomBarHight 46

@interface ProductController ()<GuiGeView_Delegate,UIScrollViewDelegate>

@property (nonatomic,strong)ProductMessageController*ProductMessageVc;
@property (nonatomic,strong)ProductDetalController*ProductDetalVc;
@property (nonatomic,strong)ProductEvaluationController*ProductEvaluationVc;

@property (nonatomic,strong)UIScrollView *contentScroller;






@property (nonatomic,strong)ZFTypeSelectView*typeSelectView;
@property (nonatomic,strong)NSMutableArray*housTypeArray;


@property (nonatomic,strong)ProductDetal_BottomBarView*BottomBarView;
@property (nonatomic,strong)ProductDetalNavBar *NavBarView;

@property (nonatomic,strong)GuiGeView *guiGeView;

@property (nonatomic,strong)NSMutableArray *sizeArray;
@property (nonatomic,strong)NSMutableArray *colorArray;

@property (nonatomic,strong)NSMutableArray *TypedataArray;




@end



@implementation ProductController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadUI];
    
    [self addChildVc];
}


- (void)loadUI{
    [self loadProduct_BottomBarView];
    [self.view addSubview:self.NavBarView];
    [self.view addSubview:self.contentScroller];
}

- (void)addChildVc{
    [self addChildViewController:self.ProductEvaluationVc];
    [self addChildViewController:self.ProductDetalVc];
    [self addChildViewController:self.ProductEvaluationVc];
    
}

- (UIScrollView*)contentScroller{
    if (!_contentScroller) {
        _contentScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NavBar_Hight, Screen_Width, Screen_Height-NavBar_Hight-BottomBarHight)];
        _contentScroller.contentSize = CGSizeMake(self.TypedataArray.count*Screen_Width, self.contentScroller.height);
        _contentScroller.backgroundColor = [UIColor whiteColor];
        _contentScroller.pagingEnabled = YES;
        _contentScroller.bounces = NO;
        _contentScroller.delegate = self;
        _contentScroller.showsHorizontalScrollIndicator = NO;
        _contentScroller.showsVerticalScrollIndicator = NO;
    }
    return _contentScroller;
}
- (void)scrollViewToPage:(NSInteger)index{
    
    
    self.contentScroller.contentOffset = CGPointMake(index *Screen_Width, 0);
    switch (index) {
        case 0:
        {
            self.ProductMessageVc.view.frame = CGRectMake(index*Screen_Width, 0, Screen_Width, self.contentScroller.height);
            self.ProductMessageVc.view.backgroundColor = [UIColor whiteColor];
            [self.contentScroller addSubview:self.ProductMessageVc.view];
            
        }
            break;
        case 1:
        {
            self.ProductDetalVc.view.frame = CGRectMake(index*Screen_Width,0 , Screen_Width, self.contentScroller.height);
            self.ProductDetalVc.view.backgroundColor = [UIColor whiteColor];
            [self.contentScroller addSubview:self.ProductDetalVc.view];
            
        }
            break;
        case 2:
        {
            self.ProductEvaluationVc.view.frame = CGRectMake(index*Screen_Width,0,Screen_Width,self.contentScroller.height);
            self.ProductEvaluationVc.view.backgroundColor = [UIColor whiteColor];
            [self.contentScroller addSubview:self.ProductEvaluationVc.view];
            
        }
            break;
        default:
            break;
    }
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger current = scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame);
    
    [_NavBarView setSegmentControlIndex:current];
}




- (ProductMessageController*)ProductMessageVc{
    if (!_ProductMessageVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Category" bundle:nil];
        _ProductMessageVc= [story instantiateViewControllerWithIdentifier:@"ProductMessageController"];
        __block typeof(self) BlockSelf = self;
        _ProductMessageVc.ContentOff_Block = ^{
            [BlockSelf.NavBarView setSegmentControlIndex:1];
            [BlockSelf scrollViewToPage:1];
            
        };
    }
    return _ProductMessageVc;
}


- (ProductDetalController*)ProductDetalVc{
    if (!_ProductDetalVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Category" bundle:nil];
        _ProductDetalVc= [story instantiateViewControllerWithIdentifier:@"ProductDetalController"];
    }
    return _ProductDetalVc;
}

- (ProductEvaluationController*)ProductEvaluationVc{
    if (!_ProductEvaluationVc) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Category" bundle:nil];
        _ProductEvaluationVc= [story instantiateViewControllerWithIdentifier:@"ProductEvaluationController"];
    }
    return _ProductEvaluationVc;
}


- (NSMutableArray *)TypedataArray{
    if (!_TypedataArray) {
        _TypedataArray = [[NSMutableArray alloc]initWithObjects:@"商品",@"详情",@"评价", nil];
    }
    return _TypedataArray;
}

- (NSMutableArray*)sizeArray{
    if (!_sizeArray) {
        _sizeArray = [[NSMutableArray alloc]initWithObjects:@"你好吗？",@"你说呢",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊",@"说你妹啊", nil];
    }
    return _sizeArray;
}

- (NSMutableArray*)colorArray{
    if (!_colorArray) {
        _colorArray = [[NSMutableArray alloc]initWithObjects:@"红色的",@"绿色的",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色", nil];
    }
    return _colorArray;
}

- (NSMutableArray*)housTypeArray{
    if (!_housTypeArray) {
        _housTypeArray = [[NSMutableArray alloc]initWithObjects:@"红色的",@"绿色的",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色",@"绿色", nil];
    }
    return _housTypeArray;
}






- (ProductDetalNavBar*)NavBarView{
    if (!_NavBarView) {
        __block typeof (self)Blockself = self;
        _NavBarView = [[ProductDetalNavBar alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, NavBar_Hight) NavBarType:NavBarType_BackHideen_No titleArray:self.TypedataArray WithBackBlock:^{
            [Blockself.navigationController popViewControllerAnimated:YES];
        }];
        
        _NavBarView.segmentControl_Block = ^(NSInteger index){
            [Blockself scrollViewToPage:index];
        };
        [_NavBarView setSegmentControlIndex:0];
        
    }
    return _NavBarView;
}





- (ZFTypeSelectView*)typeSelectView{
    if (!_typeSelectView) {
        _typeSelectView = [[ZFTypeSelectView alloc]init];
        _typeSelectView.frame = CGRectMake(0, 0, Screen_Height, Screen_Height);
        [_typeSelectView addContentView:CGRectMake(Screen_Width-120, NavBar_Hight, 100, self.housTypeArray.count*45+10)];
        _typeSelectView.backgroundColor = [UIColor clearColor];
        __block typeof(self) BlockSelf = self;
        _typeSelectView.typeSelectView_Blank_Tap = ^(void){
            ZFLog(@"视图消失");
        };
        _typeSelectView.typeSelectView_DidSelect_Block = ^(NSString *contentStr){
            ZFLog(@"%@",contentStr);
            AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            [appDelegate.tabBarViewController setTabBarIndex:0];
            [BlockSelf.navigationController popToRootViewControllerAnimated:YES];
        };
        [self.typeSelectView  setZFTypeSeachViewDataArray:self.housTypeArray];
        self.typeSelectView.hidden = YES;
    }
    return _typeSelectView;
}

#pragma mark -- 规格视图
- (void)loadGuigeView{
    self.guiGeView = [[GuiGeView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    
    __block typeof(self) BlockSelf = self;
    self.guiGeView.TapBg_Block = ^(void){
        [BlockSelf close];
    };
    [self.guiGeView reloadSizeArray:self.sizeArray ColorArray:self.colorArray];
    self.guiGeView.delegate = self;
    BlockSelf.guiGeView.userInteractionEnabled = YES;
    [[UIApplication sharedApplication].windows[0] addSubview:BlockSelf.guiGeView];

}

#pragma mark -- 底部视图
- (void)loadProduct_BottomBarView{
    ProductDetal_BottomBarView *BottomBarView = [[ProductDetal_BottomBarView alloc]initWithFrame:CGRectMake(0, Screen_Height-BottomBarHight, Screen_Width, BottomBarHight)];
    
    __block typeof(self) BlockSelf = self;
    BottomBarView.BottomBar_AddCart_Block = ^(void){
        [BlockSelf loadGuigeView];
        [BlockSelf starts];
    };
    
    BottomBarView.BottomBarViewCarts_Block = ^{
        UIStoryboard* story = [UIStoryboard storyboardWithName:@"Cart" bundle:nil];
        CartViewController* Vc = [story instantiateViewControllerWithIdentifier:@"CartViewController"];
        Vc.title = @"购物车";
        Vc.navBarType = NavBarType_BackHideen_No;
        Vc.hidesBottomBarWhenPushed = YES;
        [BlockSelf.navigationController pushViewController:Vc animated:YES];
    };
    self.BottomBarView = BottomBarView;
    [self.view addSubview:self.BottomBarView];
}

#pragma mark -- GuiGeView_Delegate
//规格视图点击确定时所掉用的代理方法
- (void)confirmClicked{
    [self close];
}

- (void)starts{
    [UIView animateWithDuration:0.3 animations:^{
         self.view.layer.transform = [self transform1];
     } completion:^(BOOL finished){
         [UIView animateWithDuration:0.3f animations:^{
             self.view.layer.transform = [self transform2];
         }];
     }];
}


- (void)close {
    // 动画回去
    [UIView animateWithDuration:0.3 animations:^{
        self.view.layer.transform = [self transform1];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            // 折叠完之后让transform回归到正常水平
            self.view.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moreBtnClick:(UIButton *)sender {
    self.typeSelectView.hidden = NO;
}

- (IBAction)backBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
