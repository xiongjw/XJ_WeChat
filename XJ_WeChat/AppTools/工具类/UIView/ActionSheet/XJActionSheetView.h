//
//  XJActionSheetView.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/7.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XJActionSheetModel.h"
#import "XJActionSheetItem.h"


typedef void (^ActionSheetConfigBlock)(XJActionSheetModel * _Nullable configModel);
typedef void (^ActionSheetClickBlock)(XJActionSheetItem *item);

@interface XJActionSheetView : UIView

@property (nonatomic,strong) XJActionSheetModel *model;
@property (nonatomic,  copy) ActionSheetClickBlock clickBlock;

+ (void)showWithConfig:(ActionSheetConfigBlock)config clickBlock:(ActionSheetClickBlock)clickBlock;

@end
