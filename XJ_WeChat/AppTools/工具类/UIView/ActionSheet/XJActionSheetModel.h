//
//  XJActionSheetModel.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/7.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJActionSheetModel : NSObject

@property (nullable, nonatomic,  copy)  NSString *title;
@property (nullable, nonatomic,  copy)  NSString *value;
//@property (nullable, nonatomic,  copy)  NSString *showValue;
@property (nullable, nonatomic,strong)  NSArray *menuList;
@property (nonatomic)                   BOOL hasCancel;

@end
