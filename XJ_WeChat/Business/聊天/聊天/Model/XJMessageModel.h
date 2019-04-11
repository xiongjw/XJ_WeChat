//
//  XJMessageModel.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XJLocationModel.h"

@interface XJMessageModel : NSObject


@property (nonatomic,assign) XJMessageCellType cellType;

@property (nonatomic,  copy) NSString *messageId;

@property (nonatomic,  copy) NSString *uid;
@property (nonatomic,  copy) NSString *nickname;
@property (nonatomic,  copy) NSString *headImageUrl;

@property (nonatomic,assign) BOOL isSender;

/// 文字
@property (nonatomic,  copy) NSString *text;
/// 图片
@property (nonatomic,  copy) NSString *imageUrl;
/// 语音
@property (nonatomic,  copy) NSString *voiceUrl;
@property (nonatomic,assign) BOOL voiceIsRead;
/// 视频
@property (nonatomic,  copy) NSString *videoUrl;
/// 时长（音频、视频）
@property (nonatomic,assign) long duration;
/// 位置
@property (nonatomic,strong) XJLocationModel *locationModel;

@property (nonatomic,  copy) NSString *tipStr;


//+ (XJMessageModel *)addTextModel;
//+ (XJMessageModel *)addImageModel;
//+ (XJMessageModel *)addVoiceModel;
//+ (XJMessageModel *)addVideoModel;
//+ (XJMessageModel *)addLocationModel;
//+ (XJMessageModel *)addTipModel;

@end
