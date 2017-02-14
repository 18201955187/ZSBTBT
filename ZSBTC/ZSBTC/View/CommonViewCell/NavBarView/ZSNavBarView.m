//
//  ZSNavBarView.m
//  ZSBTC
//
//  Created by DJ on 17/1/12.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ZSNavBarView.h"

@implementation ZSNavBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame NavBarType:(NavBarType)NavBarType title:(NSString *)title WithBackBlock:(void(^)(void))clicked{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(Screen_Width/2-60, 30, 120, 22)];
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:17];
       // titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel = titleLabel;
        [self addSubview:self.titleLabel];
        
        UIView *bottomView = [[UIView alloc]init];
        bottomView.frame = CGRectMake(0, self.height-0.5, self.width, 0.5);
        bottomView.backgroundColor = Color_RGB(146, 146, 146);
        self.bottomView = bottomView;
        [self addSubview:self.bottomView];
        
        
        
        
        
        
        
        if (NavBarType == NavBarType_BackHideen_No) {
            
            
            self.backBtnBlock = clicked;
            UIImageView *backImg =[[UIImageView alloc]init];
            backImg.frame = CGRectMake(10, 25, 27, 27);
            backImg.userInteractionEnabled = YES;
            backImg.contentMode = UIViewContentModeScaleAspectFit;
            backImg.image = [UIImage imageNamed:@"universal_button_back"];
            UITapGestureRecognizer *Tapsingle = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backBtnClick:)];
            [backImg addGestureRecognizer:Tapsingle];
            self.backImg = backImg;
            [self addSubview:self.backImg];
        }
    }
    return self;
}

- (void)backBtnClick:(UITapGestureRecognizer*)sender{
    if (self.backBtnBlock) {
        self.backBtnBlock();
    }
}




@end
