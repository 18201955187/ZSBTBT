//
//  NSDate+Category.m
//  ZSBTB
//
//  Created by DJ on 16/12/13.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

#pragma mark-  获取当前时间

+(NSString *)getCuttentTime_Nomal:(int)fromType{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    switch (fromType) {
        case TO_DATA_TYPE_A:
            [dateformatter setDateFormat:@"yyyy年MM月dd日"];
            break;
        case TO_DATA_TYPE_B:
            [dateformatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case TO_DATA_TYPE_C:
            [dateformatter setDateFormat:@"yyyy/MM/dd"];
            break;
        case TO_DATA_TYPE_D:
            [dateformatter setDateFormat:@"yyyy@@MM@@dd"];
            break;
        default:
            break;
    }
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    NSLog(@"locationString:%@",locationString);
    return locationString;
}

#pragma mark-  将字符串转化为时间

+(NSDate *)toDate_Nomal:(NSString *)str fromType:(int)fromType{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    switch (fromType) {
        case TO_DATA_TYPE_A:
            [dateFormat setDateFormat:@"yyyy年MM月dd日"];
            break;
        case TO_DATA_TYPE_B:
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            break;
        case TO_DATA_TYPE_C:
            [dateFormat setDateFormat:@"yyyy/MM/dd"];
            break;
        case TO_DATA_TYPE_D:
            [dateFormat setDateFormat:@"yyyy@@MM@@dd"];
            break;
        default:
            break;
    }
    NSDate *date = [dateFormat dateFromString:str];
    return date;
}


#pragma mark-  将详细字符串转化成时间
+(NSDate *)toDate_Detal:(NSString *)str fromType:(int)fromType{
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    switch (fromType) {
        case TO_DATA_TYPE_A:
            [dateFormat setDateFormat:@"yyyy年MM月dd日 HH:MM"];
            break;
        case TO_DATA_TYPE_B:
            [dateFormat setDateFormat:@"yyyy-MM-dd HH:MM"];
            break;
        case TO_DATA_TYPE_C:
            [dateFormat setDateFormat:@"yyyy/MM/dd HH:MM"];
            break;
        case TO_DATA_TYPE_D:
            [dateFormat setDateFormat:@"yyyy@@MM@@dd HH:MM"];
            break;
        default:
            break;
    }
    NSDate *date = [dateFormat dateFromString:str];
    return date;
    
}

#pragma mark-  将时间转化为字符串

+(NSString *)toString_Nomal:(NSDate*)date fromType:(int)fromType{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    switch (fromType) {
        case TO_DATA_TYPE_A:
            [dateFormat setDateFormat:@"yyyy年MM月dd日"];
            break;
        case TO_DATA_TYPE_B:
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            break;
        case TO_DATA_TYPE_C:
            [dateFormat setDateFormat:@"yyyy/MM/dd"];
            break;
        case TO_DATA_TYPE_D:
            [dateFormat setDateFormat:@"yyyy@@MM@@dd"];
            break;
        default:
            break;
    }
    NSString * dateStr = [dateFormat stringFromDate:date];
    return dateStr;
}

#pragma mark-  将详细时间转化成字符串
+(NSString *)toString_Detal:(NSDate*)date fromType:(int)fromType{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    switch (fromType) {
        case TO_DATA_TYPE_A:
            [dateFormat setDateFormat:@"yyyy年MM月dd日 HH:MM"];
            break;
        case TO_DATA_TYPE_B:
            [dateFormat setDateFormat:@"yyyy-MM-dd HH:MM"];
            break;
        case TO_DATA_TYPE_C:
            [dateFormat setDateFormat:@"yyyy/MM/dd HH:MM"];
            break;
        case TO_DATA_TYPE_D:
            [dateFormat setDateFormat:@"yyyy@@MM@@dd HH:MM"];
            break;
        default:
            break;
    }
    NSString * dateStr = [dateFormat stringFromDate:date];
    return dateStr;

}




@end
