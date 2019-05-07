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
        
//        self.userInteractionEnabled = YES;
//        UITapGestureRecognizer *tap = nil;
//        [self addGestureRecognizer:tap];
    }
    return self;
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


- (void)pokerWithStr:(NSString *)str
{
    if ([str hasPrefix:@"大王"]) {
        self.numLb.height = self.numLb.font.lineHeight * 5;
        self.colorLb.hidden = YES;
        
        self.numLb.text = @"JOKER";
        self.numLb.textColor = [UIColor redColor];
    }
    else if ([str hasPrefix:@"小王"]) {
        self.numLb.height = 80;
        self.colorLb.hidden = YES;
        
        self.numLb.text = @"JOKER";
        self.numLb.textColor = [UIColor blackColor];
    }
    else if ([str hasPrefix:@"黑"] || [str hasPrefix:@"梅"]) {
        self.numLb.height = 20;
        self.colorLb.hidden = NO;
        
        self.numLb.text = [str substringFromIndex:1];
        self.numLb.textColor = [UIColor blackColor];
        
        self.colorLb.text = [str substringToIndex:1];
        self.colorLb.textColor = [UIColor blackColor];
    }
    else if ([str hasPrefix:@"红"] || [str hasPrefix:@"方"]) {
        self.numLb.height = 20;
        self.colorLb.hidden = NO;
        
        self.numLb.text = [str substringFromIndex:1];
        self.numLb.textColor = [UIColor redColor];
        
        self.colorLb.text = [str substringToIndex:1];
        self.colorLb.textColor = [UIColor redColor];
    }
}

@end
