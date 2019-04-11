//
//  XJLocationModel.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJLocationModel : NSObject

@property (nonatomic,  copy) NSString *name;
@property (nonatomic,  copy) NSString *address;

@property (nonatomic,assign) double latitude;
@property (nonatomic,assign) double longitude;

@end
