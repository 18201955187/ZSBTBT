//
//  GeneralEnum.h
//  ZSBTC
//
//  Created by DJ on 17/1/12.
//  Copyright © 2017年 DJ. All rights reserved.
//

#ifndef GeneralEnum_h
#define GeneralEnum_h

typedef enum NavBarType{
    NavBarType_BackHideen_Yes = 0,     //导航栏返回键隐藏
    NavBarType_BackHideen_No = 1,      //导航栏返回键不隐藏
}NavBarType;


typedef NS_ENUM(NSInteger, NSOrderStatus_Type) {
    NSOrderStatus_Type_Total = 0,          //全部订单
    NSOrderStatus_Type_WaitPay = 1,        //待付款
    NSOrderStatus_Type_WaitSendGood = 2,   //待发货
    NSOrderStatus_Type_WaitGetGood = 3,    //待收货
    NSOrderStatus_Type_WaitEvaluation = 4, //待评价
    NSOrderStatus_Type_BackGood = 5,       //退货退款
};


#endif /* GeneralEnum.h */
