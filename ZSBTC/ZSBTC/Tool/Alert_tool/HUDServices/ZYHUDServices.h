//
//  ZYHUDServices.h
//  centanet
//
//  Created by RangerChiong on 16/10/27.
//  Copyright © 2016年 Centaline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface ZYHUDServices : NSObject

/*!
 *  只显示菊花
 */
+ (MBProgressHUD *)showIndicator;

/*!
 *  只显示菊花
 */
+ (MBProgressHUD *)showIndicatorOnView:(UIView *)view;

/*!
 *  显示菊花+文字
 */
+ (MBProgressHUD *)showIndicatorWithTitle:(NSString *)title;

/*!
 *  显示菊花+文字
 */
+ (MBProgressHUD *)showIndicatorOnView:(UIView *)view title:(NSString *)title;

/*!
 *  只显示文字 默认1.5秒后消失
 */
+ (void)showWithTitle:(NSString *)title;

/*!
 *  只显示文字 默认1.5秒后消失
 */
+ (void)showOnView:(UIView *)view title:(NSString *)title;

/*!
 *  只显示文字 延迟消失
 */
+ (void)showWithTitle:(NSString *)title duration:(NSTimeInterval)ti;

/*!
 *  只显示文字 延迟消失
 */
+ (void)showOnView:(UIView *)view title:(NSString *)title duration:(NSTimeInterval)ti;

/*!
 *  显示错误提示 默认1.5秒后消失
 */
+ (void)showWithError:(NSString *)error;

/*!
 *  显示错误提示 默认1.5秒后消失
 */
+ (void)showOnView:(UIView *)view error:(NSString *)error;

/*!
 *  显示错误提示 延迟消失
 */
+ (void)showWithError:(NSString *)error duration:(NSTimeInterval)ti;

/*!
 *  显示错误提示 延迟消失
 */
+ (void)showOnView:(UIView *)view error:(NSString *)error duration:(NSTimeInterval)ti;

/*!
 *  显示成功提示 默认1.5秒后消失
 */
+ (void)showWithSuccess:(NSString *)success;

/*!
 *  显示成功提示 默认1.5秒后消失
 */
+ (void)showOnView:(UIView *)view success:(NSString *)success;

/*!
 *  显示成功提示 默认1.5秒后消失
 */
+ (void)showWithSuccess:(NSString *)success duration:(NSTimeInterval)ti;

/*!
 *  显示成功提示 默认1.5秒后消失
 */
+ (void)showOnView:(UIView *)view success:(NSString *)success duration:(NSTimeInterval)ti;

/**
 *  立刻隐藏HUD
 */
+ (void)hide;

/**
 *  立刻隐藏HUD
 */
+ (void)hideForView:(UIView *)view;

/**
 *  延迟1.5秒隐藏HUD
 */
+ (void)hideDelay;

/**
 *  延迟1.5秒隐藏HUD
 */
+ (void)hideDelayForView:(UIView *)view;

/**
 *  延迟隐藏HUD
 */
+ (void)hideDelayWithTimeInterval:(NSTimeInterval)ti;

/**
 *  延迟隐藏HUD
 */
+ (void)hideForView:(UIView *)view delay:(NSTimeInterval)ti;

@end
