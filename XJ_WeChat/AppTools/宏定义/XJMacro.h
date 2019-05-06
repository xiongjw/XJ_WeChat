//
//  XJMacro.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/10.
//  Copyright © 2019 mac. All rights reserved.
//

#ifndef XJMacro_h
#define XJMacro_h

/// system
#define KeyWindow               [UIApplication sharedApplication].keyWindow
#define KAppDelegate            [AppDelegate shareAppDelegate]

/// 手机型号
#define IS_iPad                (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_iPhone              (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/// 屏幕
#define Screen_Frame            [UIScreen mainScreen].bounds
#define Screen_Width            Screen_Frame.size.width
#define Screen_Height           Screen_Frame.size.height

#define ScreenMaxLength        (MAX(Screen_Width, Screen_Height))
#define ScreenMinLength        (MIN(Screen_Width, Screen_Height))

#define IS_iPhone5             (IS_iPhone && ScreenMaxLength == 568.0)
#define IS_iPhone6             (IS_iPhone && ScreenMaxLength == 667.0)
#define IS_iPhone6P            (IS_iPhone && ScreenMaxLength == 736.0)
// 包括X和XS
#define IS_iPhoneX_XS          (IS_iPhone && ScreenMaxLength >= 812.0)
// 包括XR和XS Max
#define IS_iPhoneXR_XSMax      (IS_iPhone && ScreenMaxLength == 896.0)

#define iPhoneXSafeHeight      (IS_iPhoneX_XS ? 34 : 0)

#define StatusBarHeight        [[UIApplication sharedApplication] statusBarFrame].size.height
#define TabBarHeight           (IS_iPhoneX_XS ? 83 : 49)
#define NavHeight              (StatusBarHeight + 44)

//设置颜色
#define RGBCOLOR(r,g,b)         [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
#define RGBACOLOR(r,g,b,a)      [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#define FormatString(...)       [NSString stringWithFormat: __VA_ARGS__]
//#define StringNotNull(string)


#define kDocumentDirectory ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject])

#endif /* XJMacro_h */
