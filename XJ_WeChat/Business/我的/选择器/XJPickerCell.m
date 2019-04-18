//
//  XJPickerCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJPickerCell.h"

@implementation XJPickerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        [self.contentView addSubview:self.keyLb];
        [self.contentView addSubview:self.valueLb];
    }
    return self;
}

-(UILabel *)keyLb
{
    if (!_keyLb) {
        _keyLb = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 100, 16)];
        _keyLb.textColor = [UIColor titleColor];
        _keyLb.font = [UIFont systemFontOfSize:16];
    }
    return _keyLb;
}

-(UILabel *)valueLb
{
    if (!_valueLb) {
        _valueLb = [[UILabel alloc] initWithFrame:CGRectMake(self.keyLb.right, 15, Screen_Width - 30 - self.keyLb.right, 16)];
        _valueLb.textColor = [UIColor contentColor];
        _valueLb.font = [UIFont systemFontOfSize:14];
        _valueLb.textAlignment = NSTextAlignmentRight;
    }
    return _valueLb;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(XJPickerModel *)model
{
    self.keyLb.text = model.title;
    
    if (model.showValue.length > 0) {
        self.valueLb.text = model.showValue;
        self.valueLb.textColor = [UIColor contentColor];
    }
    else {
        self.valueLb.text = model.placeholder;
        self.valueLb.textColor = [UIColor descColor];
    }
}

@end
