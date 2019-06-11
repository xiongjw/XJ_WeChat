//
//  XJNetwork.h
//  XJ_WeChat
//
//  Created by mac on 2019/6/3.
//  Copyright © 2019 mac. All rights reserved.
//

#ifndef XJNetwork_h
#define XJNetwork_h

/**
 请求方法
 */
typedef NS_ENUM(NSInteger, HTTPMethod){
    GET = 0,
    POST = 1,
    POST_URL = 2
};

/// 导入pp
#import "XJRequest.h"
#import "XJRequestEngin.h"

///请求结束统一回调 block
typedef void(^HanderBlock)(XJRequest * _Nullable request);
typedef void(^ResponseCacheBlock)(XJRequest * _Nullable request);
typedef void(^ProgressBlock)(NSProgress * _Nullable uploadProgress, NSInteger fileIndex);

#endif /* XJNetwork_h */
