//
//  NSObject+Hierarchy.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "NSObject+Hierarchy.h"

@implementation NSObject (Hierarchy)

- (UIViewController*)topMostController
{
    UIViewController *topController = [KeyWindow rootViewController];
    
    //  Getting topMost ViewController
    while ([topController presentedViewController])
        topController = [topController presentedViewController];
    
    //  Returning topMost ViewController
    return topController;
}

- (UIViewController*)currentViewController
{
    UIViewController *currentViewController = [self topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}

@end
