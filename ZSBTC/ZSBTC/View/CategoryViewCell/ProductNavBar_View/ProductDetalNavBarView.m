//
//  ProductDetalNavBarView.m
//  ZSBTC
//
//  Created by DJ on 17/1/17.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ProductDetalNavBarView.h"

@implementation ProductDetalNavBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (instancetype)msGetInstance {
    return [[NSBundle mainBundle] loadNibNamed:@"ProductDetalNavBarView" owner:self options:nil][0];
}

+ (instancetype)SetDetalNavBarViewWithBackBlock:(void(^)(void))BackBlock moreBlock:(void(^)(void))moreBlock{
    ProductDetalNavBarView *DetalNavBarView = [ProductDetalNavBarView msGetInstance];
    DetalNavBarView.frame = CGRectMake(0, 0, Screen_Width, NavBar_Hight);
    DetalNavBarView.backBlock = BackBlock;
    DetalNavBarView.MoreBlock = moreBlock;
    return DetalNavBarView;
}
- (IBAction)backBtnClick:(UIButton *)sender {
    if (self.backBlock) {
        self.backBlock();
    }
}

- (IBAction)moreBtnClick:(UIButton *)sender {
    if (self.MoreBlock) {
        self.MoreBlock();
    }
}

@end
