//
//  UIView+Create.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Create)

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame;
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame radius:(CGFloat)radius;

+ (UILabel *)createLabelWithFont:(UIFont *)font textColor:(UIColor *)textColor;

@end
