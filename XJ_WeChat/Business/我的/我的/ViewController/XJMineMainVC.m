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
#import "XJMaxLengthVC.h"
#import "XJPokerVC.h"
#import "XJGradualChangeWordVC.h"

@interface XJMineMainVC ()

@end

@implementation XJMineMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.array = @[@"编辑资料", @"选择器", @"Test换行", @"输入检测", @"跳转动态详情", @"斗地主", @"渐变文字"];
    
    NSArray *one = @[@"加",@"＋",@"+",@"➕"];
    //NSArray *two = @[@"微信",@"薇信",@"微",@"薇",@"WX",@"wx",@"VX",@"vx",@"v",@"V",@"WeChat",@"wechat",@"weixin"];
    NSArray *two = @[@"QQ",@"qq",@"q",@"Q",@"Qq",@"qQ",@"企鹅号",@"企鹅号码",@"扣扣",@"扣"];
    NSMutableString *result = [NSMutableString new];
    for (NSString *oneStr in one) {
        for (NSString *twoStr in two) {
            [result appendFormat:@"%@%@|",oneStr, twoStr];
        }
    }
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        XJEditInfoVC *vc = [[XJEditInfoVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1) {
        XJAllPickerVC *vc = [[XJAllPickerVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2) {
        MWTestTowLineVC *vc = [[MWTestTowLineVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 3) {
        XJMaxLengthVC *vc = [[XJMaxLengthVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 4) {
        /*
        XJBaseWebVC *vc = [[XJBaseWebVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
         */
        NSString *urlString = FormatString(@"mwAppJumpCircleDetail://jump?circleId=%@",@"742");
        NSURL *url = [NSURL URLWithString:urlString];
        
        //打开url
        [[UIApplication sharedApplication] openURL:url];
    }
    else if (indexPath.row == 5) {
        XJPokerVC *vc = [[XJPokerVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 6) {
        XJGradualChangeWordVC *vc = [[XJGradualChangeWordVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
