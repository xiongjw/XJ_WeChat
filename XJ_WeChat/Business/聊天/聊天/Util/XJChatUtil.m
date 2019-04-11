//
//  XJChatUtil.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJChatUtil.h"

@implementation XJChatUtil

+ (NSMutableArray *)chatDemoList
{
    NSMutableArray *list = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        XJMessageModel *model = [[XJMessageModel alloc] init];
        if (i % 2 == 0) {
            model.isSender = YES;
            model.headImageUrl = @"http://img0.imgtn.bdimg.com/it/u=3597064406,4175245334&fm=26&gp=0.jpg";
        }
        else {
            model.isSender = NO;
            model.headImageUrl = @"http://img0.imgtn.bdimg.com/it/u=289689127,489314165&fm=26&gp=0.jpg";
        }
        
        if (i == 0) {
            model.cellType = XJMessageCellType_Text;
            model.text = @"假如/爱情可以解释/誓言可以修改/假如/你我的相遇/可以重新安排/那么/生活就会比较容易";
            //model.text = @"生活就会比较容易";
        }
        else if (i == 1) {
            model.cellType = XJMessageCellType_Text;
            model.text = @"假如/有一天/我终于能将你忘记/然而/这不是 随便传说的故事/也不是明天才要 上演的戏剧/我无法找出原稿/然后将你 将你一笔抹去";
            //model.text = @"我终于能将你忘记";
        }
        else if (i == 2) {
            model.cellType = XJMessageCellType_Image;
            model.imageUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554972669011&di=df29b5e4296fe1af7ca17d0be8959dc5&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201408%2F27%2F20140827172303_zCWTv.jpeg";
        }
        else if (i == 3) {
            model.cellType = XJMessageCellType_Image;
            model.imageUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555574181&di=58f3420797a5be7f79be3a365cf27854&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201503%2F27%2F20150327223819_zm8Fr.jpeg";
        }
        else if (i == 4) {
            model.cellType = XJMessageCellType_Voice;
            model.voiceUrl = @"https://";
            model.duration = 10;
            model.voiceIsRead = YES;
        }
        else if (i == 5) {
            model.cellType = XJMessageCellType_Voice;
            model.voiceUrl = @"https://";
            model.duration = 20;
            model.voiceIsRead = NO;
        }
        else if (i == 6) {
            model.cellType = XJMessageCellType_Video;
            model.videoUrl = @"https://";
            model.duration = 3;
        }
        else if (i == 7) {
            model.cellType = XJMessageCellType_Video;
            model.videoUrl = @"https://";
            model.duration = 15;
        }
        else if (i == 8) {
            model.cellType = XJMessageCellType_Location;
            
            XJLocationModel *locationModel = [[XJLocationModel alloc] init];
            locationModel.name = @"当代光谷梦工厂";
            locationModel.address = @"湖北省武汉市洪山区光谷大道与三环线交汇处";
            model.locationModel = locationModel;
        }
        else if (i == 9) {
            model.cellType = XJMessageCellType_Location;
            
            XJLocationModel *locationModel = [[XJLocationModel alloc] init];
            locationModel.name = @"武汉华夏理工学院";
            locationModel.address = @"湖北省武汉市洪山区东湖新技术开发区关山大道589";
            model.locationModel = locationModel;
        }
        [list addObject:model];
    }
    XJMessageModel *model = [[XJMessageModel alloc] init];
    model.cellType = XJMessageCellType_Tips;
    model.tipStr = @"14:32";
    [list insertObject:model atIndex:0];
    
    return list;
}

+ (CGSize)getLabelSize:(NSString *)text font:(UIFont *)font width:(CGFloat)width
{
    CGSize retSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                        options:(NSStringDrawingTruncatesLastVisibleLine |
                                                 NSStringDrawingUsesLineFragmentOrigin |
                                                 NSStringDrawingUsesFontLeading)
                                     attributes:@{NSFontAttributeName: font}
                                        context:nil].size;
    return retSize;
}

@end
