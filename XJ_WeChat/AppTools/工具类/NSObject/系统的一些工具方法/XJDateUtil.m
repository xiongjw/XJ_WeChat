//
//  XJDateUtil.m
//  XJ_WeChat
//
//  Created by mac on 2019/6/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJDateUtil.h"

@implementation XJDateUtil

+ (long long)cTimestamp
{
    return [[NSDate date] timeIntervalSince1970];
}

+ (NSString *)cTimestampStr
{
    return FormatString(@"%lld",[self cTimestamp]);
}

+ (NSString *)cTimeStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [formatter stringFromDate:[NSDate date]];
}

+ (NSString *)getTimeStrWithTimestamp:(long long)timestamp
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    return [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timestamp]];
}

+ (long long)getTimestampWithTimeStr:(NSString *)timeStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [[formatter dateFromString:timeStr] timeIntervalSince1970];
}

@end
