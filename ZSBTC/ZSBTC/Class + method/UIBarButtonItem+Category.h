//
//  UIBarButtonItem+Category.h
//  findproperty
//
//  Created by MacAir on 16/7/25.
//  Copyright © 2016年 Centaline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Category)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
