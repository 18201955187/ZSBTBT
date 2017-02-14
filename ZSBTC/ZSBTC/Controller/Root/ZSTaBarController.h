//
//  ZSTaBarController.h
//  ZSBTC
//
//  Created by DJ on 17/1/10.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSTaBarController : UITabBarController<UITabBarControllerDelegate>

@property (nonatomic,strong)UITabBarItem *CartabBarItem;
- (void)setTabBarIndex:(NSInteger)index;
- (void)setCartabBarItembadgeValue:(NSString*)ValueStr;
@end
