//
//  CollectionNavBar.h
//  ZSBTC
//
//  Created by DJ on 17/1/25.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"

typedef void(^BackBtnBlock)(void);

typedef void(^SegmentViewSelectindex_Block)(NSInteger index);

@interface CollectionNavBar : UIView

@property (nonatomic,copy)SegmentViewSelectindex_Block segmentViewSelectindex_Block;
@property (nonatomic,strong)UIImageView *backImg;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,copy)BackBtnBlock backBtnBlock;
@property (nonatomic,strong)HMSegmentedControl *segmentControl;
- (instancetype)initWithFrame:(CGRect)frame NavBarType:(NavBarType)NavBarType titleArray:(NSArray *)titleArray WithBackBlock:(BackBtnBlock)clicked selectIndexBlock:(SegmentViewSelectindex_Block)segmentViewSelectindex_Block;

- (void)setSegmentControlIndex:(NSInteger)index;
- (void)setSegmentControlClicked:(NSInteger)index;

@end
