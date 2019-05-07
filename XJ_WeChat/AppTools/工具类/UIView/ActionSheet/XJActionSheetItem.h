//
//  XJActionSheetItem.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/7.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJActionSheetItem : NSObject

@property (nonatomic,  copy) NSString *name;
@property (nonatomic,  copy) NSString *code;

+ (NSArray *)getModelArray:(NSArray *)array;
+ (BOOL)hasCancel:(NSArray *)array;

@end
