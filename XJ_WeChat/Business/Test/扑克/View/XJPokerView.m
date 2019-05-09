//
//  XJPokerView.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJPokerView.h"

@interface XJPokerView ()

@property (nonatomic,strong) UILabel *numLb;
@property (nonatomic,strong) UILabel *colorLb;

@end

@implementation XJPokerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor lineColor].CGColor;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.numLb];
        [self addSubview:self.colorLb];
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickPoker:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)clickPoker:(UITapGestureRecognizer *)tap
{
    if (self.top == 0) {
        if (self.clickBlock) {
            self.clickBlock(self.pokerStr);
        }
    }
    else {
        self.top = 0;
    }
}

-(UILabel *)numLb
{
    if (!_numLb) {
        _numLb = [[UILabel alloc] initWithFrame:CGRectMake(5, 2, 14, 14)];
        _numLb.numberOfLines = 0;
        _numLb.font = [UIFont systemFontOfSize:12];
    }
    return _numLb;
}

-(UILabel *)colorLb
{
    if (!_colorLb) {
        _colorLb = [[UILabel alloc] initWithFrame:CGRectMake(5, 20, 14, 14)];
        _colorLb.font = [UIFont systemFontOfSize:12];
    }
    return _colorLb;
}

-(void)setPokerStr:(NSString *)pokerStr
{
    _pokerStr = pokerStr;
    if ([pokerStr hasPrefix:@"大王"]) {
        self.numLb.height = self.numLb.font.lineHeight * 5;
        self.colorLb.hidden = YES;
        
        self.numLb.text = @"JOKER";
        self.numLb.textColor = [UIColor redColor];
    }
    else if ([pokerStr hasPrefix:@"小王"]) {
        self.numLb.height = 80;
        self.colorLb.hidden = YES;
        
        self.numLb.text = @"JOKER";
        self.numLb.textColor = [UIColor blackColor];
    }
    else if ([pokerStr hasPrefix:@"黑"] || [pokerStr hasPrefix:@"梅"]) {
        self.numLb.height = 20;
        self.colorLb.hidden = NO;
        
        self.numLb.text = [pokerStr substringFromIndex:1];
        self.numLb.textColor = [UIColor blackColor];
        
        self.colorLb.text = [pokerStr substringToIndex:1];
        self.colorLb.textColor = [UIColor blackColor];
    }
    else if ([pokerStr hasPrefix:@"红"] || [pokerStr hasPrefix:@"方"]) {
        self.numLb.height = 20;
        self.colorLb.hidden = NO;
        
        self.numLb.text = [pokerStr substringFromIndex:1];
        self.numLb.textColor = [UIColor redColor];
        
        self.colorLb.text = [pokerStr substringToIndex:1];
        self.colorLb.textColor = [UIColor redColor];
    }
}

@end
