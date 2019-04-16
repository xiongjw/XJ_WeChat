//
//  XJEditBaseCell.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XJEditInfoModel.h"

@interface XJEditBaseCell : UITableViewCell

@property (nonatomic,strong) UILabel *keyLb;
@property (nonatomic,strong) UIView *sepLine;

@property (nonatomic,strong) XJEditInfoModel *model;

@end
