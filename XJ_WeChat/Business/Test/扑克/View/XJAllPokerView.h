//
//  XJAllPokerView.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XJPokerPlayer.h"

/**
 一个人的所有扑克
 */
@interface XJAllPokerView : UIView

@property (nonatomic,strong) XJPokerPlayer *model;

@property (nonatomic,  copy) void (^clickBlock)(NSString *pokerStr);

@end
