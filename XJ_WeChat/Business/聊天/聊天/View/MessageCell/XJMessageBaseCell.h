//
//  XJMessageBaseCell.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XJMessageModel.h"

@interface XJMessageBaseCell : UITableViewCell

@property (nonatomic,strong) UIImageView *headIcon;
@property (nonatomic,strong) UIImageView *bubbleIcon;

@property (nonatomic,strong) XJMessageModel *model;


+ (CGFloat)getCellHeight:(XJMessageModel *)model;

@end
