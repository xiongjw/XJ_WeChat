//
//  XJHud.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJHud : NSObject

+ (void)setXJDefaultStyle;

+ (void)showWithStatus:(NSString*)status;

+ (void)showInfoWithStatus:(NSString*)status;

+ (void)showSuccessWithStatus:(NSString*)status;

+ (void)showErrorWithStatus:(NSString*)status;

+ (void)dismiss;

@end
