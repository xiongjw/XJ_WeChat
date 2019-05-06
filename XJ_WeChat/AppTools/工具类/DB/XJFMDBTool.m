//
//  XJFMDBTool.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/5.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJFMDBTool.h"

#define     KLastBuildVersion @"lastBuildVersion"

@implementation XJFMDBTool

+ (void)createFMDB
{
    NSInteger lastBuildVersion = [[XJUserDefaults getObject:KLastBuildVersion] integerValue];
    NSString *buildVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSInteger localBuildVersion = [buildVersion integerValue];
    if (localBuildVersion > lastBuildVersion) {
        [XJUserDefaults saveObject:@(localBuildVersion) key:KLastBuildVersion];
        [self applicationUpdated:lastBuildVersion];
    }
}

+ (FMDatabase *)dataBase
{
    NSString *path = [kDocumentDirectory stringByAppendingPathComponent:@"XJDatabase.db"];
    return [FMDatabase databaseWithPath:path];
}

+ (void)applicationUpdated:(NSInteger)lastBuildVersion
{
    FMDatabase *db = [self dataBase];
    if ([db open])
    {
        // 应用全新安装
        if (lastBuildVersion == 0) {
            // 用户表
            BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS xj_user (userId varchar(64), nickname varchar(64), title text, content text, time bigint, type varchar(64), relatId varchar(64), imageUrl varchar(64), isRead int)"];
            if (!result) {
                //NSLog(@"建表(notification_list)失败");
            }
            
            /// 圈子表
            result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS xj_circle (userId varchar(64), msgId varchar(64), title text, content text, time bigint, type varchar(64), relatId varchar(64), imageUrl varchar(64), isRead int)"];
            if (!result) {
                //NSLog(@"建表(notification_list)失败");
            }
            
            /// 评论表
            
            [db close];
            return;
        }
        
    }
    [db close];
}

@end
