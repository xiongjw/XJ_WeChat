//
//  XJAppUtil.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJAppUtil.h"

@implementation XJAppUtil

+ (CGSize)getLabelSizeWithText:(NSString *)text lbFont:(UIFont *)lbFont lbWidth:(CGFloat)lbWidth
{
    CGSize retSize = [text boundingRectWithSize:CGSizeMake(lbWidth, MAXFLOAT)
                                        options:(NSStringDrawingTruncatesLastVisibleLine |
                                                 NSStringDrawingUsesLineFragmentOrigin |
                                                 NSStringDrawingUsesFontLeading)
                                     attributes:@{NSFontAttributeName: lbFont}
                                        context:nil].size;
    return retSize;
}

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

+ (NSArray *)readRegionDataWithKey:(NSString *)key
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"region" ofType:@"plist"];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSArray *resultList = data[key];
    
    return resultList;
}

+ (BOOL)isSafeObj:(id)obj
{
    if ([obj isKindOfClass:[NSNull class]] || [obj isEqual:[NSNull null]] || obj == nil) {
        return NO;
    }
    return YES;
}

+ (NSString *)safeString:(id)obj
{
    if ([self isSafeObj:obj] && [obj isKindOfClass:[NSString class]]) {
        return obj;
    }
    return @"";
}

+ (NSDictionary *)safeDictionary:(id)obj
{
    if ([self isSafeObj:obj] && [obj isKindOfClass:[NSDictionary class]]) {
        return obj;
    }
    return @{};
}

+ (NSArray *)safeArray:(id)obj
{
    if ([self isSafeObj:obj] && [obj isKindOfClass:[NSArray class]]) {
        return obj;
    }
    return @[];
}

@end
