//
//  XJEditFieldCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJEditFieldCell.h"

@interface XJEditFieldCell () <UITextFieldDelegate>

@end

@implementation XJEditFieldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.mTextField];
        [self.contentView addSubview:self.sepLine];
        self.sepLine.bottom = 46;
    }
    return self;
}

-(UITextField *)mTextField
{
    if (!_mTextField) {
        _mTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.keyLb.right, 0, Screen_Width - 15 - self.keyLb.right, 50)];
        //_mTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.keyLb.right, 0, Screen_Width - 10 - self.keyLb.right, 46)];
        _mTextField.textColor = [UIColor contentColor];
        _mTextField.font = [UIFont systemFontOfSize:14];
        _mTextField.placeholder = @"取个好听的名字吧";
        [_mTextField setValue:[UIColor descColor] forKeyPath:@"_placeholderLabel.textColor"];
        _mTextField.textAlignment = NSTextAlignmentRight;
        _mTextField.returnKeyType = UIReturnKeyDone;
        _mTextField.delegate = self;
    }
    return _mTextField;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (self.textFieldShouldReturnBlock) {
        self.textFieldShouldReturnBlock(textField.text);
    }
    return YES;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(XJEditInfoModel *)model
{
    [super setModel:model];
    
    _mTextField.text = model.showValue;
}

@end
