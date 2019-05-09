//
//  XJTextField.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJTextField.h"

@interface XJTextField () <UITextFieldDelegate>

@end

@implementation XJTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _maxLength = 0;
        _statisticsType = XJStatisticsNormal;
        
        [self addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
        self.delegate = self;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidChange
{
    if (_maxLength == 0) {
        return;
    }
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        NSInteger length = [self showLength:self.text];
        if (length <= _maxLength) {
            
        }
        else {
            // 开始裁减了
            NSString *text = self.text;
            NSString *tobeString = [text substringToIndex:text.length - 1];
            while ([self showLength:tobeString] > _maxLength) {
                tobeString = [tobeString substringToIndex:tobeString.length - 1];
            }
            self.text = tobeString;
        }
    }
}

-(BOOL)shouldChangeTextInRange:(UITextRange *)range replacementText:(NSString *)text
{
    if (_maxLength == 0) {
        return YES;
    }
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        if (text.length > 0) {
            if ([self realLength:self.text] >= _maxLength) {
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


#pragma mark - setter
-(void)setMaxLength:(NSInteger)maxLength
{
    _maxLength = maxLength;
}

-(void)setStatisticsType:(XJStatisticsType)statisticsType
{
    _statisticsType = statisticsType;
}

@end
