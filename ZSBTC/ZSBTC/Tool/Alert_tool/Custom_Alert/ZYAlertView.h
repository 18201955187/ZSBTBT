//
//  ZYAlertView.h
//  Test0629
//
//  Created by Ranger on 16/6/29.
//  Copyright © 2016年 Centaline. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+EasyShow.h"


@interface ZYAlertView : UIView

@property (nonatomic, copy) NSString *title;

/*!
 *  初始化方法  得到一个alertView
 */
+ (instancetype)setupAlertView;

/*!
 *  显示在view上  内部已经初始化 可设置消失时间 消失后的回调
 */
+ (void)showForView:(UIView *)view title:(NSString *)title hideDelay:(NSTimeInterval)delay done:(dispatch_block_t)block;

/*!
 *  显示在view上  内部已经初始化 可设置消失时间
 */
+ (void)showForView:(UIView *)view title:(NSString *)title hideDelay:(NSTimeInterval)delay;

/*!
 *  显示在view上  内部已经初始化 消失时间1.5s 消失后的回调block
 */
+ (void)showForView:(UIView *)view title:(NSString *)title done:(dispatch_block_t)block;

/*!
 *  显示在view上  内部已经初始化 消失时间1.5s
 */
+ (void)showForView:(UIView *)view title:(NSString *)title;

/*!
 *  从当前的所有视图中 找到刚刚显示的alert view
 */
+ (instancetype)HUDForView:(UIView *)view;

/*!
 *  显示在view上
 */
- (void)show:(UIView *)view;

/*!
 *  立刻隐藏alert view
 */
- (void)hide;

/*!
 *  延迟隐藏alert view  回调block
 */
- (void)hideAfterTimerInterval:(NSTimeInterval)timerInterval done:(dispatch_block_t)block;

@end
