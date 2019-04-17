//
//  UIColor+AppColor.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UIColor+AppColor.h"

@implementation UIColor (AppColor)

+ (UIColor *)themeColor
{
    return RGBCOLOR(0, 190, 12);
}

+ (UIColor *)titleColor
{
    return RGBCOLOR(50, 50, 50);
}

+ (UIColor *)contentColor
{
    return RGBCOLOR(83, 83, 90);
}

+ (UIColor *)descColor
{
    return RGBCOLOR(169, 169, 169);
}

+ (UIColor *)bgColor
{
    return RGBCOLOR(247, 247, 247);
}

+ (UIColor *)lineColor
{
    return RGBCOLOR(222, 223, 226);
}

+ (UIColor *)HLBgColor
{
    return [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
}

@end
