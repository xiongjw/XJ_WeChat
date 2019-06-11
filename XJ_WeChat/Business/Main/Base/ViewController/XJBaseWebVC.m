//
//  XJBaseWebVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJBaseWebVC.h"

#import <WebKit/WKWebView.h>
#import <WebKit/WebKit.h>


static void *WkWebBrowserContext = &WkWebBrowserContext;

@interface XJBaseWebVC () <WKNavigationDelegate, UINavigationControllerDelegate>
{
    BOOL _isFirst;
    NSString *_navTitle;
}

@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) UIProgressView *progressView;

//返回按钮
@property (nonatomic,strong) UIBarButtonItem *backItem;
//关闭按钮
@property (nonatomic,strong) UIBarButtonItem *closeItem;

@property (nonatomic,assign) WKWebLoadType loadType;

@property (nonatomic,  copy) NSString *webUrlString;
@property (nonatomic,  copy) NSString *fileName;
@property (nonatomic,  copy) NSString *fileType;
@property (nonatomic,  copy) NSString *htmlString;

@end

@implementation XJBaseWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = self.backItem;
    
    _navTitle = self.navigationItem.title;
    
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    
    _isFirst = NO;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!_isFirst) {
        _isFirst = YES;
        [self beginLoadWebView];
    }
}

- (void)beginLoadWebView
{
    switch (self.loadType) {
        case LoadWebUrlString:
        {
            NSURL *url = [NSURL URLWithString:self.webUrlString];
            NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
            [self.webView loadRequest:request];
            break;
        }
        case LoadLocalFile:
        {
            NSString *path = [[NSBundle mainBundle] pathForResource:self.fileName ofType:self.fileType];
            NSString *html = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            [self.webView loadHTMLString:html baseURL:[[NSBundle mainBundle] bundleURL]];
            /*
             NSURL *url = [[NSBundle mainBundle] URLForResource:MWFormatString(@"%@.%@", self.fileName, self.fileType) withExtension:nil];
             NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
             [self.webView loadRequest:request];
             */
            break;
        }
        case LoadHtmlString:
        {
            [self.webView loadHTMLString:self.htmlString baseURL:nil];
            break;
        }
        default:
            break;
    }
}

#pragma mark- public method
/// 加载网络url
- (void)loadWebUrl:(NSString *)webUrlString
{
    self.loadType = LoadWebUrlString;
    self.webUrlString = [XJRequestEngin getCompleteUrl:webUrlString];
}

/// 加载本地html等其它文件
- (void)loadLocalHtml:(NSString *)htmlName
{
    [self loadLocalFile:htmlName fileType:@"html"];
}

- (void)loadLocalFile:(NSString *)FileName fileType:(NSString *)fileType
{
    self.loadType = LoadLocalFile;
    self.fileName = FileName;
    self.fileType = fileType;
}

/// 加载字符串
- (void)loadHtmlString:(NSString *)htmlString
{
    self.loadType = LoadHtmlString;
    self.htmlString = htmlString;
}

#pragma mark- 懒加载UI
-(WKWebView *)webView
{
    if (!_webView) {
        //设置网页的配置文件
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        //允许视频播放
        configuration.allowsAirPlayForMediaPlayback = YES;
        // 允许在线播放
        configuration.allowsInlineMediaPlayback = YES;
        // 允许可以与网页交互，选择视图
        configuration.selectionGranularity = YES;
        // web内容处理池
        configuration.processPool = [[WKProcessPool alloc] init];
        // 是否支持记忆读取
        configuration.suppressesIncrementalRendering = YES;
        /*
         //自定义配置,一般用于 js调用oc方法(OC拦截URL中的数据做自定义操作)
         WKUserContentController *uc = [[WKUserContentController alloc] init];
         // 添加消息处理，注意：self指代的对象需要遵守WKScriptMessageHandler协议，结束时需要移除
         //[uc addScriptMessageHandler:self name:@""];
         // 允许用户更改网页的设置
         configuration.userContentController = uc;
         */
        
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
        _webView.backgroundColor = [UIColor bgColor];
        _webView.navigationDelegate = self;
        //_webView.UIDelegate = self;
        
        // kvo 添加进度监控
        [_webView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:0 context:WkWebBrowserContext];
        // 开启手势触摸
        _webView.allowsBackForwardNavigationGestures = YES;
        // 适应你设定的尺寸
        [_webView sizeToFit];
    }
    return _webView;
}

-(UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.frame = CGRectMake(0, 0, self.view.width, 4);
        _progressView.trackTintColor = [UIColor whiteColor];
        _progressView.progressTintColor = [UIColor themeColor];
    }
    return _progressView;
}

-(UIBarButtonItem *)backItem
{
    if (!_backItem) {
        MJWeakSelf
        _backItem = [ZZJBlockBarButtonItem blockedBarButtonItemWithImage:[UIImage imageNamed:@"nav_back"] eventHandler:^{
            [weakSelf backAction];
        }];
    }
    return _backItem;
}

-(UIBarButtonItem *)closeItem
{
    if (!_closeItem) {
        MJWeakSelf
        _closeItem = [ZZJBlockBarButtonItem blockedBarButtonItemWithImage:[UIImage imageNamed:@"nav_close"] eventHandler:^{
            [weakSelf closeAction];
        }];
    }
    return _closeItem;
}

- (void)backAction
{
    //if (self.webView.goBack) [self.webView goBack];
    if (self.webView.canGoBack) [self.webView goBack];
    else [self closeAction];
}

- (void)closeAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateLeftItems
{
    if ([self.webView canGoBack]) {
        self.navigationItem.leftBarButtonItems = @[self.backItem, self.closeItem];
    }
    else {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationItem.leftBarButtonItem = self.backItem;
    }
}

#pragma mark- WKNavigationDelegate
// 这个是网页加载完成，导航的变化
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    if (!_navTitle) self.navigationItem.title = self.webView.title;
    //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

//开始加载
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    //开始加载的时候，让加载进度条显示
    self.progressView.hidden = NO;
}

//内容返回时调用
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{}

//服务器请求跳转的时候调用
-(void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{}

//服务器开始请求的时候调用
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    if (!_navTitle) self.navigationItem.title = self.webView.title;
    [self updateLeftItems];
    decisionHandler(WKNavigationActionPolicyAllow);
}

// 内容加载失败时候调用
-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"页面加载超时");
}

//跳转失败的时候调用
-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{}

//进度条
-(void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{}


#pragma mark- KVO监听进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))] && object == self.webView) {
        self.progressView.alpha = 1.0;
        BOOL animated = self.webView.estimatedProgress > self.progressView.progress;
        [self.progressView setProgress:self.webView.estimatedProgress animated:animated];
        // Once complete, fade out UIProgressView
        if (self.webView.estimatedProgress >= 1.0) {
            [UIView animateWithDuration:.3 delay:.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.progressView.alpha = 0.0;
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0 animated:NO];
            }];
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

//注意，观察的移除
-(void)dealloc
{
    [self.webView removeObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
}

@end
