//
//  XJPickerView.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XJPickerModel.h"

typedef void (^PickerConfigBlock)(XJPickerModel *model);
typedef void (^PickerSelectBlock)(NSDictionary *item);

/**
 封装选择器（数据、时间）
 */
@interface XJPickerView : UIView

+ (void)showWithConfig:(PickerConfigBlock)configBlock selectBlock:(PickerSelectBlock)selectBlock;

@end
