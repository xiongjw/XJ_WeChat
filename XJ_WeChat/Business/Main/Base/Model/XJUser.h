//
//  XJUser.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/5.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJUser : NSObject

@property (nonatomic,  copy) NSString *uid;
@property (nonatomic,  copy) NSString *nickname;
@property (nonatomic,  copy) NSString *headUrl;

@end
