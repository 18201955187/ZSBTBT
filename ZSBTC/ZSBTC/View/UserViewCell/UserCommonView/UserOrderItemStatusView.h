//
//  UserOrderItemStatusView.h
//  ZSBTC
//
//  Created by DJ on 17/1/20.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UserOrderItemStatusView : UIView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString*)title imageName:(NSString*)imageName;
@property (nonatomic,strong)UIImageView *titleImg;
@property (nonatomic,strong)UILabel *titleLabel;
@end
