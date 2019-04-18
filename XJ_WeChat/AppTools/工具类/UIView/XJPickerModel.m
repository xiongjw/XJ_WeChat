//
//  XJPickerModel.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJPickerModel.h"

@implementation XJPickerModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.value = @"";
        self.showValue = @"";
        
        self.valueList = [[NSMutableArray alloc] initWithArray:@[@"", @"", @""]];
        self.showValueList = [[NSMutableArray alloc] initWithArray:@[@"", @"", @""]];
        
        self.codeKey = @"code";
        self.nameKey = @"name";
        
        self.placeholder = @"请选择";
    }
    return self;
}

@end
