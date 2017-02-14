//
//  NSString+Category.h
//  ZSBTB
//
//  Created by DJ on 16/12/12.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)


#pragma mark-  判断字符串
/**判断是否是空字符**/
+ (BOOL)isBlankString:(NSString *)string;
/**判断字符串是否有空行**/
- (BOOL)matchBlankSpace;

/**判断字符串是否连续8个数字**/
- (BOOL)textHasSerialNumber:(NSString *)str;

/**判断字符串是否是整形**/
- (BOOL)isPureInt:(NSString*)string;

/**正则匹验证码,6位的数字**/
- (BOOL)checkVerifyCode;


#pragma mark-  字符串高度宽度的计算
/**求取一般字符串高度**/
-(CGFloat)getStringHeight:(UIFont*)font width:(CGFloat)width;

/**求取一般字符串宽度**/
-(CGFloat)getStringWidth:(UIFont*)font Height:(CGFloat)height;

/**求取特殊字符串高度**/
-(CGFloat)mutableAttributedStringWithFont:(UIFont *)font
                                    width:(CGFloat)width
                             andLineSpace:(CGFloat)lineSpace;


#pragma mark-  将json转化为字典
/**将json转化为字典**/
+ (NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;

#pragma mark-  正则表达式判断
/** 判断国家码 */
- (BOOL)isValidMobliePhoneCountryCode;
/** 判断区号 */
- (BOOL)isValidTelephoneAreaCode;
/**正则表达式验证手机号码**/
- (BOOL)checkPhoneNumber;
/**是否是国外的手机号码**/
- (BOOL)isValidMobilePhoneForiCode;

/**正则表达试是否为邮箱**/
- (BOOL)isValidEmailCode;

/**是否是有效的固定电话**/
- (BOOL)isValidFixedTelephone;

/**判断是否为国外电话**/
- (BOOL)isValidFixedForiTelephone;

/**居民身份号码验证**/
- (BOOL)checkUserIDCard;




@end
