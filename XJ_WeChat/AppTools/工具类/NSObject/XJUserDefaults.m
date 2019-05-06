//
//  XJUserDefaults.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/5.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJUserDefaults.h"

@implementation XJUserDefaults

+ (BOOL)hasObject:(NSString *)key
{
    id value = [self getObject:key];
    return value ? YES : NO;
}

+ (void)saveObject:(id)value key:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:value forKey:key];
    [prefs synchronize];
}

+ (id)getObject:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)removeObject:(NSString *)key
{
    if ([self hasObject:key])
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (void)removeAll
{
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}

@end
