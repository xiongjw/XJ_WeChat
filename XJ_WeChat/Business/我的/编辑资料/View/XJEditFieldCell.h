//
//  XJEditFieldCell.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XJEditBaseCell.h"

@interface XJEditFieldCell : XJEditBaseCell

@property (nonatomic,strong) UITextField *mTextField;

@property (nonatomic, copy) void (^textFieldShouldReturnBlock)(NSString *text);

@end
