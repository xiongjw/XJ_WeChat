//
//  XJSelectPhotoConfig.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XJSelectPhotoType) {
    XJSelectPhotoCamera = 0,
    XJSelectPhotoLibrary
};

@interface XJSelectPhotoConfig : NSObject

/// 是否采用actionsheet（拍照、从相册选择）
@property (nonatomic,assign) BOOL useActionSheet;

/// 如果用的话，是否用系统的，默认yes
@property (nonatomic,assign) BOOL useSystemActionSheet;
/// 默认没有
@property (nonatomic,copy) NSString *actionSheetTitle;
@property (nonatomic,copy) NSString *cameraTitle;
@property (nonatomic,copy) NSString *libraryTitle;

@property (nonatomic,assign) XJSelectPhotoType selectPhotoType;

/// 是否单选，默认YES
@property (nonatomic,assign) BOOL isSingle;
/// 针对单选来说
/// 是否裁减，默认不裁减
@property (nonatomic,assign) BOOL isCut;
/// 裁减比例，默认1（1:1）
//@property (nonatomic,assign) CGFloat cutRate;

/// 针对多选来说
@property (nonatomic,assign) NSInteger maxCount;

@end
