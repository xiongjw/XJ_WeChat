//
//  XJMineMainVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJMineMainVC.h"

#import "XJEditInfoVC.h"
#import "XJAllPickerVC.h"
#import "MWTestTowLineVC.h"
#import "XJTestInputVC.h"
#import "XJPokerVC.h"
#import "XJGradualChangeWordVC.h"
#import "XJTestQQPreviewVC.h"
#import "XJTestOpenUrlVC.h"
#import <KRVideoPlayerController.h>

@interface XJMineMainVC ()

@property (nonatomic,strong) KRVideoPlayerController *videoController;

@end

@implementation XJMineMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.array = @[
                   @{@"code":@"editInfo", @"name":@"编辑资料"},
                   @{@"code":@"picker", @"name":@"选择器"},
                   @{@"code":@"line", @"name":@"Test换行"},
                   @{@"code":@"inputCheck", @"name":@"输入检测"},
                   @{@"code":@"openUrl", @"name":@"测试打开第三方app"},
                   @{@"code":@"pocker", @"name":@"斗地主"},
                   @{@"code":@"gradualChange", @"name":@"渐变文字"},
                   @{@"code":@"qqPreview", @"name":@"QQ相册"},
                   @{@"code":@"webview", @"name":@"webview"},
                   @{@"code":@"vedio", @"name":@"视频播放器"},
                   ];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *data = self.array[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = data[@"name"];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *data = self.array[indexPath.row];
    NSString *code = data[@"code"];
    if ([@"editInfo" isEqualToString:code]) {
        XJEditInfoVC *vc = [[XJEditInfoVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([@"picker" isEqualToString:code]) {
        XJAllPickerVC *vc = [[XJAllPickerVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([@"line" isEqualToString:code]) {
        MWTestTowLineVC *vc = [[MWTestTowLineVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([@"inputCheck" isEqualToString:code]) {
        XJTestInputVC *vc = [[XJTestInputVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([@"openUrl" isEqualToString:code]) {
        XJTestOpenUrlVC *vc = [[XJTestOpenUrlVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([@"pocker" isEqualToString:code]) {
        XJPokerVC *vc = [[XJPokerVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([@"gradualChange" isEqualToString:code]) {
        XJGradualChangeWordVC *vc = [[XJGradualChangeWordVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([@"qqPreview" isEqualToString:code]) {
        XJTestQQPreviewVC *vc = [[XJTestQQPreviewVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([@"webview" isEqualToString:code]) {
        XJBaseWebVC *vc = [[XJBaseWebVC alloc] init];
        [vc loadWebUrl:@"https://www.baidu.com"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([@"vedio" isEqualToString:code]) {
        NSURL *localUrl = [[NSBundle mainBundle] URLForResource:@"douyin" withExtension:@"mp4"];
        self.videoController.contentURL = localUrl;
        
//        NSURL *remoteUrl = [NSURL URLWithString:@"http://v.douyin.com/hFHCev/"];
//        self.videoController.contentURL = remoteUrl;
        
        [self.videoController showInWindow];
    }
}

-(KRVideoPlayerController *)videoController
{
    if (!_videoController) {
        MJWeakSelf
        _videoController = [[KRVideoPlayerController alloc] initWithFrame:Screen_Frame];
        //_videoController = [[KRVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Width*(9.0/16.0))];
        _videoController.dimissCompleteBlock = ^{
            [weakSelf.videoController stop];
        };
    }
    return _videoController;
}

@end
