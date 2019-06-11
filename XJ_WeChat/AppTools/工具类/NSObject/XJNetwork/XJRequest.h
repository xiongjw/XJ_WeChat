//
//  XJRequest.h
//  XJ_WeChat
//
//  Created by mac on 2019/6/3.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJRequest : NSObject

#pragma mark 请求配置
@property (nonatomic,assign) HTTPMethod requestMethod;
@property (nonatomic,  copy) NSString *api;
@property (nonatomic,strong) NSMutableDictionary *param;

@property (nonatomic,assign) BOOL needLoading;
@property (nonatomic,assign) BOOL needAlertFailMsg;
@property (nonatomic,assign) BOOL needAlertErrorMsg;

@property (nonatomic,assign) BOOL needAlertSuccessMsg;

//@property (nonatomic,  copy) ResponseCacheBlock responseCacheBlock;

// 缓存是通过url和param组合起来的，但有时候，同一个接口param多变（比如经纬度）
// 所以此处带上唯一key（需要缓存，就一定要带上不同的key）
@property (nonatomic,  copy) NSString *responseCacheKey;

@property (nonatomic,strong) NSURLSessionTask *task;

#pragma mark 响应数据

@end
