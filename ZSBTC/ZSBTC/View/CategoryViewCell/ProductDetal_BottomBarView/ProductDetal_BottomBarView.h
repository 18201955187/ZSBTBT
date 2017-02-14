//
//  ProductDetal_BottomBarView.h
//  ZSBTC
//
//  Created by DJ on 17/1/17.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFCartsButton.h"
#import "ZFCollectButton.h"

typedef void(^ProductDetal_BottomBarViewAddCarts_Block)(void);
typedef void(^ProductDetal_BottomBarViewCarts_Block)(void);


@interface ProductDetal_BottomBarView : UIView
@property (nonatomic,copy) ProductDetal_BottomBarViewAddCarts_Block BottomBar_AddCart_Block;
@property (nonatomic,copy) ProductDetal_BottomBarViewCarts_Block BottomBarViewCarts_Block;
@property (nonatomic,strong) UIButton*addCartBtn;
@property (nonatomic,strong) UIButton *payBtn;

@property (nonatomic,strong)ZFCartsButton *cartsButton;
@property (nonatomic,strong) ZFCollectButton *collectButton;

@property (nonatomic,strong)UIView *TopView;

@end
