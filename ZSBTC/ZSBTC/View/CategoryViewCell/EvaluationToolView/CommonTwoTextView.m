//
//  CommonTwoTextView.m
//  ZSBTC
//
//  Created by DJ on 17/1/24.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "CommonTwoTextView.h"

@implementation CommonTwoTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame \
TopFrame:(CGRect)TopFrame \
TopTextColor:(UIColor*)TopTextColor \
TopTextFont:(CGFloat)TopTextFont  \
BottomFrame:(CGRect)BottomFrame \
BottomTextColor:(UIColor*)BottomTextColor \
BottomTextFont:(CGFloat)BottomTextFont{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.topLabel];
        self.topLabel.frame = TopFrame;
        self.topLabel.font = [UIFont systemFontOfSize:TopTextFont];
        self.topLabel.textColor = TopTextColor;
        
        [self addSubview:self.bottomLabel];
        self.bottomLabel.frame = BottomFrame;
        self.bottomLabel.font = [UIFont systemFontOfSize:BottomTextFont];
        self.bottomLabel.textColor = BottomTextColor;
        
    }
    return self;
}

- (UILabel*)topLabel{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc]init];
        _topLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _topLabel;
}

- (UILabel*)bottomLabel{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc]init];
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _bottomLabel;
}


@end
