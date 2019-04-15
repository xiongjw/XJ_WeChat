//
//  XJChatVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJChatVC.h"

#import "XJMessageTextCell.h"
#import "XJMessageImageCell.h"
#import "XJMessageVoiceCell.h"
#import "XJMessageVideoCell.h"
#import "XJMessageLocationCell.h"
#import "XJMessageTipsCell.h"

@interface XJChatVC ()

@end

@implementation XJChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
    
    self.mutArray = [XJChatUtil demoData];
}

- (void)setUpUI
{
    //self.mTableView.height = Screen_Height - NavHeight - 44;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.mTableView registerClass:[XJMessageTextCell class] forCellReuseIdentifier:@"XJMessageTextCell"];
    [self.mTableView registerClass:[XJMessageImageCell class] forCellReuseIdentifier:@"XJMessageImageCell"];
    [self.mTableView registerClass:[XJMessageVoiceCell class] forCellReuseIdentifier:@"XJMessageVoiceCell"];
    [self.mTableView registerClass:[XJMessageVideoCell class] forCellReuseIdentifier:@"XJMessageVideoCell"];
    [self.mTableView registerClass:[XJMessageLocationCell class] forCellReuseIdentifier:@"XJMessageLocationCell"];
    [self.mTableView registerClass:[XJMessageTipsCell class] forCellReuseIdentifier:@"XJMessageTipsCell"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mutArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XJMessageModel *model = self.mutArray[indexPath.row];
    if (model.cellType == XJMessageCellType_Text) {
        XJMessageTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJMessageTextCell" forIndexPath:indexPath];
        cell.model = self.mutArray[indexPath.row];
        return cell;
    }
    else if (model.cellType == XJMessageCellType_Image) {
        XJMessageImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJMessageImageCell" forIndexPath:indexPath];
        cell.model = self.mutArray[indexPath.row];
        return cell;
    }
    else if (model.cellType == XJMessageCellType_Voice) {
        XJMessageVoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJMessageVoiceCell" forIndexPath:indexPath];
        cell.model = self.mutArray[indexPath.row];
        return cell;
    }
    else if (model.cellType == XJMessageCellType_Video) {
        XJMessageVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJMessageVideoCell" forIndexPath:indexPath];
        cell.model = self.mutArray[indexPath.row];
        return cell;
    }
    else if (model.cellType == XJMessageCellType_Location) {
        XJMessageLocationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJMessageLocationCell" forIndexPath:indexPath];
        cell.model = self.mutArray[indexPath.row];
        return cell;
    }
    else {
        XJMessageTipsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJMessageTipsCell" forIndexPath:indexPath];
        cell.model = self.mutArray[indexPath.row];
        return cell;
    }
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [XJMessageBaseCell getCellHeight:self.mutArray[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
