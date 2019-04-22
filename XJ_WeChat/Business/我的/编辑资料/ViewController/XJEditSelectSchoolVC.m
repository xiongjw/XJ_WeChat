//
//  XJEditSelectSchoolVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJEditSelectSchoolVC.h"

#import "XJEditInfoUtil.h"

#import "XJEditLbCell.h"

#import "XJEditSelectDataVC.h"

@interface XJEditSelectSchoolVC ()

@end

@implementation XJEditSelectSchoolVC

- (void)backAction
{
    XJEditInfoModel *model = [self.mutArray firstObject];
    if (self.selectDataBlock) {
        self.selectDataBlock(@{@"id":model.value,@"name":model.showValue});
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showBackBtn:YES withTitle:@"学校"];
    self.disablePopGesture = YES;
    
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mTableView registerClass:[XJEditLbCell class] forCellReuseIdentifier:@"XJEditLbCell"];
    self.mutArray = [XJEditInfoUtil schoolPageData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.mutArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XJEditInfoModel *model = self.mutArray[indexPath.row];
    XJEditLbCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJEditLbCell" forIndexPath:indexPath];
    cell.model = model;
    cell.sepLine.hidden = NO;

    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 46;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    __block XJEditInfoModel *model = self.mutArray[indexPath.row];
    MJWeakSelf
    if ([@"school" isEqualToString:model.code] || [@"major" isEqualToString:model.code]) {
        if ([@"major" isEqualToString:model.code]) {
            XJEditInfoModel *school = [self modelWithCode:@"school"];
            if (school.showValue.length == 0) {
                [XJHud showInfoWithStatus:@"请选择学校"];
                return;
            }
        }
        XJEditSelectDataVC *vc = [[XJEditSelectDataVC alloc] init];
        if ([@"school" isEqualToString:model.code]) vc.selectType = XJSelect_School;
        else vc.selectType = XJSelect_Major;
        vc.selectDataBlock = ^(NSDictionary *item) {
            model.value = item[@"id"];
            model.showValue = item[@"name"];
            [weakSelf reloadRowWithIndexPath:indexPath];
        };
        XJNavigationController *nav = [[XJNavigationController alloc] initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:nil];
    }
    else if ([@"grade" isEqualToString:model.code]) {
        XJEditInfoModel *school = [self modelWithCode:@"school"];
        if (school.showValue.length == 0) {
            [XJHud showInfoWithStatus:@"请选择学校"];
            return;
        }
    }
}

- (XJEditInfoModel *)modelWithCode:(NSString *)code
{
    XJEditInfoModel *result = nil;
    for (XJEditInfoModel *model in self.mutArray) {
        if ([code isEqualToString:model.code]) {
            result = model;
            break;
        }
    }
    return result;
}

@end
