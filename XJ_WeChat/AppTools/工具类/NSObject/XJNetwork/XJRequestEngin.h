//
//  XJRequestEngin.h
//  XJ_WeChat
//
//  Created by mac on 2019/6/3.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJRequestEngin : NSObject

+ (NSString *)getCompleteUrl:(NSString *)urlString;

+ (NSString *)getImageUrl:(NSString *)urlString;

@end
