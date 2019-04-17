//
//  XJHeadModel.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 headView的数据 以及对应下面的section的数据源
 */
@interface XJHeadModel : NSObject

@property (nonatomic,  copy) NSString *code;
@property (nonatomic,  copy) NSString *title;
@property (nonatomic,  copy) NSString *desc;
@property (nonatomic,assign) BOOL isOpen;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end
