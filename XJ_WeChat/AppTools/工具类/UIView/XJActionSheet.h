//
//  XJActionSheet.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^XJClickActionSheetItemBlock)(NSDictionary *item);

@interface XJActionSheet : UIView

@property (nonatomic,strong) NSArray *menuList;

@property (nonatomic,  copy) XJClickActionSheetItemBlock clickItemBlock;

- (void)show;

+ (void)showWithList:(NSArray *)menuList clickItemBlock:(XJClickActionSheetItemBlock)clickItemBlock;

@end
