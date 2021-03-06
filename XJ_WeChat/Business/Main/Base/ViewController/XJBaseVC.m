//
//  XJBaseVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJBaseVC.h"

@interface XJBaseVC ()

@end

@implementation XJBaseVC

/// 页面请求
-(void)requestWithRefresh:(BOOL)refresh
{
    
}

/// 返回按钮、title
- (void)backAction
{
    if (self.presentingViewController && [self isKindOfClass:[self.navigationController.viewControllers[0] class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)showBackBtn:(BOOL)showBackBtn
{
    [self showBackBtn:showBackBtn withTitle:nil];
}

- (void)showBackBtn:(BOOL)showBackBtn withTitle:(NSString *)title
{
    if (title && title.length > 0) {
        self.navigationItem.title = title;
    }
    if (showBackBtn) {
        MJWeakSelf
        self.navigationItem.leftBarButtonItem = [ZZJBlockBarButtonItem blockedBarButtonItemWithImage:[UIImage imageNamed:@"nav_back"] eventHandler:^{
            [weakSelf backAction];
        }];
    }
    else {
        /// 隐藏返回按钮，且不让滑动返回
        self.navigationItem.hidesBackButton = YES;
        self.disablePopGesture = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end
