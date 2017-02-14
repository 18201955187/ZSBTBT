//
//  ZFCollectButton.m
//  ZSBTC
//
//  Created by DJ on 17/1/17.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ZFCollectButton.h"

@implementation ZFCollectButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame imgName:(NSString*)imgName LabelTitle:(NSString *)LabelTitle{
    if (self = [super initWithFrame:frame]) {
        if (self.img == nil) {
            UIImageView*img = [[UIImageView alloc]init];
            img.frame = CGRectMake(10, 10, 20, 20);
            img.image = [UIImage imageNamed:imgName];
            self.img = img;
            [self addSubview:self.img];
        }
        
        if (self.label == nil) {
            UILabel *label = [[UILabel alloc]init];
            label.frame = CGRectMake(0, 30, self.width, 21);
            label.text = LabelTitle;
            label.font = [UIFont systemFontOfSize:8];
            label.textColor = [UIColor grayColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = [UIColor clearColor];
            self.label = label;
            [self addSubview:self.label];
        }
    }
    return self;
}


@end
