//
//  XJActionSheetView.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/7.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJActionSheetView.h"

#import "XJActionSheetCell.h"

@interface XJActionSheetView () <UITableViewDataSource, UITableViewDelegate>
{
    NSInteger _sectionNum;
    NSIndexPath *_lastIndexPath;
}
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UITableView *mTableView;
@property (nonatomic,strong) UIView *viewForHeader;

@end

@implementation XJActionSheetView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:Screen_Frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    }
    return self;
}

-(void)setModel:(XJActionSheetModel *)model
{
    _model = model;
    [self setUpUI];
}

- (void)setUpUI
{
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 0)];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.tag = 99;
    [self addSubview:_contentView];
    
    CGFloat posY = 0;
    if (_model.title && _model.title.length > 0) {
        UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(15, posY + 10, _contentView.width - 30, 20)];
        titleLb.font = [UIFont systemFontOfSize:14];
        titleLb.textColor = [UIColor titleColor];
        titleLb.textAlignment = NSTextAlignmentCenter;
        titleLb.text = _model.title;
        [titleLb sizeToFit];
        [_contentView addSubview:titleLb];
        posY = titleLb.bottom + 10;
    }
    [self.contentView addSubview:self.mTableView];
    [_mTableView registerClass:[XJActionSheetCell class] forCellReuseIdentifier:@"XJActionSheetCell"];
    
    NSInteger rowHeight = _mTableView.rowHeight;
    NSInteger count = _model.menuList.count;
    if (_model.hasCancel) {
        _sectionNum = 2;
        _mTableView.frame = CGRectMake(0, posY, _contentView.width, rowHeight * count + 8 + rowHeight);
    }
    else {
        _sectionNum = 1;
        _mTableView.frame = CGRectMake(0, posY, _contentView.width, rowHeight * count);
    }
    _contentView.height = _mTableView.bottom;
    _contentView.top = Screen_Height;
    
    _lastIndexPath = nil;
}

-(UITableView *)mTableView
{
    if (!_mTableView) {
        _mTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mTableView.delegate = self;
        _mTableView.dataSource = self;
        _mTableView.scrollEnabled = NO;
        _mTableView.rowHeight = 44;
        _mTableView.separatorColor = [UIColor lineColor];
    }
    return _mTableView;
}

-(UIView *)viewForHeader
{
    if (!_viewForHeader) {
        _viewForHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 8)];
        _viewForHeader.backgroundColor = [UIColor bgColor];
        _viewForHeader.layer.borderWidth = .5;
        _viewForHeader.layer.borderColor = [UIColor lineColor].CGColor;
    }
    return _viewForHeader;
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sectionNum;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return _model.menuList.count;
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XJActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJActionSheetCell" forIndexPath:indexPath];
    cell.titleLb.centerY = tableView.rowHeight/2;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    if (indexPath.section == 0) {
        XJActionSheetItem *itemModel = _model.menuList[indexPath.row];
        cell.titleLb.text = itemModel.name;
        
        if (_model.value && _model.value.length > 0 && [_model.value isEqualToString:itemModel.code]) {
            _lastIndexPath = [indexPath copy];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    else {
        cell.titleLb.text = @"取消";
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) return nil;
    return self.viewForHeader;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) return CGFLOAT_MIN;
    return self.viewForHeader.height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (_lastIndexPath) {
            UITableViewCell *lastCell = [tableView cellForRowAtIndexPath:_lastIndexPath];
            lastCell.accessoryType = UITableViewCellAccessoryNone;
        }
        UITableViewCell *currentCell = [tableView cellForRowAtIndexPath:indexPath];
        currentCell.accessoryType = UITableViewCellAccessoryCheckmark;
        _lastIndexPath = [indexPath copy];
        
        if (self.clickBlock) {
            self.clickBlock(_model.menuList[indexPath.row]);
        }
        [self dismiss];
    }
    else {
        [self dismiss];
    }
}

#pragma mark - private
- (void)show
{
    [KeyWindow addSubview:self];
    self.alpha = 0.0;
    __block UIView *blockView = _contentView;
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = 1.0;
        blockView.bottom = Screen_Height;
    }];
}

- (void)dismiss
{
    __block UIView *blockView = _contentView;
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = 0.0;
        blockView.top = Screen_Height;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


#pragma mark - public
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view.tag == 99) {
        return;
    }
    [self dismiss];
}

+ (void)showWithConfig:(ActionSheetConfigBlock)config clickBlock:(ActionSheetClickBlock)clickBlock
{
    XJActionSheetModel *model = [[XJActionSheetModel alloc] init];
    if (config) {
        config(model);
    }
    XJActionSheetView *view = [[XJActionSheetView alloc] initWithFrame:CGRectZero];
    view.model = model;
    view.clickBlock = clickBlock;
    [view show];
}

@end
