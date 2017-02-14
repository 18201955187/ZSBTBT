//
//  ProductDetal_BottomBarView.m
//  ZSBTC
//
//  Created by DJ on 17/1/17.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ProductDetal_BottomBarView.h"

#define AddCartBtn_Width 100
#define PayBtn_Widch 60

@implementation ProductDetal_BottomBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        if (self.addCartBtn == nil) {
            
            UIButton *addCartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            addCartBtn.frame = CGRectMake(self.width-AddCartBtn_Width, 0, AddCartBtn_Width, self.height);
            [addCartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
            addCartBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            addCartBtn.backgroundColor = Common_NomalColor;
            [addCartBtn addTarget:self action:@selector(addCartBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            self.addCartBtn = addCartBtn;
            [self addSubview:self.addCartBtn];
        }
    }
    
    if (!self.payBtn) {
        UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        payBtn.frame = CGRectMake(self.width-AddCartBtn_Width-PayBtn_Widch, 0, PayBtn_Widch, self.height);
        [payBtn setTitle:@"去结算" forState:UIControlStateNormal];
        payBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        payBtn.backgroundColor = Color_RGB(249, 152, 57);
        [payBtn addTarget:self action:@selector(addCartBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.addCartBtn = payBtn;
        [self addSubview:self.addCartBtn];
    }
    
    
    
    if (self.collectButton == nil) {
        ZFCollectButton *collectBttton = [[ZFCollectButton alloc]initWithFrame:CGRectMake((self.width-AddCartBtn_Width-PayBtn_Widch)/3-20, 1, 40, self.height-1) imgName:@"jdm_likeMovie" LabelTitle:@"收藏"];
        self.collectButton = collectBttton;
        [self addSubview:self.collectButton];
    }
    
    
    if (self.cartsButton == nil) {
        ZFCartsButton *cartsButton = [[ZFCartsButton alloc]initWithFrame:CGRectMake((self.width-AddCartBtn_Width-PayBtn_Widch)/3*2-20, 1, 40, self.height-1) imgName:@"cart_imageHig" LabelTitle:@"购物车"];
        cartsButton.userInteractionEnabled = YES;
        UITapGestureRecognizer *CartsSingleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(CartsSingleTapClick:)];
        [cartsButton addGestureRecognizer:CartsSingleTap];
        
        
        
        self.cartsButton = cartsButton;
        [self addSubview:self.cartsButton];
    }
    
    if (!self.TopView) {
        UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 0.5)];
        topView.backgroundColor = ToolLinViewColor;
        self.TopView = topView;
        [self addSubview:self.TopView];
    }
    
    return self;
}

- (void)CartsSingleTapClick:(UITapGestureRecognizer*)tap{
    if (self.BottomBarViewCarts_Block) {
        self.BottomBarViewCarts_Block();
    }
}

- (void)addCartBtnClick:(UIButton*)button{
    if (self.BottomBar_AddCart_Block) {
        self.BottomBar_AddCart_Block();
    }
}

@end
