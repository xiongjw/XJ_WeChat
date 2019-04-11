//
//  XJMessageMainVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJMessageMainVC.h"

#import "XJConversationCell.h"

#import "XJConversationModel.h"

#import "XJChatVC.h"

@interface XJMessageMainVC ()

@end

@implementation XJMessageMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mTableView.height = Screen_Height - NavHeight - TabBarHeight;
    [self.mTableView registerClass:[XJConversationCell class] forCellReuseIdentifier:@"XJConversationCell"];
    
    for (int i = 100; i > 0; i--) {
        XJConversationModel *model = [[XJConversationModel alloc] init];
        model.headImageUrl = @"https://img4.duitang.com/uploads/item/201507/11/20150711193532_E2zF8.thumb.700_0.jpeg";
        model.nickname = @"大熊、";
        //model.time =
        model.desc = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
        model.unReadNum = i;
        [self.mutArray addObject:model];
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
    
    XJConversationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJConversationCell" forIndexPath:indexPath];
    cell.model = self.mutArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    XJConversationModel *model = self.mutArray[indexPath.row];
    XJChatVC *vc = [[XJChatVC alloc] init];
    vc.navigationItem.title = model.nickname;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
