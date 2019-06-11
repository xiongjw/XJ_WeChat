//
//  XJRequestEngin.m
//  XJ_WeChat
//
//  Created by mac on 2019/6/3.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJRequestEngin.h"

@implementation XJRequestEngin

+ (NSString *)getCompleteUrl:(NSString *)urlString
{
    return urlString;
}

// 图片链接处理（包含图片中含有中文）
+ (NSString *)getImageUrl:(NSString *)urlString
{
    NSString *urlStr = [self getCompleteUrl:urlString];
    // 以下2种都可以
    //urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    return urlStr;
}

@end
