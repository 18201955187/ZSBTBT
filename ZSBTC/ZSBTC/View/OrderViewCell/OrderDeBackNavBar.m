//
//  OrderDeBackNavBar.m
//  ZSBTC
//
//  Created by DJ on 17/1/23.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "OrderDeBackNavBar.h"

@implementation OrderDeBackNavBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame NavBarType:(NavBarType)NavBarType titleArray:(NSArray *)titleArray WithBackBlock:(void(^)(void))clicked{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = NavgationBar_Color;
        
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
        [self addSegmentControl:titleArray];
    }
    return self;
}

- (void)addSegmentControl:(NSArray*)titleArray{
    self.segmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"退款",@"退货"]];
    self.segmentControl.font = [UIFont systemFontOfSize:17];
    [self.segmentControl  setFrame:CGRectMake(self.width/2-60, 20, 120, 44)];
    self.segmentControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    
    __block typeof(self) BlockSelf = self;
    [self.segmentControl  setIndexChangeBlock:^(NSInteger index) {
        [BlockSelf setSegmentControlClicked:index];
    }];
    self.segmentControl .selectionIndicatorHeight = 2.0f;
    self.segmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentControl.textColor = [UIColor blackColor];
    self.segmentControl .selectedTextColor = [UIColor blackColor];
    self.segmentControl.backgroundColor = [UIColor clearColor];
    self.segmentControl .selectionIndicatorColor = Common_NomalColor;
    self.segmentControl .selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentControl .shouldAnimateUserSelection = YES;
    [self addSubview:self.segmentControl];
}


- (void)setSegmentControlIndex:(NSInteger)index{
    self.segmentControl.selectedSegmentIndex = index;
    if (self.segmentControl_Block) {
        self.segmentControl_Block(index);
    }
}

- (void)setSegmentControlClicked:(NSInteger)index{
    if (self.segmentControl_Block) {
        self.segmentControl_Block(index);
    }
}


- (void)backBtnClick:(UITapGestureRecognizer*)sender{
    if (self.backBtnBlock) {
        self.backBtnBlock();
    }
}


@end
