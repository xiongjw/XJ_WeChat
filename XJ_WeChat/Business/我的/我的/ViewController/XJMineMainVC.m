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

@interface XJMineMainVC ()

@end

@implementation XJMineMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.array = @[@"编辑资料", @"选择器", @"Test换行", @"输入检测", @"跳转动态详情"];
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
    
}

@end
