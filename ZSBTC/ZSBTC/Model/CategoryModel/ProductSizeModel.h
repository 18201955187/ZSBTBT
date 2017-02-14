//
//  ProductSizeModel.h
//  ZSBTC
//
//  Created by DJ on 17/1/19.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ProductSizeModel : JSONModel

@property (nonatomic,copy)NSString*Name;
@property (nonatomic,assign)NSInteger isSelected;

@end
