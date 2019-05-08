//
//  XJFadeView.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJFadeView.h"

@interface XJFadeView ()

@property (nonatomic,strong) UILabel *backLabel;
@property (nonatomic,strong) UILabel *frontLabel;

@property (nonatomic,assign) XJFadeType fadeType;
@property (nonatomic,assign) XJFadeDirection fadeDirection;

@end

@implementation XJFadeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLabel];
        
        _fadeType = XJFade_Normal;
        _fadeDirection = XJDirection_Right;
    }
    return self;
}

- (void)createLabel
{
    _backLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _backLabel.numberOfLines = 0;
    [self addSubview:_backLabel];
    
    _frontLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _frontLabel.numberOfLines = 0;
    [self addSubview:_frontLabel];
}

- (void)fadeType:(XJFadeType)fadeType fadeDirection:(XJFadeDirection)fadeDirection
{
    _fadeType = fadeType;
    _fadeDirection = fadeDirection;
    if (fadeType == XJFade_Normal) {
        CAGradientLayer *layer = [CAGradientLayer layer];
        layer.frame = self.bounds;
        layer.colors = @[(id)[UIColor clearColor],(id)[UIColor redColor].CGColor,(id)[UIColor blackColor].CGColor,(id)[UIColor clearColor].CGColor];
        layer.locations = @[@(0.01),@(0.1),@(0.9),@(0.99)];
        _frontLabel.layer.mask = layer;
    }
    else {
        CAGradientLayer *layer = [CAGradientLayer layer];
        layer.frame = self.bounds;
        layer.colors = @[(id)[UIColor clearColor].CGColor,(id)[UIColor redColor].CGColor,(id)[UIColor clearColor].CGColor];
        layer.locations = @[@(0.25),@(0.5),@(0.75)];
        layer.startPoint = CGPointMake(0, 0);
        
        if (_fadeDirection == XJDirection_Right) {
            layer.endPoint = CGPointMake(1, 0);
            layer.position = CGPointMake(-self.bounds.size.width/4.0, self.bounds.size.height/2.0);
        }
        else {
            layer.endPoint = CGPointMake(0, 1);
            //layer.position = CGPointMake(-self.bounds.size.height/4.0, self.bounds.size.width/2.0);
        }
        _frontLabel.layer.mask = layer;
    }
}

- (void)fadeWithDuration:(NSTimeInterval)duration
{
    NSString *keyPath = @"";
    if (_fadeDirection == XJDirection_Right) keyPath = @"transform.translation.x";
    else keyPath = @"transform.translation.y";
    
    CGFloat toValue = 0;
    if (_fadeDirection == XJDirection_Right) toValue = self.bounds.size.width;
    else toValue = self.bounds.size.height;
    
    if (_fadeType == XJFade_Normal) {
        CABasicAnimation *basicAnimation = [CABasicAnimation animation];
        basicAnimation.keyPath = keyPath;
        basicAnimation.fromValue = @(0);
        basicAnimation.toValue = @(toValue);
        basicAnimation.duration = duration;
        basicAnimation.repeatCount = LONG_MAX;
        basicAnimation.removedOnCompletion = NO;
        basicAnimation.fillMode = kCAFillModeForwards;
        [_frontLabel.layer.mask addAnimation:basicAnimation forKey:nil];
    }
    else {
        CABasicAnimation *basicAnimation = [CABasicAnimation animation];
        basicAnimation.keyPath = keyPath;
        basicAnimation.fromValue = @(0);
        basicAnimation.toValue = @(toValue + toValue/2.0);
        basicAnimation.duration = duration;
        basicAnimation.repeatCount = LONG_MAX;
        basicAnimation.removedOnCompletion = NO;
        basicAnimation.fillMode = kCAFillModeForwards;
        [_frontLabel.layer.mask addAnimation:basicAnimation forKey:nil];
    }
}

- (void)setBackColor:(UIColor *)backColor
{
    _backColor = backColor;
    _backLabel.textColor = backColor;
    
}

- (void)setForeColor:(UIColor *)foreColor
{
    _foreColor = foreColor;
    _frontLabel.textColor = foreColor;
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    _backLabel.font = font;
    _frontLabel.font = font;
}

- (void)setAlignment:(NSTextAlignment)alignment
{
    _alignment = alignment;
    _backLabel.textAlignment = alignment;
    _frontLabel.textAlignment = alignment;
}

- (void)setText:(NSString *)text
{
    _text = text;
    _backLabel.text = text;
    _frontLabel.text = text;
}

@end
