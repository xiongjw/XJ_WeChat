//
//  XJTestInputVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJTestInputVC.h"

#import "XJTextField.h"
#import "XJTextView.h"

@interface XJTestInputVC ()

@property (nonatomic,strong) XJTextField *mTextField;
@property (nonatomic,strong) XJTextView *mTextView;

@end

@implementation XJTestInputVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.mTextField];
    [self.view addSubview:self.mTextView];
}

-(XJTextField *)mTextField
{
    if (!_mTextField) {
        _mTextField = [[XJTextField alloc] initWithFrame:CGRectMake(15, 20, Screen_Width - 30, 40)];
        _mTextField.backgroundColor = [UIColor bgColor];
        _mTextField.font = [UIFont systemFontOfSize:15];
        
        _mTextField.placeholder = @"说点什么好呢...";
        _mTextField.maxLength = 10;
        _mTextField.statisticsType = XJStatisticsSpecial;
    }
    return _mTextField;
}

-(UITextView *)mTextView
{
    if (!_mTextView) {
        _mTextView = [[XJTextView alloc] initWithFrame:CGRectMake(15, 100, Screen_Width - 30, 200)];
        _mTextView.backgroundColor = [UIColor bgColor];
        _mTextView.font = [UIFont systemFontOfSize:15];
        
        // 开始配置
        _mTextView.placeholderText = @"说点什么好呢...";
        _mTextView.maxLength = 10;
        _mTextView.showTipLb = YES;
        _mTextView.statisticsType = XJStatisticsSpecial;
    }
    return _mTextView;
}

@end
