//
//  XJMaxLengthVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJMaxLengthVC.h"

#define MaxLength   10

@interface XJMaxLengthVC () <UITextViewDelegate, UITextFieldDelegate>

@property (nonatomic,strong) UITextView *mTextView;
@property (nonatomic,strong) UITextField *mTextField;

@property (nonatomic,strong) UILabel *showLb;

@end

@implementation XJMaxLengthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.mTextView];
    [self.view addSubview:self.showLb];
}

-(UITextView *)mTextView
{
    if (!_mTextView) {
        _mTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 20, Screen_Width - 30, 200)];
        _mTextView.backgroundColor = [UIColor bgColor];
        _mTextView.delegate = self;
    }
    return _mTextView;
}

-(UITextField *)mTextField
{
    if (!_mTextField) {
    }
    return _mTextField;
}

-(UILabel *)showLb
{
    if (!_showLb) {
        _showLb = [[UILabel alloc] initWithFrame:CGRectMake(self.mTextView.right - 100 - 10, self.mTextView.bottom - 10 - 20, 100, 20)];
        _showLb.font = [UIFont systemFontOfSize:14];
        _showLb.textAlignment = NSTextAlignmentRight;
        _showLb.text = FormatString(@"0/%d",MaxLength);
    }
    return _showLb;
}

-(void)textViewDidChange:(UITextView *)textView
{
    _showLb.text = FormatString(@"%ld/%d",[self getShowLengthWithText:textView.text], MaxLength);
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    UITextRange *selectedRange = [textView markedTextRange];
    UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
    //NSString *newText = [textView textInRange:selectedRange];
    //NSLog(@"newText:“%@”",newText);
    //NSLog(@"text:“%@”",text);
    if (text.length > 0) {
        if ([self getStringLengthWithText:textView.text] >= MaxLength) {
            return NO;
        }
        if (text.length > MaxLength) {
            return NO;
        }
    }
    
    return YES;
}

- (CGFloat)getStringLengthWithText:(NSString *)text
{
    __block CGFloat stringLength = 0.0;
    [text enumerateSubstringsInRange:NSMakeRange(0, text.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        //NSLog(@"%@  \t%zd", substring, strlen([substring UTF8String]));
        NSInteger l = strlen([substring UTF8String]);
        if (l >= 4) stringLength += 1.0;
        else if (l == 3) stringLength += 1.0;
        else stringLength += 0.5;
    }];
    NSLog(@"stringLength:%.f",stringLength);
    return stringLength;
    //return (NSInteger)roundf(stringLength);
}

- (NSInteger)getShowLengthWithText:(NSString *)text
{
    CGFloat length = [self getStringLengthWithText:text];
    return (NSInteger)roundf(length);
}
@end
