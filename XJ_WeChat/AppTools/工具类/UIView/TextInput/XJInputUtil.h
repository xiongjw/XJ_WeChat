//
//  XJInputUtil.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XJStatisticsType) {
    /// 正常统计，全部算1
    XJStatisticsNormal = 0,
    /// 特殊统计，字母0.5，汉字和表情1
    XJStatisticsSpecial
};

@interface XJInputUtil : NSObject

+ (CGFloat)getStringRealLengthWithText:(NSString *)text
                        statisticsType:(XJStatisticsType)statisticsType;

+ (NSInteger)getStringShowLengthWithText:(NSString *)text
                          statisticsType:(XJStatisticsType)statisticsType;

+ (NSMutableAttributedString *)getLbAttributedWithText:(NSString *)text
                                                length:(NSInteger)length
                                                 color:(UIColor *)color;

@end
