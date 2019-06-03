//
//  NSString+Util.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

- (NSString *)notNull
{
    if ([self isKindOfClass:[NSNull class]] ||
        [self isEqual:[NSNull null]] ||
        [self isEqualToString:@"null"] ||
        self == nil) {
        return @"";
    }
    return self;
}

+ (NSString *)stringNotNull:(NSString *)stringStr
{
    return [stringStr notNull];
}

@end
