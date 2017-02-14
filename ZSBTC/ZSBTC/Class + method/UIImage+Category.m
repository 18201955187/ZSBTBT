//
//  UIImage+Category.m
//  ZSBTB
//
//  Created by DJ on 16/12/14.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

#pragma mark -- 将颜色转化为image
+(UIImage*) createImageWithColor:(UIColor*) color rect:(CGRect)rect{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}



@end
