//
//  XJUserDefaults.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/5.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJUserDefaults : NSObject

+ (BOOL)hasObject:(NSString *)key;

+ (void)saveObject:(id)value key:(NSString *)key;

+ (id)getObject:(NSString *)key;

+ (void)removeObject:(NSString *)key;

+ (void)removeAll;

@end
