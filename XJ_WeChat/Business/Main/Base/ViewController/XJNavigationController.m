//
//  XJNavigationController.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJNavigationController.h"

@interface XJNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation XJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationBar *bar = [UINavigationBar appearance];
    //bar.barTintColor = RGBACOLOR(0.1, 0.1, 0.1, 0.9);
    bar.barTintColor = [UIColor whiteColor];
    bar.tintColor = [UIColor themeColor];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    
    self.interactivePopGestureRecognizer.delegate = self;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers[0] == self.topViewController) {
        return NO;
    }
    else if ([self.topViewController isKindOfClass:[XJBaseVC class]]) {
        return !((XJBaseVC *)self.topViewController).disablePopGesture;
    }
    
    return YES;
}

@end
