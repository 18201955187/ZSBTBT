//
//  ProductDetalNavBarView.h
//  ZSBTC
//
//  Created by DJ on 17/1/17.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ProductDetalNavBarViewBackBlock)(void);
typedef void(^ProductDetalNavBarViewMoreBlock)(void);

@interface ProductDetalNavBarView : UIView

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

@property (nonatomic,copy)ProductDetalNavBarViewBackBlock backBlock;
@property (nonatomic,copy)ProductDetalNavBarViewMoreBlock MoreBlock;
+ (instancetype)SetDetalNavBarViewWithBackBlock:(void(^)(void))BackBlock moreBlock:(void(^)(void))moreBlock;

@end
