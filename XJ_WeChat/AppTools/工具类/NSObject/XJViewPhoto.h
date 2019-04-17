//
//  XJViewPhoto.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 图片浏览类
 */
@interface XJViewPhoto : NSObject

/**
 浏览单张图片

 @param imageView 图片本身控件
 @param urlString 大图链接
 */
+ (void)viewSinglePhoto:(UIView *)imageView urlString:(NSString *)urlString;

@end
