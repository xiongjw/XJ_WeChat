//
//  XJPickerCell.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XJPickerModel.h"

@interface XJPickerCell : UITableViewCell

@property (nonatomic,strong) UILabel *keyLb;
@property (nonatomic,strong) UILabel *valueLb;

@property (nonatomic,strong) XJPickerModel *model;

@end
