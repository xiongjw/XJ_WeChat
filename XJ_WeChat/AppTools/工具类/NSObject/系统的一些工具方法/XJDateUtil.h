//
//  XJDateUtil.h
//  XJ_WeChat
//
//  Created by mac on 2019/6/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 时间相关,c为当前
 */
@interface XJDateUtil : NSObject

+ (long long)cTimestamp;
+ (NSString *)cTimestampStr;
+ (NSString *)cTimeStr;
+ (NSString *)getTimeStrWithTimestamp:(long long)timestamp;
+ (long long)getTimestampWithTimeStr:(NSString *)timeStr;

@end
