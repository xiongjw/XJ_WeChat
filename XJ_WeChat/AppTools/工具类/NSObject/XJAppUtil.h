//
//  XJAppUtil.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJAppUtil : NSObject

+ (NSMutableAttributedString *)highlightWithKeyword:(NSString *)keyword
                                         originText:(NSString *)originText;

@end
