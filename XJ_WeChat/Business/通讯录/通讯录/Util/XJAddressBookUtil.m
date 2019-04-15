//
//  XJAddressBookUtil.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJAddressBookUtil.h"

#import "XJAddressBookModel.h"

@implementation XJAddressBookUtil

+ (NSMutableArray *)demoData
{
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSArray *names = @[
                       @"刘诗博",
                       @"刘品",
                       @"孙雪梅",@"黎敏",
                       @"雷思思",@"吴术旺",@"熊继伟",@"杨婉秋",
                       @"周炎",@"杨凡",@"肖剑聪",@"余文思",
                       @"王锋",@"黄龙",@"卢植",@"周腾",
                       @"刘恋",
                       @"程煜",@"李冲",@"张安杰",@"陈皓",@"董撇",@"费群",@"周龙",
                       @"伍小芹",@"贾志",@"李雪",
                       @"刘鸿铨",@"高蝶",@"朱雨萌",@"李鹏城",@"蒋梦",@"付巧林",@"袁文杰",@"方琳菡",
                       @"张康康",@"刘颖",@"刘橙",@"胡冲",@"任淦群",
                       @"王霖",@"邬林森"];
    for (int i = 0; i < names.count; i++) {
        XJAddressBookModel *model = [[XJAddressBookModel alloc] init];
        model.uid = @"";
        model.name = names[i];
        if (i % 9 == 0) {
            model.headImageUrl = @"https://img4.duitang.com/uploads/item/201507/11/20150711193532_E2zF8.thumb.700_0.jpeg";
        }
        else if (i % 9 == 1) {
            model.headImageUrl = @"http://img0.imgtn.bdimg.com/it/u=3597064406,4175245334&fm=26&gp=0.jpg";
        }
        else if (i % 9 == 2) {
            model.headImageUrl = @"http://img0.imgtn.bdimg.com/it/u=289689127,489314165&fm=26&gp=0.jpg";
        }
        else if (i % 9 == 3) {
            model.headImageUrl = @"http://img1.imgtn.bdimg.com/it/u=1152076356,451506265&fm=26&gp=0.jpg";
        }
        else if (i % 9 == 4) {
            model.headImageUrl = @"http://img1.touxiang.cn/uploads/20121101/01-062532_365.jpg";
        }
        else if (i % 9 == 5) {
            model.headImageUrl = @"http://img0.imgtn.bdimg.com/it/u=2680457105,3319046135&fm=26&gp=0.jpg";
        }
        else if (i % 9 == 6) {
            model.headImageUrl = @"http://img5.imgtn.bdimg.com/it/u=1049733067,1194234148&fm=26&gp=0.jpg";
        }
        else if (i % 9 == 7) {
            model.headImageUrl = @"http://img4.imgtn.bdimg.com/it/u=1928060807,3044989527&fm=26&gp=0.jpg";
        }
        else if (i % 9 == 8) {
            model.headImageUrl = @"http://img1.imgtn.bdimg.com/it/u=2137258058,407864327&fm=26&gp=0.jpg";
        }
        [list addObject:model];
    }
    return list;
}

@end
