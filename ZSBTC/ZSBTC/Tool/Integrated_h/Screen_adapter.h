//
//  Screen_adapter.h
//  ZSBTB
//
//  Created by DJ on 16/12/8.
//  Copyright © 2016年 DJ. All rights reserved.
//

#ifndef Screen_adapter_h
#define Screen_adapter_h


// 获取屏幕大小
#define Screen_Bounds   [UIScreen mainScreen].bounds
#define Screen_Size     Screen_Bounds.size
#define Screen_Width    Screen_Size.width
#define Screen_Height   Screen_Size.height

// 常用系统的高度
#define Height_KeyBoard         216.0f
#define Height_TabBar           49.0f
#define Height_NavigationBar    44.0f
#define Height_StatusBar        20.0f
#define Height_TopBar   Height_NavigationBar + Height_StatusBar
#define NavBar_Hight 64


#pragma mark-   系统版本和机型
// 系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS6_OR_UP (IOS_VERSION >= 6.0) ? YES : NO
#define IOS7_OR_UP (IOS_VERSION >= 7.0) ? YES : NO
#define IOS8_OR_UP (IOS_VERSION >= 8.0) ? YES : NO
#define IOS9_OR_UP (IOS_VERSION >= 9.0) ? YES : NO

// 设备类型, 2 >> ipad, 1 >> iphone
#define Device_Type (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) ? 1 : 2
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? YES : NO
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) ? YES : NO
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

// 机型
#define IS_IPHONE4  (IS_IPHONE && Screen_Height == 480.0f) ? YES : NO
#define IS_IPHONE5  (IS_IPHONE && Screen_Height == 568.0f) ? YES : NO
#define IS_IPHONE6  (IS_IPHONE && Screen_Height == 667.0f) ? YES : NO
#define IS_IPHONE6P (IS_IPHONE && Screen_Height == 736.0f) ? YES : NO
#define IS_IPHONE7  (IS_IPHONE && Screen_Height == 667.0f) ? YES : NO
#define IS_IPHONE7P (IS_IPHONE && Screen_Height == 736.0f) ? YES : NO




#define tableHeader_Hight 180


#endif /* Screen_adapter.h */
