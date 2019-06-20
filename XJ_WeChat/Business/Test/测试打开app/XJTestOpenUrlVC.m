//
//  XJTestOpenUrlVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/6/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJTestOpenUrlVC.h"

@interface XJTestOpenUrlVC ()

@end

@implementation XJTestOpenUrlVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
}

- (void)setUpUI
{
    NSArray *btnList = @[@"打开动态详情", @"加入游戏", @"加入群组"];
    UITextField *textField = nil;
    UIButton *clickBtn = nil;
    for (int i = 0; i < btnList.count; i++) {
        textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 20 + 120 * i, Screen_Width - 30, 40)];
        //textField.delegate = self;
        textField.tag = 10 + i;
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        [self.view addSubview:textField];
        
        clickBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        clickBtn.frame = CGRectMake(15, textField.bottom + 10, Screen_Width - 30, 40);
        [clickBtn setTitle:btnList[i] forState:UIControlStateNormal];
        clickBtn.tag = 100 + i;
        [clickBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:clickBtn];
    }
}

- (void)clickAction:(UIButton *)btn
{
    [self.view endEditing:YES];
    NSString *urlString = nil;
    UITextField *textField = [self.view viewWithTag:btn.tag - 90];
    if (textField.text.length == 0) {
        return;
    }
    if (btn.tag == 100) {
        NSString *circleId = textField.text;
        urlString = FormatString(@"mwapp://circleDetail?circleId=%@", circleId);//@"742"
    }
    else if (btn.tag == 101) {
        NSString *roomID = textField.text;
        NSString *gameID = @"16";
        NSString *uid = @"1011";
        NSString *nickname = @"";
        NSString *headimgurl = @"https://thirdqq.qlogo.cn/g?b=oidb&k=2SkbXYvuB5rpyjgj9kzrwQ&s=100";
        urlString = FormatString(@"mwapp://gameInvite?roomID=%@&gameID=%@&uid=%@&nickname=%@&headimgurl=%@", roomID, gameID, uid, nickname, headimgurl);
    }
    else if (btn.tag == 102) {
        
    }
    if (urlString) {
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    }
    
}

@end
