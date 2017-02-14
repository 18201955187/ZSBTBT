//
//  SegmentedView.h
//  ZSBTC
//
//  Created by DJ on 17/1/25.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SegmentedView_selectIndexBlock)(NSInteger index);

@interface SegmentedView : UIView
@property (nonatomic,strong)UIView *ItemBackView;
@property (nonatomic,copy)SegmentedView_selectIndexBlock selectIndexBlock;
@property (nonatomic,strong)UIView *contemtBackView;
- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray*)titleArray textFont:(CGFloat)textFont Radius:(CGFloat)Radius borderWidth:(CGFloat)borderWidth LayerColor:(UIColor*)LayerColor backNormalColor:(UIColor*)backNormalColor  backSelectColor:(UIColor *)backSelectColor defaultSelectIndex:(NSInteger)defaultSelectIndex withSelectIndexBlock:(SegmentedView_selectIndexBlock)SelectIndexBlock;
@property (nonatomic,copy)UIColor *backNormalColor;
@property (nonatomic,copy)UIColor *backSelectColor;

@end
