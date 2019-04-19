//
//  XJPickerUtil.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJPickerUtil.h"

#import "XJPickerModel.h"

@implementation XJPickerUtil

+ (NSMutableArray *)pickerPageData
{
    NSMutableArray *pageList = [[NSMutableArray alloc] init];
    NSArray *codes = @[@"dataOne",@"dataTwo",@"dataTwoRelate",@"dataThree",@"dataThreeRelate",@"dateTime",@"date",@"time",@"countDown"];
    NSArray *titles = @[@"单列数据选择",@"两列数据选择",@"两列数据选择关联",@"三列数据选择",@"三列数据选择关联",@"年月日时分",@"年月日",@"时分",@"倒计时"];
    
    for (int i = 0; i < codes.count; i++) {
        XJPickerModel *model = [[XJPickerModel alloc] init];
        model.code = codes[i];
        model.title = titles[i];
        if ([@"dataOne" isEqualToString:model.code]) {
            model.pickerType = XJPicker_DataOne;
            model.dataSource = @[
                                 @{@"code":@"1",@"name":@"小A"},
                                 @{@"code":@"2",@"name":@"小B"},
                                 @{@"code":@"3",@"name":@"小C"},
                                 @{@"code":@"4",@"name":@"小D"},
                                 @{@"code":@"5",@"name":@"小E"},
                                 @{@"code":@"6",@"name":@"小F"},
                                 @{@"code":@"7",@"name":@"小G"},
                                 @{@"code":@"8",@"name":@"小H"},
                                 ];
        }
        else if ([@"dataTwo" isEqualToString:model.code]) {
            model.pickerType = XJPicker_DataTwo;
            model.dataSource = [XJAppUtil readRegionDataWithKey:@"province"];
        }
        else if ([@"dataTwoRelate" isEqualToString:model.code]) {
            model.pickerType = XJPicker_DataTwo;
            model.dataSource = [XJAppUtil readRegionDataWithKey:@"province"];
        }
        else if ([@"dataThree" isEqualToString:model.code]) {
            model.pickerType = XJPicker_DataThree;
            model.dataSource = [XJAppUtil readRegionDataWithKey:@"province"];
        }
        else if ([@"dataThreeRelate" isEqualToString:model.code]) {
            model.pickerType = XJPicker_DataThree;
            model.dataSource = [XJAppUtil readRegionDataWithKey:@"province"];
        }
        else if ([@"dateTime" isEqualToString:model.code]) {
            model.pickerType = XJPicker_DateTime;
        }
        else if ([@"date" isEqualToString:model.code]) {
            model.pickerType = XJPicker_Date;
        }
        else if ([@"time" isEqualToString:model.code]) {
            model.pickerType = XJPicker_Time;
        }
        else if ([@"countDown" isEqualToString:model.code]) {
            model.pickerType = XJPicker_CountDown;
        }
        
        [pageList addObject:model];
    }
    return pageList;
}

@end
