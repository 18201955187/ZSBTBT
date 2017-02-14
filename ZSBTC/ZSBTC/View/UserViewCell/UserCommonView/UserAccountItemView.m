//
//  UserAccountItemView.m
//  ZSBTC
//
//  Created by DJ on 17/1/20.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "UserAccountItemView.h"

@implementation UserAccountItemView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame accountType:(NSString*)accountType accountNumber:(NSString*)accountNumber{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:[self accountTypeLabel]];
        self.accountTypeLabel.text = accountType;
        
        [self addSubview:[self accountNumberLabel]];
        self.accountNumberLabel.text = accountNumber;
    }
    return self;
}

- (UILabel*)accountNumberLabel{
    if (!_accountNumberLabel) {
        _accountNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, self.width, 20)];
        _accountNumberLabel.backgroundColor = [UIColor clearColor];
        _accountNumberLabel.textAlignment = NSTextAlignmentCenter;
        _accountNumberLabel.textColor = [UIColor lightGrayColor];
        _accountNumberLabel.font = [UIFont systemFontOfSize:13];
    }
    return _accountNumberLabel;
}

- (UILabel*)accountTypeLabel{
    if (!_accountTypeLabel) {
        _accountTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, self.width, 20)];
        _accountTypeLabel.backgroundColor = [UIColor clearColor];
        _accountTypeLabel.textAlignment = NSTextAlignmentCenter;
        _accountTypeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _accountTypeLabel;
}




@end
