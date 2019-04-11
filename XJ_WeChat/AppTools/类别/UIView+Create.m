//
//  UIView+Create.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UIView+Create.h"

@implementation UIView (Create)

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
{
    return [self createImageViewWithFrame:frame radius:0];
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame radius:(CGFloat)radius
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    if (radius > 0) {
        imageView.layer.cornerRadius = radius;
        imageView.layer.masksToBounds = YES;
    }
    return imageView;
}

@end
