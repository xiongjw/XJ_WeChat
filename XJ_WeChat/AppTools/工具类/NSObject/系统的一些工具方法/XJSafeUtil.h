//
//  XJSafeUtil.h
//  XJ_WeChat
//
//  Created by mac on 2019/6/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KIsSafeObj(obj)         [XJSafeUtil isSafeObj:obj]
#define KSafeString(obj)        [XJSafeUtil safeString:obj]
#define KSafeDictionary(obj)    [XJSafeUtil safeDictionary:obj]
#define KSafeArray(obj)         [XJSafeUtil safeArray:obj]
#define KSafeNumber(obj)        [XJSafeUtil safeNumber:obj]
/**
 对象的安全取值
 */
@interface XJSafeUtil : NSObject

+ (BOOL)isSafeObj:(id)obj;
+ (NSString *)safeString:(id)obj;
+ (NSDictionary *)safeDictionary:(id)obj;
+ (NSArray *)safeArray:(id)obj;
+ (long)safeNumber:(id)obj;

@end
