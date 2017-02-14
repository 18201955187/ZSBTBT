//
//  UserAssetsToolBar.h
//  ZSBTC
//
//  Created by DJ on 17/1/24.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonTwoTextView.h"

typedef void(^UserAssetsToolBarTap_Block)(NSInteger TapTag);

@interface UserAssetsToolBar : UIView

@property (nonatomic,strong)CommonTwoTextView*TwoTextView;
@property (nonatomic,strong) UIView *contentBackView;
- (instancetype)initWithFrame:(CGRect)frame withTap_Block:(UserAssetsToolBarTap_Block)Tap_Block;
@property (nonatomic,copy)UserAssetsToolBarTap_Block ToolBarTap_Block;

@property (nonatomic,strong)NSArray *TopArray;
@property (nonatomic,strong)NSArray *BottomArray;
@property (nonatomic,strong)UIView *bottomLinView;

@end
