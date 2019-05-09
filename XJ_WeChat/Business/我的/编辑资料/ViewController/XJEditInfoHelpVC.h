//
//  XJEditInfoHelpVC.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XJEditHeadCell.h"
#import "XJEditFieldCell.h"
#import "XJEditLbCell.h"
#import "XJEditImageCell.h"
#import "XJEditQuestionCell.h"

#import "XJHeadModel.h"
#import "XJEditInfoModel.h"
#import "XJEditInfoUtil.h"

@interface XJEditInfoHelpVC : XJBaseTableVC

- (void)submit;

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

-(UIView *)viewForHeaderInSection:(NSInteger)section;

@end
