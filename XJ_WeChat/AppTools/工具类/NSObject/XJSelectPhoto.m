//
//  XJSelectPhoto.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJSelectPhoto.h"

@implementation XJSelectPhoto

+ (void)selectPhotoWithActionSheet
{
    NSArray *menuList = @[
                          @{@"name":@"相册",@"code":@"photoLibrary"},
                          @{@"name":@"拍照",@"code":@"camera"},
                          @{@"name":@"取消",@"code":@"cancel"},
                          ];
    [XJActionSheet showWithList:menuList clickItemBlock:^(NSDictionary *item) {
        
    }];
}

@end
