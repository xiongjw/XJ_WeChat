//
//  UIImage+color.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UIImage+color.h"

@implementation UIImage (color)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (UIImage *)bundleImageNamed:(NSString *)name
{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
    return [UIImage imageWithContentsOfFile:path];
}

+ (UIImage *)bundleImageNamed:(NSString *)name inBundle:(NSString *)bundleName
{
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    NSString *imagePath = [bundlePath stringByAppendingPathComponent:name];;
    return [UIImage imageWithContentsOfFile:imagePath];
}

+ (UIImage *)bundleImageNamed:(NSString *)name inBundle:(NSString *)bundleName dirName:(NSString *)dirName
{
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    //NSString *imagePath = [[NSBundle bundleWithPath:bundlePath] pathForResource:name ofType:@"png" inDirectory:dirName];
    NSString *imagePath = [[bundlePath stringByAppendingPathComponent:dirName] stringByAppendingPathComponent:name];
    return [UIImage imageWithContentsOfFile:imagePath];
}

@end
