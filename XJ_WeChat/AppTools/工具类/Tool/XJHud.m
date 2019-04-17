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
    [SVProgressHUD dismissWithDelay:2];
}

+ (void)showSuccessWithStatus:(NSString*)status {
    [SVProgressHUD showSuccessWithStatus:status];
    [SVProgressHUD dismissWithDelay:2];
}

+ (void)showErrorWithStatus:(NSString*)status {
    [SVProgressHUD showErrorWithStatus:status];
    [SVProgressHUD dismissWithDelay:2];
}

+ (void)dismiss {
    [SVProgressHUD dismiss];
}
@end
