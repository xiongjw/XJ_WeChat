//
//  XJLabel.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJLabel.h"

@interface XJLabel ()

@property (nonatomic,strong) UIMenuController *menuController;

@end

@implementation XJLabel

- (instancetype)init
{
    return [super init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [super initWithFrame:frame];
}

- (void)longPressTextGesture:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        self.backgroundColor = [UIColor HLBgColor];
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        //        for (NSString *itemStr in _itemStrs) {
        //            UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:itemStr action:@selector(menuAction:)];
        //            [items addObject:menuItem];
        //        }
        // 因为无法识别UIMenuItem上的文字，action的sender对应UIMenuController而不是UIMenuItem，
        // 所以采取这种笨方法,最多给10个，不会超过吧
        for (int i = 0; i < _longPressItemStrs.count; i++) {
            UIMenuItem *menuItem = [[UIMenuItem alloc] init];
            menuItem.title = _longPressItemStrs[i];
            if (i == 0) menuItem.action = @selector(menuAction);
            else if (i == 1) menuItem.action = @selector(menuAction1);
            else if (i == 2) menuItem.action = @selector(menuAction2);
            else if (i == 3) menuItem.action = @selector(menuAction3);
            else if (i == 4) menuItem.action = @selector(menuAction4);
            else if (i == 5) menuItem.action = @selector(menuAction5);
            else if (i == 6) menuItem.action = @selector(menuAction6);
            else if (i == 7) menuItem.action = @selector(menuAction7);
            else if (i == 8) menuItem.action = @selector(menuAction8);
            else if (i == 9) menuItem.action = @selector(menuAction9);
            
            if (menuItem) [items addObject:menuItem];
        }
        [self.menuController setMenuItems:[NSArray arrayWithArray:items]];
        [self.menuController setTargetRect:self.frame inView:self.superview];
        [self.menuController setMenuVisible:YES animated:YES];
    }
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(menuAction) ||
        action == @selector(menuAction1) ||
        action == @selector(menuAction2) ||
        action == @selector(menuAction3) ||
        action == @selector(menuAction4) ||
        action == @selector(menuAction5) ||
        action == @selector(menuAction6) ||
        action == @selector(menuAction7) ||
        action == @selector(menuAction8) ||
        action == @selector(menuAction9)) {
        return YES;
    }
    //隐藏系统默认的菜单项
    return NO;
}

#pragma mark - 点击事件
- (void)menuAction { [self callBack:0]; }

- (void)menuAction1 { [self callBack:1]; }

- (void)menuAction2 { [self callBack:2]; }

- (void)menuAction3 { [self callBack:3]; }

- (void)menuAction4 { [self callBack:4]; }

- (void)menuAction5 { [self callBack:5]; }

- (void)menuAction6 { [self callBack:6]; }

- (void)menuAction7 { [self callBack:7]; }

- (void)menuAction8 { [self callBack:8]; }

- (void)menuAction9 { [self callBack:9]; }

- (void)callBack:(NSInteger)menuIndex {
    if (self.menuItemClickBlock) self.menuItemClickBlock(_longPressItemStrs[menuIndex]);
}

#pragma mark - UIMenuController 监听
-(void)WillHideMenu:(id)sender {
    self.backgroundColor = [UIColor clearColor];
}

/// 其它地方，主动让UIMenuController消失
- (void)dismissMenu {
    [self.menuController setMenuVisible:NO animated:YES];
}

#pragma mark - getter
-(UIPasteboard *)pasteBoard
{
    if (!_pasteBoard) {
        _pasteBoard = [UIPasteboard generalPasteboard];
    }
    return _pasteBoard;
}

-(UIMenuController *)menuController
{
    if (!_menuController) {
        _menuController = [UIMenuController sharedMenuController];
    }
    return _menuController;
}

#pragma mark - setter
-(void)setIsLongPress:(BOOL)isLongPress
{
    _isLongPress = isLongPress;
    if (isLongPress) {
        
        _longPressItemStrs = @[@"复制"];
        
        self.userInteractionEnabled = YES;
        
        UILongPressGestureRecognizer *longPressText = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressTextGesture:)];
        longPressText.minimumPressDuration = .5;
        [self addGestureRecognizer:longPressText];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(WillHideMenu:)
                                                     name:UIMenuControllerWillHideMenuNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(dismissMenu)
                                                     name:KDismissMenuControllerNote
                                                   object:nil];
    }
}

-(void)setLongPressItemStrs:(NSArray *)longPressItemStrs
{
    _longPressItemStrs = longPressItemStrs;
}



- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
