//
//  XJEditSelectDataVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJEditSelectDataVC.h"

@interface XJEditSelectDataVC ()

@end

@implementation XJEditSelectDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *navTitle = @"";
    
    if (self.selectType == XJSelect_School || self.selectType == XJSelect_Major) {
        // 创建搜索
    }
    else if (self.selectType == XJSelect_Industry) navTitle = @"行业";
    else if (self.selectType == XJSelect_Occupation) navTitle = @"职业";
    
    [self showBackBtn:YES withTitle:navTitle];
    
    [self.mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    for (int i = 0; i < 20; i++) {
        if (self.selectType == XJSelect_School) {
            [self.mutArray addObject:@{@"id":@"1",@"name":@"武汉纺织大学"}];
        }
        else if (self.selectType == XJSelect_Major) {
            [self.mutArray addObject:@{@"id":@"1",@"name":@"软件工程"}];
        }
        else if (self.selectType == XJSelect_Industry) {
            [self.mutArray addObject:@{@"id":@"1",@"name":@"IT/计算机"}];
        }
        else if (self.selectType == XJSelect_Occupation) {
            [self.mutArray addObject:@{@"id":@"1",@"name":@"iOS开发工程师"}];
        }
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mutArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.mutArray[indexPath.row][@"name"];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 46;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectDataBlock) {
        self.selectDataBlock(self.mutArray[indexPath.row]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
