//
//  XJHud.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJHud.h"

@implementation XJHud

+ (void)setXJDefaultStyle {
    // 弹框时关闭交互
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    // hud样式
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    //[SVProgressHUD setSuccessImage:[UIImage imageNamed:@""]];
    //[SVProgressHUD setErrorImage:[UIImage imageNamed:@""]];
    //[SVProgressHUD setInfoImage:[UIImage imageNamed:@""]];
}

+ (void)showWithStatus:(NSString*)status {
    [SVProgressHUD showWithStatus:status];
}

+ (void)showInfoWithStatus:(NSString*)status {
    [SVProgressHUD showInfoWithStatus:status];
    [SVProgressHUD dismissWithDelay:[self getDelayTime:status]];
}

+ (void)showSuccessWithStatus:(NSString*)status {
    [SVProgressHUD showSuccessWithStatus:status];
    [SVProgressHUD dismissWithDelay:[self getDelayTime:status]];
}

+ (void)showErrorWithStatus:(NSString*)status {
    [SVProgressHUD showErrorWithStatus:status];
    [SVProgressHUD dismissWithDelay:[self getDelayTime:status]];
}

+ (NSTimeInterval)getDelayTime:(NSString*)status {
    if (status.length < 8) return 1;
    else if (status.length < 16) return 2;
    return 3;
}

+ (void)dismiss {
    [SVProgressHUD dismiss];
}
@end
