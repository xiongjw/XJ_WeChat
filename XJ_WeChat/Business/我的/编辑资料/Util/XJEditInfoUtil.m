//
//  XJEditInfoUtil.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJEditInfoUtil.h"

#import "XJHeadModel.h"
#import "XJEditInfoModel.h"

@implementation XJEditInfoUtil

+ (NSMutableArray *)editPageData
{
    NSMutableArray *pageList = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++)
    {
        XJHeadModel *headModel = [[XJHeadModel alloc] init];
        headModel.isOpen = NO;
        if (i == 0) {
            headModel.code = @"baseData";
            headModel.title = @"基本资料";
            headModel.desc = @"资料填写详细，匹配约准确哟";
            
            NSArray *codes = @[@"head",@"empty",@"nickname",@"id",@"empty",@"sex",@"age",@"area",@"empty",@"sign",@"PhotoWall",@"empty"];
            NSArray *titles = @[@"头像",@"empty",@"昵称",@"陌玩号",@"empty",@"性别",@"年龄/星座",@"居住地区",@"empty",@"个性签名",@"照片墙",@"empty"];
            NSArray *placeholders = @[@"",@"empty",@"取个好听的名字吧",@"",@"empty",@"",@"",@"",@"empty",@"请设置",@"发几张美照吧",@"empty"];
            NSMutableArray *sectionList = [[NSMutableArray alloc] init];
            for (int i = 0; i < codes.count; i++) {
                XJEditInfoModel *model = [[XJEditInfoModel alloc] init];
                model.code = codes[i];
                model.title = titles[i];
                model.value = @"";
                model.showValue = @"";
                model.placeholder = placeholders[i];
                
                if ([@"id" isEqualToString:model.code]) {
                    model.canNotClick = YES;
                }
                if ([@"sex" isEqualToString:model.code]) {
                    model.dataList = @[
                                       @{@"name":@"男",@"code":@"1"},
                                       @{@"name":@"女",@"code":@"2"},
                                       @{@"name":@"取消",@"code":@"cancel"},
                                       ];
                }
                [sectionList addObject:model];
            }
            headModel.dataSource = sectionList.mutableCopy;
        }
        else if (i == 1) {
            headModel.code = @"personalData";
            headModel.title = @"个人资料";
            headModel.desc = @"完善个人信息，这里都是心动值哦";
            headModel.canClick = YES;
            
            NSArray *codes = @[@"schoolAll",@"in_school",@"industry",@"occupation",@"empty"];
            NSArray *titles = @[@"学校",@"在校/已毕业",@"行业",@"职业",@"empty"];
            NSArray *placeholders = @[@"下一秒匹配到同校的TA",@"请选择",@"请选择",@"请选择",@"empty"];
            NSMutableArray *sectionList = [[NSMutableArray alloc] init];
            for (int i = 0; i < codes.count; i++) {
                XJEditInfoModel *model = [[XJEditInfoModel alloc] init];
                model.code = codes[i];
                model.title = titles[i];
                if ([@"industry" isEqualToString:model.code] || [@"occupation" isEqualToString:model.code]) {
                    model.titleColor = [UIColor descColor];
                    model.canNotClick = YES;
                }
                model.value = @"";
                model.showValue = @"";
                model.placeholder = placeholders[i];
                if ([@"schoolAll" isEqualToString:model.code]) {
                    model.placeholderColor = [UIColor themeColor];
                }
                
                if ([@"in_school" isEqualToString:model.code]) {
                    model.dataList = @[
                                       @{@"name":@"在校",@"code":@"1"},
                                       @{@"name":@"已毕业",@"code":@"2"},
                                       @{@"name":@"取消",@"code":@"cancel"},
                                       ];
                }
                [sectionList addObject:model];
            }
            headModel.dataSource = sectionList.mutableCopy;
        }
        else if (i == 2) {
            headModel.code = @"personalityData";
            headModel.title = @"个性化资料";
            headModel.desc = @"* 关于我的几件事（限为3个，可随时更换哦）";
            headModel.canClick = YES;
            
            NSArray *codes = @[@"emotion",@"question"];
            NSArray *titles = @[@"情感状态",@"你问我答"];
            NSArray *placeholders = @[@"请选择",@"请设置问题"];
            NSMutableArray *sectionList = [[NSMutableArray alloc] init];
            for (int i = 0; i < codes.count; i++) {
                XJEditInfoModel *model = [[XJEditInfoModel alloc] init];
                model.code = codes[i];
                model.title = titles[i];
                model.value = @"";
                model.showValue = @"";
                model.placeholder = placeholders[i];
                if ([@"question" isEqualToString:model.code]) {
                    model.placeholderColor = [UIColor themeColor];
                }
                
                if ([@"emotion" isEqualToString:model.code]) {
                    model.dataList = @[
                                       @{@"name":@"保密",@"code":@"0"},
                                       @{@"name":@"单身",@"code":@"1"},
                                       @{@"name":@"恋爱",@"code":@"2"},
                                       @{@"name":@"已婚",@"code":@"3"},
                                       @{@"name":@"取消",@"code":@"cancel"},
                                       ];
                }
                [sectionList addObject:model];
            }
            headModel.dataSource = sectionList.mutableCopy;
        }
        [pageList addObject:headModel];
    }
    return pageList;
}

+ (NSMutableArray *)schoolPageData
{
    NSMutableArray *pageList = [[NSMutableArray alloc] init];
    NSArray *codes = @[@"school",@"major",@"grade"];
    NSArray *titles = @[@"学校",@"专业",@"入学年份"];
    NSArray *placeholders = @[@"请选择",@"请选择",@"请选择"];
    
    for (int i = 0; i < codes.count; i++) {
        XJEditInfoModel *model = [[XJEditInfoModel alloc] init];
        model.code = codes[i];
        model.title = titles[i];
        model.value = @"";
        model.showValue = @"";
        model.placeholder = placeholders[i];
        [pageList addObject:model];
    }
    return pageList;
}

@end
