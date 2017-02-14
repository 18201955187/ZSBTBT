//
//  UserAssetsToolBar.m
//  ZSBTC
//
//  Created by DJ on 17/1/24.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "UserAssetsToolBar.h"

@implementation UserAssetsToolBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame withTap_Block:(UserAssetsToolBarTap_Block)Tap_Block{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.bottomLinView];
        [self addSubview:self.contentBackView];
        self.ToolBarTap_Block = Tap_Block;
        int i = 0;
        do {
            CommonTwoTextView *view = [[CommonTwoTextView alloc]initWithFrame:CGRectMake(self.contentBackView.width/self.TopArray.count*i, 0, self.contentBackView.width/4, self.contentBackView.height) TopFrame:CGRectMake(0, 10, self.contentBackView.width/4, 17) TopTextColor:Common_NomalColor TopTextFont:14.0 BottomFrame:CGRectMake(0,30, self.contentBackView.width/4, 17) BottomTextColor:[UIColor blackColor] BottomTextFont:13.0];
            
            view.tag = i;
            if (view.tag == 0) {
                if (self.ToolBarTap_Block) {
                    self.ToolBarTap_Block(view.tag);
                }
            }
            view.topLabel.text = [NSString stringWithFormat:@"%@",self.TopArray[i]];
            view.bottomLabel.text = [NSString stringWithFormat:@"%@",self.BottomArray[i]];
            
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapClick:)];
            [view addGestureRecognizer:singleTap];
            
            
            [self.contentBackView addSubview:view];
            i++;
        } while (i<self.TopArray.count);
    }
    return self;
}


- (void)singleTapClick:(UITapGestureRecognizer*)tap{
    if (self.ToolBarTap_Block) {
        self.ToolBarTap_Block(self.TwoTextView.tag);
    }
}

- (NSArray*)TopArray{
    if (!_TopArray) {
        _TopArray = [[NSArray alloc]initWithObjects:@"0",@"元0.00",@"元0.00",@"5", nil];
    }
    return _TopArray;
}

- (NSArray*)BottomArray{
    if (!_BottomArray) {
        _BottomArray = [[NSArray alloc]initWithObjects:@"抵用券",@"红包",@"帐户余额",@"积分",nil];
    }
    return _BottomArray;
}

- (UIView*)contentBackView{
    if (!_contentBackView) {
        _contentBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height-0.5)];
    }
    return _contentBackView;
}

- (UIView *)bottomLinView{
    if (!_bottomLinView) {
        _bottomLinView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height-0.5, self.width, 0.5)];
        _bottomLinView.backgroundColor =  ToolLinViewColor;
    }
    return _bottomLinView;
}




@end
