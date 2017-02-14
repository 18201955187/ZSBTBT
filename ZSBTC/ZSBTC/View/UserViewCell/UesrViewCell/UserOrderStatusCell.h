//
//  UserOrderStatusCell.h
//  ZSBTC
//
//  Created by DJ on 17/1/20.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UserOrderStatusCell_Block)(NSOrderStatus_Type Tag);

@interface UserOrderStatusCell : UITableViewCell
@property (nonatomic,copy)UserOrderStatusCell_Block OrderStatusCell_Block;
- (void)LoadUserOrderStatusCellWithStatus_Block:(UserOrderStatusCell_Block)UserOrderStatusCell_Block;
+ (instancetype)msGetInstance;
@end
