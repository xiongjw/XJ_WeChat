//
//  XJAllPickerVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJAllPickerVC.h"

#import "XJPickerUtil.h"
#import "XJPickerCell.h"

#import "XJPickerView.h"

@interface XJAllPickerVC ()

@end

@implementation XJAllPickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showBackBtn:YES withTitle:@"选择器"];
    
    [self.mTableView registerClass:[XJPickerCell class] forCellReuseIdentifier:@"XJPickerCell"];
    self.mutArray = [XJPickerUtil pickerPageData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.mutArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XJPickerModel *model = self.mutArray[indexPath.row];
    XJPickerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJPickerCell" forIndexPath:indexPath];
    cell.model = model;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 46;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    __block XJPickerModel *pickerModel = self.mutArray[indexPath.row];
    MJWeakSelf
    [XJPickerView showWithModel:pickerModel selectBlock:^(NSArray *items) {
        if (pickerModel.pickerType == XJPicker_DataTwo || pickerModel.pickerType == XJPicker_DataThree) {
            for (int i = 0; i < items.count; i++) {
                [pickerModel.valueList replaceObjectAtIndex:i withObject:items[i][pickerModel.codeKey]];
                [pickerModel.showValueList replaceObjectAtIndex:i withObject:items[i][pickerModel.nameKey]];
            }
        }
        pickerModel.value = [self getAppendStr:items key:pickerModel.codeKey];
        pickerModel.showValue = [self getAppendStr:items key:pickerModel.nameKey];
        [weakSelf reloadRowWithIndexPath:indexPath];
    }];
}

- (NSString *)getAppendStr:(NSArray *)items key:(NSString *)key
{
    if (items.count == 1) {
        return items[0][key];
    }
    NSMutableString *string = [[NSMutableString alloc] init];
    for (int i = 0; i < items.count; i++) {
        if (i == items.count - 1) [string appendFormat:@"%@",items[i][key]];
        // 这里该怎么连接，看产品需求，暂时以“-”处理
        else [string appendFormat:@"%@ ",items[i][key]];
    }
    return [NSString stringWithString:string];
}

@end
