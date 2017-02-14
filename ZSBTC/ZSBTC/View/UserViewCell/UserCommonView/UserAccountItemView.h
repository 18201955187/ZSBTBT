//
//  UserAccountItemView.h
//  ZSBTC
//
//  Created by DJ on 17/1/20.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserAccountItemView : UIView

- (instancetype)initWithFrame:(CGRect)frame accountType:(NSString*)accountType accountNumber:(NSString*)accountNumber;
@property (nonatomic,strong)UILabel *accountNumberLabel;
@property (nonatomic,strong)UILabel *accountTypeLabel;

@end
