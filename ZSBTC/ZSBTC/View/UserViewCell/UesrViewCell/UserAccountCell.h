//
//  UserAccountCell.h
//  ZSBTC
//
//  Created by DJ on 17/1/22.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UserAccountCell_TypeBlock)(NSInteger index);

@interface UserAccountCell : UITableViewCell
@property (nonatomic,copy)UserAccountCell_TypeBlock TypeBlock;

+ (instancetype)msGetInstance;
- (void)LoadUserAccountCellWithTypeBlock:(UserAccountCell_TypeBlock)TypeBlock;
@end
