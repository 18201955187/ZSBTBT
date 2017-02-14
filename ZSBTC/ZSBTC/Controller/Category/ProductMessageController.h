//
//  ProductMessageController.h
//  ZSBTC
//
//  Created by DJ on 17/1/23.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^ProductMessageControllerContentOff_Block)(void);
@interface ProductMessageController : UIViewController
@property (nonatomic,copy)ProductMessageControllerContentOff_Block ContentOff_Block;

@end
