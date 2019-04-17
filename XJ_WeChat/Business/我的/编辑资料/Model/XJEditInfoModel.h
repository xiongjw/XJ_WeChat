//
//  XJEditInfoModel.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 每一行的数据源
 */
@interface XJEditInfoModel : NSObject

/// 服务器的key
@property (nonatomic,  copy) NSString *code;
/// cell类型，
//@property (nonatomic,  copy) NSString *cellType;

@property (nonatomic,assign) BOOL canNotClick;

@property (nonatomic,  copy) NSString *title;
@property (nonatomic,strong) UIColor *titleColor;

@property (nonatomic,  copy) NSString *value;
@property (nonatomic,  copy) NSString *otherValue;

@property (nonatomic,  copy) NSString *showValue;

@property (nonatomic,  copy) NSString *placeholder;
@property (nonatomic,strong) UIColor *placeholderColor;

@property (nonatomic,strong) NSArray *dataList;

@end
