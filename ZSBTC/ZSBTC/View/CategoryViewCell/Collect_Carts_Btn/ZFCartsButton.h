//
//  ZFCartsButton.h
//  ZSBTC
//
//  Created by DJ on 17/1/17.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFCartsButton : UIView
@property (nonatomic,strong)UIImageView *img;
@property (nonatomic,strong)UILabel *label;
- (instancetype)initWithFrame:(CGRect)frame imgName:(NSString*)imgName LabelTitle:(NSString *)LabelTitle;

@end
