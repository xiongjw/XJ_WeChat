//
//  XJSelectPhoto.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XJSelectPhotoConfig.h"

typedef void (^SelectPhotoConfigBlock)(XJSelectPhotoConfig * _Nullable configModel);
typedef void (^SelectPhotoCompleteBlock)(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto);

/**
 图片选择类
 */
@interface XJSelectPhoto : NSObject

+ (void)selectPhoto:(id)delegate
         withConfig:(SelectPhotoConfigBlock)config
      completeBlock:(SelectPhotoCompleteBlock)completeBlock;

@end
