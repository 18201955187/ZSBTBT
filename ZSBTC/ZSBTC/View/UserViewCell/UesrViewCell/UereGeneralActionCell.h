//
//  UereGeneralActionCell.h
//  ZSBTC
//
//  Created by DJ on 17/1/22.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionCell_One_Block)(NSInteger index);
typedef void(^ActionCell_Two_Block)(NSInteger index);
typedef void(^ActionCell_Three_Block)(NSInteger index);


@interface UereGeneralActionCell : UITableViewCell
@property (nonatomic,copy) ActionCell_One_Block Cell_One_Block;
@property (nonatomic,copy) ActionCell_Two_Block Cell_Two_Block;
@property (nonatomic,copy) ActionCell_Three_Block Cell_Three_Block;

+ (instancetype)msGetInstance;
- (void)LoadUereGeneralActionCellWithOne_Block:(ActionCell_One_Block)clicked;
- (void)LoadUereGeneralActionCell_Two;
- (void)LoadUereGeneralActionCell_Three;
@end
