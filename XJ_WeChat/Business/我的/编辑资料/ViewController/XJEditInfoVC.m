//
//  XJEditInfoVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJEditInfoVC.h"



@interface XJEditInfoVC ()

@end

@implementation XJEditInfoVC

/// header是否需要悬停
//-(UITableViewStyle)tableViewStyle
//{
//    return UITableViewStyleGrouped;
//}

- (void)requestWithRefresh:(BOOL)refresh
{
    [super requestWithRefresh:refresh];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showBackBtn:YES withTitle:@"编辑个人资料"];
    
    [self requestWithRefresh:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.mutArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    XJHeadModel *headModel = self.mutArray[section];
    return section == 0 ? headModel.dataSource.count : (headModel.isOpen ? headModel.dataSource.count : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XJEditInfoModel *model = ((XJHeadModel *)self.mutArray[indexPath.section]).dataSource[indexPath.row];
    if ([@"head" isEqualToString:model.code]) {
        XJEditHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJEditHeadCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    else if ([@"empty" isEqualToString:model.code]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJEditEmptyCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor bgColor];
        cell.backgroundView = nil;
        return cell;
    }
    else if ([@"nickname" isEqualToString:model.code]) {
        XJEditFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJEditFieldCell" forIndexPath:indexPath];
        cell.model = model;
        
        __block XJEditInfoModel *blockModel = model;
        cell.textFieldShouldReturnBlock = ^(NSString *text) {
            blockModel.value = blockModel.showValue = text;
        };
        return cell;
    }
    else if ([@"id" isEqualToString:model.code] ||
             [@"sex" isEqualToString:model.code] ||
             [@"age" isEqualToString:model.code] ||
             [@"area" isEqualToString:model.code] ||
             [@"sign" isEqualToString:model.code] ||
             
             [@"schoolAll" isEqualToString:model.code] ||
             [@"in_school" isEqualToString:model.code] ||
             [@"industry" isEqualToString:model.code] ||
             [@"occupation" isEqualToString:model.code] ||
             
             [@"emotion" isEqualToString:model.code] ||
             [@"question" isEqualToString:model.code]) {
        XJEditLbCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJEditLbCell" forIndexPath:indexPath];
        cell.model = model;
        cell.sepLine.hidden = NO;
        if ([@"id" isEqualToString:model.code] ||
            [@"area" isEqualToString:model.code] ||
            [@"occupation" isEqualToString:model.code] ||
            [@"question" isEqualToString:model.code]) {
            cell.sepLine.hidden = YES;
        }
        return cell;
    }
    else if ([@"PhotoWall" isEqualToString:model.code]) {
        XJEditImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJEditImageCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJEditEmptyCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self heightForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self didSelectRowAtIndexPath:indexPath];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    return [self viewForHeaderInSection:section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 74;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

@end
