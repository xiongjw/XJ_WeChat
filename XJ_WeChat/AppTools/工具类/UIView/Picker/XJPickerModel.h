//
//  XJPickerModel.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XJPickerType) {
    /// eg：数据一级模式，2018级
    XJPicker_DataOne = 0,
    /// eg：地区二级模式，省市
    XJPicker_DataTwo = 1,
    /// eg：地区三级模式，省市区
    XJPicker_DataThree = 2,
    /// eg：时间选择，年月日，时分
    XJPicker_DateTime = 3,
    /// eg：时间选择，年月日
    XJPicker_Date = 4,
    /// eg：时间选择，只有时间
    XJPicker_Time = 5,
    /// eg：时间选择，选择小时和分钟
    XJPicker_CountDown
};

@interface XJPickerModel : NSObject

@property (nonatomic,  copy) NSString *code;
@property (nonatomic,  copy) NSString *title;

@property (nonatomic,assign) XJPickerType pickerType;
@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,  copy) NSString *value;
/// 为多级数据选择器准备
@property (nonatomic,strong) NSMutableArray *valueList;
@property (nonatomic,  copy) NSString *showValue;
@property (nonatomic,strong) NSMutableArray *showValueList;

/// 默认code（如服务器返回的item，学校为school_id、school_name，此处赋此值）
@property (nonatomic,  copy) NSString *codeKey;
/// 默认name
@property (nonatomic,  copy) NSString *nameKey;
/**
 时间选择器
 */
@property (nonatomic,assign) BOOL needMin;
/// 默认今天
@property (nonatomic,strong) NSString *minValue;
@property (nonatomic,assign) BOOL needMax;
/// 默认今天
@property (nonatomic,strong) NSString *maxValue;


@property (nonatomic,  copy) NSString *placeholder;

@end
