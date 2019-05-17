//
//  XJPreviewView.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJPreviewView.h"

#import "TZImagePickerController.h"

@implementation XJPreviewView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.mImageView];
        [self addSubview:self.selectLb];
        
        self.selectLb.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self.selectLb addGestureRecognizer:tap];
        
//        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan)];
//        [self addGestureRecognizer:pan];
    }
    return self;
}

#pragma mark - setter
-(void)setImage:(UIImage *)image
{
    _image = image;
    _mImageView.image = image;
}

-(void)setNum:(NSInteger)num
{
    _num = num;
    if (num > 0) {
        self.selectLb.backgroundColor = [UIColor themeColor];
        self.selectLb.text = FormatString(@"%ld",num);
    }
    else {
        self.selectLb.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.selectLb.text = @"";
    }
}

#pragma mark - 懒加载
-(UIImageView *)mImageView
{
    if (!_mImageView) {
        _mImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _mImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _mImageView;
}

-(UILabel *)selectLb
{
    if (!_selectLb) {
        _selectLb = [[UILabel alloc] initWithFrame:CGRectMake(self.width - 22, 2, 20, 20)];
        _selectLb.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        _selectLb.textColor = [UIColor whiteColor];
        _selectLb.font = [UIFont systemFontOfSize:12];
        _selectLb.textAlignment = NSTextAlignmentCenter;
        _selectLb.layer.borderWidth = 1;
        _selectLb.layer.borderColor = [UIColor whiteColor].CGColor;
        _selectLb.layer.cornerRadius = _selectLb.height/2;
        _selectLb.layer.masksToBounds = YES;
    }
    return _selectLb;
}

#pragma mark - 点击事件
- (void)tap:(UITapGestureRecognizer *)tap
{
    self.selected = !self.selected;
    if (self.clickBlock) {
        self.clickBlock(self.tag, self.selected);
    }
}

@end
