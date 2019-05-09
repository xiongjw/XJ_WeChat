//
//  XJTextView.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJTextView.h"

@interface XJTextView () <UITextViewDelegate>

@property (nonatomic,strong) UILabel *placeholderLb;
@property (nonatomic,strong) UILabel *tipsLb;

@end

@implementation XJTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.placeholderLb];
        _maxLength = 160;
        _tipsFont = [UIFont systemFontOfSize:12];
        _tipsNormalColor = [UIColor descColor];
        _tipsAttriColor = [UIColor themeColor];
        _statisticsType = XJStatisticsNormal;
        
        self.delegate = self;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

#pragma mark - UITextViewDelegate
-(void)textViewDidChange:(UITextView *)textView
{
    UITextRange *selectedRange = [textView markedTextRange];
    UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        NSInteger length = [self showLength:textView.text];
        if (length <= _maxLength) {
            _tipsLb.text = FormatString(@"%ld/%ld",length, _maxLength);
            _tipsLb.attributedText = [self getLbAttributedWithText:_tipsLb.text length:length];
        }
        else {
            // 开始裁减了
            NSString *text = textView.text;
            NSString *tobeString = [text substringToIndex:text.length - 1];
            while ([self showLength:tobeString] > _maxLength) {
                tobeString = [tobeString substringToIndex:tobeString.length - 1];
            }
            textView.text = tobeString;
            _tipsLb.text = FormatString(@"%ld/%ld",_maxLength, _maxLength);
            _tipsLb.attributedText = [self getLbAttributedWithText:_tipsLb.text length:_maxLength];
        }
    }
    
    self.placeholderLb.hidden = (textView.text.length > 0);
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    UITextRange *selectedRange = [textView markedTextRange];
    UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        if (text.length > 0) {
            if ([self realLength:textView.text] >= _maxLength) {
                return NO;
            }
        }
    }
    return YES;
}

#pragma mark - util
- (NSInteger)realLength:(NSString *)text
{
    return [XJInputUtil getStringRealLengthWithText:text statisticsType:_statisticsType];
}

- (NSInteger)showLength:(NSString *)text
{
    return [XJInputUtil getStringShowLengthWithText:text statisticsType:_statisticsType];
}

- (NSMutableAttributedString *)getLbAttributedWithText:(NSString *)text
                                                length:(NSInteger)length
{
    return [XJInputUtil getLbAttributedWithText:text length:length color:_tipsAttriColor];
}

#pragma mark - ui懒加载
-(UILabel *)placeholderLb
{
    if (!_placeholderLb) {
        _placeholderLb = [[UILabel alloc] initWithFrame:CGRectMake(5, 8, self.width - 10, 20)];
        _placeholderLb.numberOfLines = 0;
        _placeholderLb.textColor = [UIColor descColor];
    }
    return _placeholderLb;
}

-(UILabel *)tipsLb
{
    if (!_tipsLb) {
        _tipsLb = [[UILabel alloc] initWithFrame:CGRectMake(self.width - 100 - 5, self.height - _tipsFont.lineHeight - 5, 100, _tipsFont.lineHeight)];
        _tipsLb.textAlignment = NSTextAlignmentRight;
        _tipsLb.font = _tipsFont;
        _tipsLb.textColor = _tipsNormalColor;
        _tipsLb.text = FormatString(@"0/%ld",_maxLength);
        _tipsLb.attributedText = [self getLbAttributedWithText:_tipsLb.text length:0];
    }
    return _tipsLb;
}
#pragma mark - setter system
-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLb.font = font;
}

#pragma mark - setter
-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    //_placeholderColor = placeholderColor;
    self.placeholderLb.textColor = placeholderColor;
}

-(void)setPlaceholderText:(NSString *)placeholderText
{
    //_placeholderText = placeholderText;
    self.placeholderLb.text = placeholderText;
    [self.placeholderLb sizeToFit];
}

-(void)setMaxLength:(NSInteger)maxLength
{
    _maxLength = maxLength;
    self.tipsLb.text = FormatString(@"0/%ld",_maxLength);
    self.tipsLb.attributedText = [self getLbAttributedWithText:self.tipsLb.text length:0];
}

-(void)setShowTipLb:(BOOL)showTipLb
{
    _showTipLb = showTipLb;
    if (showTipLb) {
        [self addSubview:self.tipsLb];
    }
}

-(void)setTipsFont:(UIFont *)tipsFont
{
    self.tipsLb.font = tipsFont;
}

-(void)setTipsNormalColor:(UIColor *)tipsNormalColor
{
    self.tipsLb.textColor = tipsNormalColor;
}

-(void)setTipsAttriColor:(UIColor *)tipsAttriColor
{
    _tipsAttriColor = tipsAttriColor;
}

-(void)setStatisticsType:(XJStatisticsType)statisticsType
{
    _statisticsType = statisticsType;
}
@end
