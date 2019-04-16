//
//  XJAppUtil.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJAppUtil.h"

@implementation XJAppUtil

+ (NSMutableAttributedString *)highlightWithKeyword:(NSString *)keyword
                                         originText:(NSString *)originText
{
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:originText];
    if (keyword.length == 0 || originText.length == 0) {
        return attributeStr;
    }
    NSMutableArray *indexArray = @[].mutableCopy;
    for(int i =0; i < [originText length]; i++)
    {
        NSString *temp = [originText substringWithRange:NSMakeRange(i,1)];
        if ([keyword containsString:temp]) {
            [indexArray addObject:[NSValue valueWithRange:NSMakeRange(i, 1)]];
        }
    }
    
    [indexArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRange range = [obj rangeValue];
        [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor themeColor] range:range];
    }];
    return attributeStr;
}

@end
