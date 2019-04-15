//
//  XJChatUtil.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJChatUtil : NSObject

+ (NSMutableArray *)demoData;

+ (CGSize)getLabelSize:(NSString *)text font:(UIFont *)font width:(CGFloat)width;

@end
