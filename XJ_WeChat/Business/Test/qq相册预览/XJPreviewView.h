//
//  XJPreviewView.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJPreviewView : UIView

@property (nonatomic,strong) UIImageView *mImageView;
@property (nonatomic,strong) UIImage *image;

@property (nonatomic,strong) UILabel *selectLb;
@property (nonatomic,assign) BOOL selected;
@property (nonatomic,assign) NSInteger num;

@property (nonatomic, copy) void (^clickBlock)(NSInteger tag, BOOL selected);

@end
