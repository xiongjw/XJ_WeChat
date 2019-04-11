//
//  XJMessageLocationCell.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJMessageLocationCell : XJMessageBaseCell

@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UILabel *addressNameLb;
@property (nonatomic,strong) UILabel *addressDescLb;

/// mapView,暂时用图片代替吧
@property (nonatomic,strong) UIImageView *mapView;

@end
