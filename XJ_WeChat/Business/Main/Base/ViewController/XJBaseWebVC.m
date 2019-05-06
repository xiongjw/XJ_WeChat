//
//  XJBaseWebVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJBaseWebVC.h"

@interface XJBaseWebVC () <UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation XJBaseWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showBackBtn:YES withTitle:@"web跳转"];
    
    [self.view addSubview:self.webView];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JumpToCircleDetail.html" ofType:nil];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
}

-(UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - NavHeight)];
        _webView.delegate = self;
        _webView.backgroundColor = [UIColor bgColor];
    }
    return _webView;
}


- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType
{
    
    if(navigationType == UIWebViewNavigationTypeLinkClicked ) {
        
        NSURL *requestURL =[request URL];
        //NSString *requestString = [[request URL] absoluteString];
        NSString *str = [requestURL scheme];
        
        if ([str isEqualToString:@"http"] || [str isEqualToString:@"https"]) {
            //return NO;
        }
    }
    else if (navigationType == UIWebViewNavigationTypeOther) {
        
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"网页加载失败...:%@,code:%zd",[error domain],error.code);
}

@end
