//
//  XJGradualChangeWordVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJGradualChangeWordVC.h"

#import "XJFadeView.h"

@interface XJGradualChangeWordVC ()

@end

@implementation XJGradualChangeWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showBackBtn:YES withTitle:@"渐变文字"];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    XJFadeView *stringRightView = [[XJFadeView alloc] initWithFrame:CGRectMake(0, 40, Screen_Width, 40)];
    stringRightView.text = @"武汉水象科技有限公司";
    stringRightView.foreColor = [UIColor whiteColor];
    stringRightView.backColor = [UIColor redColor];
    stringRightView.font = [UIFont systemFontOfSize:24];
    stringRightView.alignment = NSTextAlignmentCenter;
    [stringRightView fadeType:XJFade_Normal fadeDirection:XJDirection_Right];
    [self.view addSubview:stringRightView];
    
    [stringRightView fadeWithDuration:2];
    
    XJFadeView *iphoneRightView = [[XJFadeView alloc] initWithFrame:CGRectMake(0, stringRightView.bottom + 40, Screen_Width, 40)];
    iphoneRightView.text = @"武汉水象科技有限公司";
    iphoneRightView.foreColor = [UIColor whiteColor];
    iphoneRightView.backColor = [UIColor redColor];
    iphoneRightView.font = [UIFont systemFontOfSize:24];
    iphoneRightView.alignment = NSTextAlignmentCenter;
    [iphoneRightView fadeType:XJFade_iPhone fadeDirection:XJDirection_Right];
    [self.view addSubview:iphoneRightView];
    
    [iphoneRightView fadeWithDuration:2];
    
    XJFadeView *stringDownView = [[XJFadeView alloc] initWithFrame:CGRectMake(100, iphoneRightView.bottom + 40, 40, 300)];
    stringDownView.text = @"武汉水象科技有限公司";
    stringDownView.foreColor = [UIColor whiteColor];
    stringDownView.backColor = [UIColor redColor];
    stringDownView.font = [UIFont systemFontOfSize:24];
    stringDownView.alignment = NSTextAlignmentCenter;
    [stringDownView fadeType:XJFade_Normal fadeDirection:XJDirection_Down];
    [self.view addSubview:stringDownView];
    
    [stringDownView fadeWithDuration:2];
    
    XJFadeView *iphoneDownView = [[XJFadeView alloc] initWithFrame:CGRectMake(stringDownView.right + 40, stringDownView.top, stringDownView.width, stringDownView.height)];
    iphoneDownView.text = @"武汉水象科技有限公司";
    iphoneDownView.foreColor = [UIColor whiteColor];
    iphoneDownView.backColor = [UIColor redColor];
    iphoneDownView.font = [UIFont systemFontOfSize:24];
    iphoneDownView.alignment = NSTextAlignmentCenter;
    [iphoneDownView fadeType:XJFade_iPhone fadeDirection:XJDirection_Down];
    [self.view addSubview:iphoneDownView];
    
    [iphoneDownView fadeWithDuration:2];
}

@end
