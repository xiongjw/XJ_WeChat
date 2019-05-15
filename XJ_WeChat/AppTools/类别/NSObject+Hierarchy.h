//
//  NSObject+Hierarchy.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Hierarchy)

- (UIViewController*)topMostController;

- (UIViewController*)currentViewController;

@end
