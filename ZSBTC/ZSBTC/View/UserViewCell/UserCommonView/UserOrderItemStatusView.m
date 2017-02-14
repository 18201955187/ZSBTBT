//
//  UserOrderItemStatusView.m
//  ZSBTC
//
//  Created by DJ on 17/1/20.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "UserOrderItemStatusView.h"


#define imgHight_Width self.height/3*2

@implementation UserOrderItemStatusView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame title:(NSString*)title imageName:(NSString*)imageName{
    if (self = [super initWithFrame:frame]) {
        
        
        
        
        [self addSubview:[self titleImg]];
        self.titleImg.image = [UIImage imageNamed:imageName];
        
        [self addSubview:[self titleLabel]];
        self.titleLabel.text = title;
    }
    return self;
}



- (UIImageView*)titleImg{
    if (!_titleImg) {
        _titleImg = [[UIImageView alloc]initWithFrame:CGRectMake(self.width/2-10, 15, 20, 20)];
        _titleImg.backgroundColor = [UIColor clearColor];
    }
    return _titleImg;
}

- (UILabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, self.width, 20)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titleLabel;
}


@end
