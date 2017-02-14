//
//  CollectionNavBar.m
//  ZSBTC
//
//  Created by DJ on 17/1/25.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "CollectionNavBar.h"


#import "SegmentedView.h"

@implementation CollectionNavBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame NavBarType:(NavBarType)NavBarType titleArray:(NSArray *)titleArray WithBackBlock:(BackBtnBlock)clicked selectIndexBlock:(SegmentViewSelectindex_Block)segmentViewSelectindex_Block{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = NavgationBar_Color;
        self.segmentViewSelectindex_Block = segmentViewSelectindex_Block;
        
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
    __block typeof(self) Blockself = self;
    SegmentedView*segmentedView = [[SegmentedView alloc]initWithFrame:CGRectMake(self.width/2-60, 25, 120, 30) titleArray:titleArray  textFont:14 Radius:5.0 borderWidth:1.0 LayerColor:Common_NomalColor backNormalColor:[UIColor whiteColor] backSelectColor:Common_NomalColor defaultSelectIndex:0 withSelectIndexBlock:^(NSInteger index) {
        if (Blockself.segmentViewSelectindex_Block) {
            Blockself.segmentViewSelectindex_Block(index);
        }
    }];
    [self addSubview:segmentedView];
}




- (void)backBtnClick:(UITapGestureRecognizer*)sender{
    if (self.backBtnBlock) {
        self.backBtnBlock();
    }
}

@end
