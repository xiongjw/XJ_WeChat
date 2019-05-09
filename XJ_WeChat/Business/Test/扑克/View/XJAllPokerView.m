//
//  XJAllPokerView.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJAllPokerView.h"

#import "XJPokerView.h"
#import "XJPoker.h"

@implementation XJAllPokerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        XJPokerView *pokerView = nil;
        MJWeakSelf
        for (int i = 0; i < 20; i++) {
            pokerView = [[XJPokerView alloc] initWithFrame:CGRectMake(0, 10, 30, frame.size.height - 10)];
            pokerView.tag = 100 + i;
            pokerView.clickBlock = ^(NSString *pokerStr) {
                if (weakSelf.clickBlock) {
                    weakSelf.clickBlock(pokerStr);
                }
            };
            [self addSubview:pokerView];
        }
    }
    return self;
}

-(void)setModel:(XJPokerPlayer *)model
{
    _model = model;
    
    for (UIView *subView in self.subviews) {
        subView.hidden = YES;
    }
    XJPokerView *pokerView = nil;
    CGFloat posX = 15;
    for (int i = 0; i < model.pokers.count; i++)
    {
        pokerView = [self viewWithTag:100 + i];
        pokerView.hidden = NO;
        pokerView.left = posX;
        pokerView.pokerStr = model.pokers[i];
        posX += 20;
    }
}

@end
