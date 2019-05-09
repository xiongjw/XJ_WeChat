//
//  XJPokerView.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XJPoker.h"

/**
 单张扑克
 */
@interface XJPokerView : UIView

@property (nonatomic,  copy) NSString *pokerStr;
@property (nonatomic,  copy) void (^clickBlock)(NSString *pokerStr);


//@property (nonatomic,strong) XJPoker *model;
//@property (nonatomic,  copy) void (^clickBlock)(XJPoker *model);

@end
