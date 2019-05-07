//
//  XJActionSheetCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/7.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJActionSheetCell.h"

@implementation XJActionSheetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLb];
    }
    return self;
}

-(UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, Screen_Width - 100, 20)];
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.textColor = [UIColor titleColor];
        _titleLb.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLb;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
