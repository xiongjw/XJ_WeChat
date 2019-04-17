//
//  XJPickerView.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJPickerView.h"

@interface XJPickerView ()

@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIView *barView;

@property (nonatomic,strong) XJPickerModel *model;
@property (nonatomic,  copy) PickerSelectBlock selectBlock;

@end

@implementation XJPickerView

- (instancetype)initWithModel:(XJPickerModel *)model selectBlock:(PickerSelectBlock)selectBlock
{
    self = [super initWithFrame:Screen_Frame];
    if (self) {
        
        _model = model;
        _selectBlock = selectBlock;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    [self addSubview:self.contentView];
    [self addSubview:self.barView];
}

-(UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 216 + 44)];
    }
    return _contentView;
}

-(UIView *)barView
{
    if (!_barView) {
        _barView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 44)];
    }
    return _barView;
}

- (void)show
{
    [KeyWindow addSubview:self];
    
    [UIView animateWithDuration:.3 animations:^{
        
    }];
}

+ (void)showWithConfig:(PickerConfigBlock)configBlock selectBlock:(PickerSelectBlock)selectBlock
{
    XJPickerModel *model = [[XJPickerModel alloc] init];
    if (configBlock) configBlock(model);
    
    XJPickerView *view = [[XJPickerView alloc] initWithModel:model selectBlock:selectBlock];
    [view show];
}

@end
