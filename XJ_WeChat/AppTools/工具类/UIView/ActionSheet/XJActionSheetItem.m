//
//  XJActionSheetItem.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/7.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJActionSheetItem.h"

@implementation XJActionSheetItem

+ (NSArray *)getModelArray:(NSArray *)array
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSDictionary *data in array) {
        if ([@"cancel" isEqualToString:data[@"code"]]) {
            continue;
        }
        XJActionSheetItem *item = [[XJActionSheetItem alloc] init];
        item.name = data[@"name"];
        item.code = data[@"code"];
        [result addObject:item];
    }
    return result;
}

+ (BOOL)hasCancel:(NSArray *)array
{
    NSDictionary *data = [array lastObject];
    if ([@"cancel" isEqualToString:data[@"code"]]) {
        return YES;
    }
    return NO;
}

@end
