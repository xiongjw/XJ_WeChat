//
//  XJActionSheet.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJActionSheet.h"

@interface XJActionSheet ()

@property (nonatomic,strong) UIView *menuView;

@end

@implementation XJActionSheet

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

-(void)setMenuList:(NSArray *)menuList
{
    _menuList = menuList;
    [self setUpUI];
}

- (void)setUpUI
{
    _menuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Height, 0)];
    _menuView.backgroundColor = [UIColor whiteColor];
    _menuView.tag = 99;
    [self addSubview:_menuView];
    
    UIButton *btn = nil;
    UIView *lineView = nil;
    BOOL hasCancel = NO;
    NSDictionary *lastObj = [_menuList lastObject];
    if ([@"cancel" isEqualToString:lastObj[@"code"]]) {
        hasCancel = YES;
    }
    CGFloat posY = 0;
    for (int i = 0; i < _menuList.count; i++) {
        
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, posY, Screen_Width, 50);
        
        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithColor:RGBCOLOR(235, 236, 238)] forState:UIControlStateHighlighted];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor titleColor] forState:UIControlStateNormal];
        
        [btn setTitle:_menuList[i][@"name"] forState:UIControlStateNormal];
        btn.tag = 10 + i;
        [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [_menuView addSubview:btn];
        
        if (i < _menuList.count - 1) {
            // 最后一个是取消
            if (i == _menuList.count - 2 && hasCancel) {
                lineView = [[UIView alloc] initWithFrame:CGRectMake(0, btn.bottom, Screen_Width, 7)];
                lineView.backgroundColor = [UIColor bgColor];
                lineView.layer.borderWidth = .5;
                lineView.layer.borderColor = [UIColor lineColor].CGColor;
                [_menuView addSubview:lineView];
                posY = lineView.bottom;
            }
            else {
                lineView = [[UIView alloc] initWithFrame:CGRectMake(0, btn.bottom, Screen_Width, .5)];
                lineView.backgroundColor = [UIColor lineColor];
                [_menuView addSubview:lineView];
                posY = lineView.bottom;
            }
        }
    }
    _menuView.height = btn.bottom + iPhoneXSafeHeight;
}

- (void)clickAction:(UIButton *)btn
{
    NSDictionary *item = _menuList[btn.tag - 10];
    if ([@"cancel" isEqualToString:item[@"code"]]) {
        [self dismiss];
    }
    else
    {
        if (self.clickItemBlock) {
            self.clickItemBlock(item);
        }
        [self dismiss];
    }
}

- (void)show
{
    [KeyWindow addSubview:self];
    
    self.alpha = 0.0;
    _menuView.top = Screen_Height;
    __block UIView *blockView = _menuView;
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = 1.0;
        blockView.top = Screen_Height - CGRectGetHeight(blockView.frame);
    }];
}
+ (void)showWithList:(NSArray *)menuList clickItemBlock:(XJClickActionSheetItemBlock)clickItemBlock
{
    XJActionSheet *view = [[XJActionSheet alloc] initWithFrame:CGRectZero];
    view.menuList = menuList;
    view.clickItemBlock = clickItemBlock;
    [view show];
}

- (void)dismiss
{
    __block UIView *blockView = _menuView;
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = 0.0;
        blockView.top = Screen_Height;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view.tag == 99) {
        return;
    }
    [self dismiss];
}

@end
