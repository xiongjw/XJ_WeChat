//
//  XJSelectPhotoConfig.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJSelectPhotoConfig.h"

@implementation XJSelectPhotoConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.useActionSheet = NO;
        self.useSystemActionSheet = YES;
        self.libraryTitle = @"相册";
        self.cameraTitle = @"拍照";
        
        self.selectPhotoType = XJSelectPhotoLibrary;
        
        self.isSingle = YES;
        self.maxCount = 1;
        self.isCut = YES;
    }
    return self;
}

-(void)setMaxCount:(NSInteger)maxCount
{
    _maxCount = maxCount;
    if (_isSingle && maxCount > 1) {
        _maxCount = 1;
    }
}

@end
