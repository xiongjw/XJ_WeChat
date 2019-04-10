//
//  AppDelegate+Config.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "AppDelegate+Config.h"

#import "XJTabBarVC.h"

@implementation AppDelegate (Config)

- (void)setRootVC
{
    [self setRootVC_tabbar];
}

- (void)setRootVC_tabbar
{
    if (self.window == nil) {
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }
    XJTabBarVC *tabBar = [[XJTabBarVC alloc] init];
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
}

@end
