//
//  ProductDetalNavBar.h
//  ZSBTC
//
//  Created by DJ on 17/1/23.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"

typedef void(^BackBtnBlock)(void);

typedef void(^SegmentControl_Block)(NSInteger index);

@interface ProductDetalNavBar : UIView

@property (nonatomic,copy)SegmentControl_Block segmentControl_Block;
@property (nonatomic,strong)UIImageView *backImg;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,copy)BackBtnBlock backBtnBlock;
@property (nonatomic,strong)HMSegmentedControl *segmentControl;
- (instancetype)initWithFrame:(CGRect)frame NavBarType:(NavBarType)NavBarType titleArray:(NSArray *)titleArray WithBackBlock:(BackBtnBlock)clicked;

- (void)setSegmentControlIndex:(NSInteger)index;
- (void)setSegmentControlClicked:(NSInteger)index;

@end
