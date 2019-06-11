//
//  XJBaseWebVC.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WKWebLoadType) {
    LoadWebUrlString = 0,
    LoadLocalFile = 1,
    LoadHtmlString
};

@interface XJBaseWebVC : XJBaseVC

/// 加载网络url
- (void)loadWebUrl:(NSString *)webUrlString;

/// 加载本地html等其它文件
- (void)loadLocalHtml:(NSString *)htmlName;
- (void)loadLocalFile:(NSString *)FileName fileType:(NSString *)fileType;

/// 加载字符串
- (void)loadHtmlString:(NSString *)htmlString;

@end
