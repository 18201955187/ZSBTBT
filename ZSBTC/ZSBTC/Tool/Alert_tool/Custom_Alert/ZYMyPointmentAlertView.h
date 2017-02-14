//
//  ZYMyPointmentAlertView.h
//  centanet
//
//  Created by xunan on 2016/10/26.
//  Copyright © 2016年 Centaline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYMyPointmentAlertView : UIView

+ (void)showSucceedViewWithTitle:(NSString *)title delay:(NSTimeInterval)timeInterval done:(dispatch_block_t)block;
+ (void)showErrorViewWithTitle:(NSString *)title delay:(NSTimeInterval)timeInterval done:(dispatch_block_t)block;


@end
