//
//  UIView+ZFCategory.h
//  findproperty
//
//  Created by MacAir on 16/7/23.
//  Copyright © 2016年 Centaline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZFCategory)

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat maxX;
@property (nonatomic, assign) CGFloat maxY;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)isShowingOnKeyWindow;

- (UIWindow *)keyWindow;

/**
 *  从 xib 文件中加载文件
 */
+ (instancetype)viewFromXib;

//获取该视图的控制器
- (UIViewController*)viewController;

//删除当前视图内的所有子视图
- (void)removeChildViews;

//删除tableview底部多余横线
- (void)setExtraCellLineHidden: (UITableView *)tableView;
@end
