//
//  XJSafeUtil.m
//  XJ_WeChat
//
//  Created by mac on 2019/6/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJSafeUtil.h"

@implementation XJSafeUtil

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

+ (long)safeNumber:(id)obj
{
    if ([self isSafeObj:obj]) {
        return [obj longValue];
    }
    return 0;
}

@end
