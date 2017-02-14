//
//  UesrCommonTypeCell.h
//  ZSBTC
//
//  Created by DJ on 17/1/20.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^UesrCommonTypeCell_Block)(void);
@interface UesrCommonTypeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *editTypeLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic,copy)UesrCommonTypeCell_Block TypeCell_Block;
+ (instancetype)msGetInstance ;
- (void)LoadUesrCommonTypeCell:(NSString*)title editTitle:(NSString*)editTitle withClickBlock:(UesrCommonTypeCell_Block)clicked;

@end
