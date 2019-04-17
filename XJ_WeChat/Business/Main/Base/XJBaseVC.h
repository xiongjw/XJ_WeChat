//
//  XJBaseVC.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJBaseVC : UIViewController

/// 禁页面滑动返回事件
@property (nonatomic) BOOL disablePopGesture;

/// 页面请求
-(void)requestWithRefresh:(BOOL)refresh;

/// 返回按钮、title
- (void)showBackBtn:(BOOL)showBackBtn;
- (void)showBackBtn:(BOOL)showBackBtn withTitle:(NSString *)title;
- (void)backAction;

/// 选择数据block
@property (nonatomic, copy) void (^selectDataBlock)(NSDictionary *item);

@end
