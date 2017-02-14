//
//  General_Macro_Judge.h
//  ZSBTB
//
//  Created by DJ on 16/12/9.
//  Copyright © 2016年 DJ. All rights reserved.
//


#ifndef General_Macro_Judge_h
#define General_Macro_Judge_h



#pragma mark --- 公用颜色宏
/**16进制颜色转UIColor  Color_Hex(0x000000)**/
#define Color_Hex(hexValue)   [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0]
// RGB颜色
#define Color_RGBA(r,g,b,a)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define Color_RGB(r,g,b)      Color_RGBA(r,g,b,1.0f)
#define Color_Random Color_RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))





#pragma mark --- 导航栏颜色配置
/**导航栏颜色**/
#define NavgationBar_Color_R 255
#define NavgationBar_Color_G 255
#define NavgationBar_Color_B 255

#define Common_NomalColor Color_RGB(246,62,21)
#define ToolLinViewColor Color_RGB(237, 237, 237)
#define Light_WhiteColor Color_RGB(240, 240, 240);


//默认通常颜色
#define NavgationBar_Color  Color_RGB(NavgationBar_Color_R, NavgationBar_Color_G, NavgationBar_Color_B)
#define Black_Clear_Color [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.5]

//通过alpha设置 NavgationBar 的透明度
#define NavgationBar_Color_Alpha(alpha)  Color_RGBA(NavgationBar_Color_R,NavgationBar_Color_G,NavgationBar_Color_B,alpha)
/**导航透明情况下颜色**/
#define NavgationBar_Color_Clear NavgationBar_Color_Alpha(0.0f)


#define SafeRun_Block(block, ...) block ? block(__VA_ARGS__) : nil


#endif /* General_Macro_Judge.h */
