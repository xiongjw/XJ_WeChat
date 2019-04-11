//
//  XJChatDefine.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#ifndef XJChatDefine_h
#define XJChatDefine_h


typedef NS_ENUM(NSInteger, XJMessageCellType) {
    XJMessageCellType_Text = 1,
    XJMessageCellType_Image = 2,
    XJMessageCellType_Voice = 3,
    XJMessageCellType_Video = 4,
    XJMessageCellType_Location = 5,
    XJMessageCellType_Tips = 6
};

typedef NS_ENUM(NSInteger, XJChatType) {
    XJChatType_Chat = 1,
    XJChatType_GroupChat = 2,
    XJChatType_ChatRoom = 3
};

#import "XJMessageBaseCell.h"

#import "XJMessageModel.h"

#import "XJChatUtil.h"


#define KChatCellHeadHeight     36
#define KChatCellPadding        10

#endif /* XJChatDefine_h */
