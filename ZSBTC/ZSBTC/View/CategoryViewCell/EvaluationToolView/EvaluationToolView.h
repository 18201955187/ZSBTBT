//
//  EvaluationToolView.h
//  ZSBTC
//
//  Created by DJ on 17/1/24.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EvaluationToolViewTap_Block)(NSInteger TapTag);

@interface EvaluationToolView : UIView
- (instancetype)initWithFrame:(CGRect)frame withTap_Block:(EvaluationToolViewTap_Block)Tap_Block;
@property (nonatomic,copy)EvaluationToolViewTap_Block ToolViewTap_Block;

@property (nonatomic,strong)NSArray *TopArray;
@property (nonatomic,strong)NSArray *BottomArray;
@property (nonatomic,strong)UIView *bottomLinView;
@end
