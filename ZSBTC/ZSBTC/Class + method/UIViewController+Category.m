//
//  UIViewController+Category.m
//  ZSBTB
//
//  Created by DJ on 16/12/14.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)



// 第一次形变
- (CATransform3D)transform1{
    
    // 每次进来都进行初始化 回归到正常状态
    CATransform3D form1 = CATransform3DIdentity;
    // m34就是实现视图的透视效果的（俗称近大远小）
    form1.m34 = 1.0/-900;
    // 缩小
    form1 = CATransform3DScale(form1, 0.85, 0.85, 1);
    // x轴旋转
    form1 = CATransform3DRotate(form1, 15.0 * M_PI/180.0, 1, 0, 0);
    return form1;
    
}

// 第二次形变
- (CATransform3D)transform2{
    
    // 初始化 再次回归正常
    CATransform3D form2 = CATransform3DIdentity;
    // 用和上面相同的m34 来设置透视效果
    form2.m34 = [self transform1].m34;
    // 向上平移一丢丢 让视图平滑点
    form2 = CATransform3DTranslate(form2, 0, self.view.frame.size.height * (-0.08), 0);
    // 最终缩小到0.8倍
    form2 = CATransform3DScale(form2, 0.8, 0.8, 1);
    return form2;
}




@end
