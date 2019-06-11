//
//  XJRequest.m
//  XJ_WeChat
//
//  Created by mac on 2019/6/3.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJRequest.h"

@implementation XJRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.requestMethod = POST;
        self.needLoading = NO;
    }
    return self;
}

-(NSMutableDictionary *)param
{
    if (!_param) {
        _param = [NSMutableDictionary new];
    }
    return _param;
}

@end
