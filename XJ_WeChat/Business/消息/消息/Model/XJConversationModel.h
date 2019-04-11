//
//  XJConversationModel.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJConversationModel : NSObject

@property (nonatomic,  copy) NSString *conversationId;
@property (nonatomic,  copy) NSString *userId;
@property (nonatomic,  copy) NSString *nickname;
@property (nonatomic,  copy) NSString *headImageUrl;
@property (nonatomic,assign) long unReadNum;
@property (nonatomic,assign) long time;

@property (nonatomic,  copy) NSString *desc;

@end

