//
//  XJTextField.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XJInputUtil.h"

@interface XJTextField : UITextField

/// 最大可输入数量，默认无限
@property (nonatomic,assign) NSInteger maxLength;

/// 统计类型
@property (nonatomic,assign) XJStatisticsType statisticsType;

@end
