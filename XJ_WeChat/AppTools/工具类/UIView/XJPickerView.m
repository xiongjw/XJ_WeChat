//
//  XJPickerView.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJPickerView.h"

@interface XJPickerView () <UIPickerViewDataSource, UIPickerViewDelegate> {
    
    NSInteger _selectRow1;
    NSInteger _selectRow2;
    NSInteger _selectRow3;
    
    NSArray *_pickerList1;
    NSArray *_pickerList2;
    NSArray *_pickerList3;
}

@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIToolbar *toolbar;

@property (nonatomic,strong) UIDatePicker *datePicker;
@property (nonatomic,strong) NSDateFormatter *dateFormatter;

@property (nonatomic,strong) UIPickerView *pickerView;

@property (nonatomic,strong) XJPickerModel *model;
@property (nonatomic,  copy) PickerSelectBlock selectBlock;

@end

@implementation XJPickerView

#pragma mark - public
+ (void)showWithModel:(XJPickerModel *)model selectBlock:(PickerSelectBlock)selectBlock
{
    XJPickerView *view = [[XJPickerView alloc] initWithModel:model selectBlock:selectBlock];
    [view show];
}

+ (void)showWithConfig:(PickerConfigBlock)configBlock selectBlock:(PickerSelectBlock)selectBlock
{
    XJPickerModel *model = [[XJPickerModel alloc] init];
    if (configBlock) configBlock(model);
    
    XJPickerView *view = [[XJPickerView alloc] initWithModel:model selectBlock:selectBlock];
    [view show];
}

#pragma mark - instancetype
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
    
    /// 开始
    if (_model.pickerType == XJPicker_DataOne || _model.pickerType == XJPicker_DataTwo || _model.pickerType == XJPicker_DataThree)
    {
        /// 第一级
        _pickerList1 = _model.dataSource;
        _selectRow1 = 0;
        
        NSString *value1 = _model.valueList[0];
        if (_model.pickerType == XJPicker_DataOne) value1 = _model.value;
        
        if (value1.length > 0) {
            for (int i = 0; i < _pickerList1.count; i++) {
                if ([value1 isEqualToString:[self getValueStr:_pickerList1[i]]]) {
                    _selectRow1 = i;
                    break;
                }
            }
        }
        
        /// 第二级
        _selectRow2 = 0;
        NSString *value2 = _model.valueList[1];
        if (_pickerList1.count > 0) {
            _pickerList2 = [XJAppUtil readRegionDataWithKey:FormatString(@"%lld",[_pickerList1[_selectRow1][_model.codeKey] longLongValue])];
        }
        else _pickerList2 = @[];
        if (value2.length > 0) {
            for (int i = 0; i < _pickerList2.count; i++) {
                if ([value2 isEqualToString:[self getValueStr:_pickerList2[i]]]) {
                    _selectRow2 = i;
                    break;
                }
            }
        }

        /// 第三级
        _selectRow3 = 0;
        NSString *value3 = _model.valueList[2];
        if (_pickerList2.count > 0) {
            _pickerList3 = [XJAppUtil readRegionDataWithKey:FormatString(@"%lld",[_pickerList2[_selectRow2][_model.codeKey] longLongValue])];
        }
        else _pickerList3 = @[];
        if (value3.length > 0) {
            for (int i = 0; i < _pickerList3.count; i++) {
                if ([value3 isEqualToString:[self getValueStr:_pickerList3[i]]]) {
                    _selectRow3 = i;
                    break;
                }
            }
        }
        
        [self.contentView addSubview:self.pickerView];
        
        if (_selectRow1 > 0) [_pickerView selectRow:_selectRow1 inComponent:0 animated:NO];
        if (_selectRow2 > 0) [_pickerView selectRow:_selectRow2 inComponent:1 animated:NO];
        if (_selectRow3 > 0) [_pickerView selectRow:_selectRow3 inComponent:2 animated:NO];
        
    }
    else
    {
        [self.contentView addSubview:self.datePicker];
        
        if (_model.pickerType == XJPicker_DateTime) {
            [self.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        }
        else if (_model.pickerType == XJPicker_Date) {
            [self.dateFormatter setDateFormat:@"yyyy-MM-dd"];
            self.datePicker.datePickerMode = UIDatePickerModeDate;
        }
        else if (_model.pickerType == XJPicker_Time) {
            [self.dateFormatter setDateFormat:@"HH:mm"];
            self.datePicker.datePickerMode = UIDatePickerModeTime;
        }
        else if (_model.pickerType == XJPicker_CountDown) {
            [self.dateFormatter setDateFormat:@"HH:mm"];
            self.datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
        }
        
        if (_model.needMin) {
            if (_model.minValue) _datePicker.minimumDate = [self.dateFormatter dateFromString:_model.minValue];
            else _datePicker.minimumDate = [NSDate date];
        }
        
        if (_model.needMax) {
            if (_model.maxValue) _datePicker.maximumDate = [self.dateFormatter dateFromString:_model.maxValue];
            else _datePicker.maximumDate = [NSDate date];
        }
        
        if (_model.value && _model.value.length > 0) {
            _datePicker.date = [self.dateFormatter dateFromString:_model.value];
        }
    }
}

- (NSString *)getValueStr:(id)objItem
{
    NSString *str = @"";
    if ([objItem isKindOfClass:[NSString class]]) {
        str = objItem;
    }
    else {
        NSDictionary *item = objItem;
        id obj = item[_model.codeKey];
        if ([obj isKindOfClass:[NSString class]]) {
            str = obj;
        }
        else {
            str = FormatString(@"%lld",[obj longLongValue]);
        }
    }
    return str;
}

- (NSString *)getShowValueStr:(id)objItem
{
    NSString *str = @"";
    if ([objItem isKindOfClass:[NSString class]]) {
        str = objItem;
    }
    else {
        NSDictionary *item = objItem;
        str = item[_model.nameKey];
    }
    return str;
}

#pragma mark - getter
-(UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, Screen_Height, Screen_Width, 216 + 44)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [_contentView addSubview:self.toolbar];
    }
    return _contentView;
}

-(UIToolbar *)toolbar
{
    if (!_toolbar) {
        _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 44)];
        _toolbar.tintColor = [UIColor themeColor];
        
//        UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] init]];
        //UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction)];
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"　取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
        //UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"确定　" style:UIBarButtonItemStylePlain target:self action:@selector(doneAction)];
//        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] init]];
        //_toolbar.items = @[left, cancel, flexibleSpace, done, right];
        _toolbar.items = @[cancel, flexibleSpace, done];
    }
    return _toolbar;
}

-(UIDatePicker *)datePicker
{
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.toolbar.bottom, Screen_Width, self.contentView.height - self.toolbar.bottom)];
        _datePicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _datePicker;
}

-(NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    return _dateFormatter;
}

-(UIPickerView *)pickerView
{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.toolbar.bottom, Screen_Width, self.contentView.height - self.toolbar.bottom)];
        _pickerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
    }
    return _pickerView;
}

#pragma mark - 点击事件
- (void)cancelAction
{
    [self dismiss];
}

- (void)doneAction
{
    NSArray *items = @[];
    //NSDictionary *item = nil;
    if (_model.pickerType == XJPicker_DataOne)
    {
        if (_pickerList1.count > 0) {
            id obj = _pickerList1[_selectRow1];
            items = @[
                      @{_model.codeKey:[self getValueStr:obj], _model.nameKey:[self getShowValueStr:obj]}
                      ];
        }
    }
    else if (_model.pickerType == XJPicker_DataTwo) {
        if (_pickerList1.count > 0) {
            id obj = _pickerList1[_selectRow1];
            id obj2 = _pickerList2[_selectRow2];
            items = @[
                      @{_model.codeKey:[self getValueStr:obj], _model.nameKey:[self getShowValueStr:obj]},
                      @{_model.codeKey:[self getValueStr:obj2], _model.nameKey:[self getShowValueStr:obj2]}
                      ];
        }
    }
    else if (_model.pickerType == XJPicker_DataThree) {
        if (_pickerList1.count > 0) {
            id obj = _pickerList1[_selectRow1];
            id obj2 = _pickerList2[_selectRow2];
            id obj3 = _pickerList3[_selectRow3];
            items = @[
                      @{_model.codeKey:[self getValueStr:obj], _model.nameKey:[self getShowValueStr:obj]},
                      @{_model.codeKey:[self getValueStr:obj2], _model.nameKey:[self getShowValueStr:obj2]},
                      @{_model.codeKey:[self getValueStr:obj3], _model.nameKey:[self getShowValueStr:obj3]}
                      ];
        }
    }
    else {
        NSString *value = [_dateFormatter stringFromDate:_datePicker.date];
        NSDictionary *item = @{_model.codeKey:value, _model.nameKey:value};
        items = @[item];
    }
    if (items.count > 0 && self.selectBlock) {
        self.selectBlock(items);
    }
    [self dismiss];
}

#pragma mark - private
- (void)show
{
    [KeyWindow addSubview:self];
    
    __block UIView *view = _contentView;
    self.alpha = 0.0;
    [UIView animateWithDuration:.3 animations:^{
        view.bottom = Screen_Height;
        self.alpha = 1.0;
    }];
}

- (void)dismiss
{
    __block UIView *view = _contentView;
    [UIView animateWithDuration:.3 animations:^{
        view.top = Screen_Height;
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (_model.pickerType == XJPicker_DataOne) return 1;
    else if (_model.pickerType == XJPicker_DataTwo) return 2;
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) return _pickerList1.count;
    else if (component == 1) return _pickerList2.count;
    return _pickerList3.count;
}

#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) return [self getShowValueStr:_pickerList1[row]];
    else if (component == 1) return [self getShowValueStr:_pickerList2[row]];
    return [self getShowValueStr:_pickerList3[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        if (_selectRow1 == row) return;
        
        _selectRow1 = row;
        if (_model.pickerType == XJPicker_DataOne) {
            return;
        }
        _selectRow2 = 0;
        _selectRow3 = 0;
        
        _pickerList2 = [XJAppUtil readRegionDataWithKey:FormatString(@"%lld",[_pickerList1[_selectRow1][_model.codeKey] longLongValue])];
        [_pickerView reloadComponent:1];
        [_pickerView selectRow:0 inComponent:1 animated:NO];
        
        if (_model.pickerType == XJPicker_DataTwo) {
            return;
        }
        if (_pickerList2.count > 0) {
            _pickerList3 = [XJAppUtil readRegionDataWithKey:FormatString(@"%lld",[_pickerList2[_selectRow2][_model.codeKey] longLongValue])];
        }
        else _pickerList3 = @[];
        
        [_pickerView reloadComponent:2];
        [_pickerView selectRow:0 inComponent:2 animated:NO];
    }
    else if (component == 1) {
        if (_selectRow2 == row) return;
        
        _selectRow2 = row;
        if (_model.pickerType == XJPicker_DataTwo) {
            return;
        }
        _selectRow3 = 0;
        
        if (_pickerList2.count > 0) {
            _pickerList3 = [XJAppUtil readRegionDataWithKey:FormatString(@"%lld",[_pickerList2[_selectRow2][_model.codeKey] longLongValue])];
        }
        else _pickerList3 = @[];
        [_pickerView reloadComponent:2];
        [_pickerView selectRow:0 inComponent:2 animated:NO];
    }
    else {
        _selectRow3 = row;
    }
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self dismiss];
//}

@end
