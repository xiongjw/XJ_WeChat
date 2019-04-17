//
//  XJEditSelectDataVC.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XJSelectDataType) {
    XJSelect_School = 0,
    XJSelect_Major = 1,
    XJSelect_Industry = 2,
    XJSelect_Occupation
};

/**
 选择、搜索学校；选择专业；选择行业；选择职业
 */
@interface XJEditSelectDataVC : XJBaseTableVC


@property (nonatomic,assign) XJSelectDataType selectType;

@end
