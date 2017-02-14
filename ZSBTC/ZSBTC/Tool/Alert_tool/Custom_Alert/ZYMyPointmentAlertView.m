//
//  ZYMyPointmentAlertView.m
//  centanet
//
//  Created by xunan on 2016/10/26.
//  Copyright © 2016年 Centaline. All rights reserved.
//

#import "ZYMyPointmentAlertView.h"

@interface ZYMyPointmentAlertView() {
    dispatch_block_t _block;

}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *msgTitleLabel;


@end

@implementation ZYMyPointmentAlertView

+ (void)showSucceedViewWithTitle:(NSString *)title delay:(NSTimeInterval)timeInterval done:(dispatch_block_t)block {
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    window.userInteractionEnabled = NO;
    ZYMyPointmentAlertView *alertView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:0] lastObject];
    alertView.imageView.image = [UIImage imageNamed:@"myPointment_chenggong"];
    alertView.msgTitleLabel.text = title;
    alertView.center = window.center;
    [window addSubview:alertView];
    
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [alertView removeFromSuperview];
        window.userInteractionEnabled = YES;
        SafeRun_Block(block);
    });
    
}

+ (void)showErrorViewWithTitle:(NSString *)title delay:(NSTimeInterval)timeInterval done:(dispatch_block_t)block {
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    window.userInteractionEnabled = NO;
    ZYMyPointmentAlertView *alertView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:0] lastObject];
    alertView.imageView.image = [UIImage imageNamed:@"myPointment_sibai"];
    alertView.msgTitleLabel.text = title;
    alertView.center = window.center;
    [window addSubview:alertView];
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [alertView removeFromSuperview];
        window.userInteractionEnabled = YES;
        SafeRun_Block(block);
    });
}

/**示例代码
[ZYMyPointmentAlertView showSucceedViewWithTitle:model.msg delay:1.5 done:^{
    [weakSelf loadFirstDataFilter];
}];**/

@end
