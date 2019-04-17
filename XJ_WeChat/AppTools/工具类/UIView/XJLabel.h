//
//  XJLabel.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KDismissMenuControllerNote      @"KDismissMenuControllerNote"

/**
 富文本label，拓展
 */
@interface XJLabel : MLLinkLabel

// 长按（默认关闭）
@property (nonatomic,assign) BOOL isLongPress;
@property (nonatomic,strong) NSArray *longPressItemStrs;
@property (nonatomic,  copy) void (^menuItemClickBlock)(NSString *itemStr);

@property (nonatomic,strong) UIPasteboard *pasteBoard;

@end
