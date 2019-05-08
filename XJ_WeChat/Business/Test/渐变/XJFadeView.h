//
//  XJFadeView.h
//  XJ_WeChat
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XJFadeType) {
    XJFade_Normal = 1,
    XJFade_iPhone = 2
};

typedef NS_ENUM(NSInteger, XJFadeDirection) {
    XJDirection_Right = 1,
    XJDirection_Down = 2
};

@interface XJFadeView : UIView

@property (nonatomic,strong) NSString *text;
@property (nonatomic,assign) NSTextAlignment alignment;
@property (nonatomic,strong) UIColor *backColor;
@property (nonatomic,strong) UIColor *foreColor;
@property (nonatomic,strong) UIFont *font;



- (void)fadeType:(XJFadeType)fadeType fadeDirection:(XJFadeDirection)fadeDirection;

- (void)fadeWithDuration:(NSTimeInterval)duration;

@end
