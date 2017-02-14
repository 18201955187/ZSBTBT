//
//  ZSNavBarView.h
//  ZSBTC
//
//  Created by DJ on 17/1/12.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackBtnBlock)(void);

@interface ZSNavBarView : UIView
@property (nonatomic,copy)BackBtnBlock backBtnBlock;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIImageView*backImg;
@property (nonatomic,strong) UIView *bottomView;
- (instancetype)initWithFrame:(CGRect)frame NavBarType:(NavBarType)NavBarType title:(NSString *)title WithBackBlock:(void(^)(void))clicked;
@end
