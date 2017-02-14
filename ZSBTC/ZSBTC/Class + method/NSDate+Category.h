//
//  NSDate+Category.h
//  ZSBTB
//
//  Created by DJ on 16/12/13.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TO_DATA_TYPE_A 1 //@"yyyy年MM月dd日"
#define TO_DATA_TYPE_B 2 //@"yyyy-MM-dd"
#define TO_DATA_TYPE_C 3 //@"yyyy/MM/dd"
#define TO_DATA_TYPE_D 4 //@"yyyy@@MM@@dd"

@interface NSDate (Category)
#pragma mark-  获取当前时间
/**获取当前时间**/
+(NSString *)getCuttentTime_Nomal:(int)fromType;
/**将字符串转化为时间**/
+(NSDate *)toDate_Nomal:(NSString *)str fromType:(int)fromType;
/**将详细字符串转化为时间**/
+(NSDate *)toDate_Detal:(NSString *)str fromType:(int)fromType;

/**将时间转化成字符串**/
+(NSString *)toString_Nomal:(NSDate*)date fromType:(int)fromType;
/**详细时间转化字符串**/
+(NSString *)toString_Detal:(NSDate*)date fromType:(int)fromType;


@end
