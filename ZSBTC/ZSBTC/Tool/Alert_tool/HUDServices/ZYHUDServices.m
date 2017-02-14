//
//  ZYHUDServices.m
//  centanet
//
//  Created by RangerChiong on 16/10/27.
//  Copyright © 2016年 Centaline. All rights reserved.
//

#import "ZYHUDServices.h"

@implementation ZYHUDServices

/*!
 *  只显示菊花
 */
+ (MBProgressHUD *)showIndicator {
    return [self showIndicatorOnView:[self __keyWindow]];
}

+ (MBProgressHUD *)showIndicatorOnView:(UIView *)view {
    if (!view) return [self showIndicator];

    return [self __haveHUD:view];
}

+ (MBProgressHUD *)showIndicatorWithTitle:(NSString *)title {
    return [self showIndicatorOnView:[self __keyWindow] title:title];
}

+ (MBProgressHUD *)showIndicatorOnView:(UIView *)view title:(NSString *)title {
    MBProgressHUD *hud = [self showIndicatorOnView:view];
    hud.detailsLabelText = title;
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:14.f];
    return hud;
}

+ (void)showWithTitle:(NSString *)title {
    [self showOnView:[self __keyWindow] title:title];
}

+ (void)showOnView:(UIView *)view title:(NSString *)title {
    [self showOnView:view title:title duration:[self __timeInterval]];
}

+ (void)showWithTitle:(NSString *)title duration:(NSTimeInterval)ti {
    [self showOnView:[self __keyWindow] title:title duration:ti];
}

+ (void)showOnView:(UIView *)view title:(NSString *)title duration:(NSTimeInterval)ti {
    MBProgressHUD *hud = [self __haveHUD:view];;
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = title;
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:14.f];
    [hud hide:YES afterDelay:ti];
}

+ (void)showWithError:(NSString *)error {
    [self showOnView:[self __keyWindow] error:error];
}

+ (void)showOnView:(UIView *)view error:(NSString *)error {
    [self showOnView:view error:error duration:[self __timeInterval]];
}

+ (void)showWithError:(NSString *)error duration:(NSTimeInterval)ti {
    [self showOnView:[self __keyWindow] error:error duration:ti];
}

+ (void)showOnView:(UIView *)view error:(NSString *)error duration:(NSTimeInterval)ti {
    MBProgressHUD *hud = [self showOnView:view icon:@"hud_icon_cross" duration:ti];
    hud.detailsLabelText = error;
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:14.f];
    hud.margin = 15.f;
}

+ (void)showWithSuccess:(NSString *)success {
    [self showOnView:[self __keyWindow] success:success];
}

+ (void)showOnView:(UIView *)view success:(NSString *)success {
    [self showOnView:view success:success duration:[self __timeInterval]];
}

+ (void)showWithSuccess:(NSString *)success duration:(NSTimeInterval)ti {
    [self showOnView:[self __keyWindow] success:success duration:ti];
}

+ (void)showOnView:(UIView *)view success:(NSString *)success duration:(NSTimeInterval)ti {
    MBProgressHUD *hud = [self showOnView:view icon:@"hud_icon_check" duration:ti];
    hud.detailsLabelText = success;
}

+ (MBProgressHUD *)showOnView:(UIView *)view icon:(NSString *)icon {
    return [self showOnView:view icon:icon duration:[self __timeInterval]];
}

+ (MBProgressHUD *)showOnView:(UIView *)view icon:(NSString *)icon duration:(NSTimeInterval)ti {
    MBProgressHUD *hud = [self __haveHUD:view];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:icon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    [hud hide:YES afterDelay:ti];
    return hud;
}

+ (void)hide {
    [self hideForView:[self __keyWindow]];
}

+ (void)hideForView:(UIView *)view {
    [self hideForView:view delay:0.0];
}

+ (void)hideDelay {
    [self hideDelayForView:[self __keyWindow]];
}

+ (void)hideDelayForView:(UIView *)view {
    [self hideForView:view delay:[self __timeInterval]];
}

+ (void)hideDelayWithTimeInterval:(NSTimeInterval)ti {
    [self hideForView:[self __keyWindow] delay:ti];
}

+ (void)hideForView:(UIView *)view delay:(NSTimeInterval)ti {
    MBProgressHUD *hud = [self __foundHUD:view];
    [hud hide:YES afterDelay:ti];
}

#pragma mark-  private methods

+ (NSTimeInterval)__timeInterval {
    return 1.5;
}

+ (UIWindow *)__keyWindow {
//    NSArray *windows = [UIApplication sharedApplication].windows;
//    for(UIWindow *window in [windows reverseObjectEnumerator]) {
//    键盘window会被遍历出来· 随着键盘消失· HUD消失 有Bug
//        if ([window isKindOfClass:[UIWindow class]] && CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
//            return window;
//    }
    
    return [[UIApplication sharedApplication].delegate window];
}

+ (MBProgressHUD *)__showHUD:(UIView *)view {
    return [MBProgressHUD showHUDAddedTo:view animated:YES];
}

+ (MBProgressHUD *)__foundHUD:(UIView *)view {
    return [MBProgressHUD HUDForView:view];
}

+ (MBProgressHUD *)__haveHUD:(UIView *)view {
    return [self __foundHUD:view] ?: [self __showHUD:view];
}

@end
