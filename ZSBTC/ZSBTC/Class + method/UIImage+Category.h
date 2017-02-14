//
//  UIImage+Category.h
//  ZSBTB
//
//  Created by DJ on 16/12/14.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**将颜色转化为image**/
+(UIImage*) createImageWithColor:(UIColor*) color rect:(CGRect)rect;
@end
