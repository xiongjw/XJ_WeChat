//
//  XJEditLbCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJEditLbCell.h"

@implementation XJEditLbCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.accessoryType = UITableViewCellAccessoryNone;
        
        [self.contentView addSubview:self.valueLb];
        [self.contentView addSubview:self.arrowIcon];
        
        _arrowIcon.centerX = Screen_Width - 15;
        _arrowIcon.centerY = _valueLb.centerY;
        
        [self.contentView addSubview:self.sepLine];
        self.sepLine.bottom = 50;
    }
    return self;
}

-(UILabel *)valueLb
{
    if (!_valueLb) {
        _valueLb = [[UILabel alloc] initWithFrame:CGRectMake(self.keyLb.right, 15, Screen_Width - 15 - self.keyLb.right, 20)];
        _valueLb.textColor = [UIColor contentColor];
        _valueLb.font = [UIFont systemFontOfSize:14];
        _valueLb.textAlignment = NSTextAlignmentRight;
    }
    return _valueLb;
}

-(UIImageView *)arrowIcon
{
    if (!_arrowIcon) {
        _arrowIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_arrow_right"]];
    }
    return _arrowIcon;
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
    
    if ([@"id" isEqualToString:model.code]) {
        _valueLb.width = Screen_Width - 15 - self.keyLb.right;
        //self.accessoryType = UITableViewCellAccessoryNone;
        self.arrowIcon.hidden = YES;
    }
    else {
        _valueLb.width = Screen_Width - 30 - self.keyLb.right;
        //self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.arrowIcon.hidden = NO;
    }
    if (model.showValue.length > 0) {
        self.valueLb.text = model.showValue;
        self.valueLb.textColor = [UIColor contentColor];
    }
    else {
        self.valueLb.text = model.placeholder;
        
        if (model.placeholderColor) {
            self.valueLb.textColor = model.placeholderColor;
        }
        else {
            self.valueLb.textColor = [UIColor descColor];
        }
    }
    
    if (model.titleColor) {
        self.keyLb.textColor = model.titleColor;
    }
    else {
        self.keyLb.textColor = [UIColor titleColor];
    }
    
    if (model.canNotClick) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
    }
}

@end
