//
//  XJEditImageCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJEditImageCell.h"

@implementation XJEditImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.valueLb];
        [self.contentView addSubview:self.arrowIcon];
        
        _arrowIcon.centerX = Screen_Width - 15;
        _arrowIcon.centerY = _valueLb.centerY;
    }
    return self;
}

-(UILabel *)valueLb
{
    if (!_valueLb) {
        _valueLb = [[UILabel alloc] initWithFrame:CGRectMake(self.keyLb.right, 15, Screen_Width - 30 - self.keyLb.right, 16)];
        _valueLb.textColor = [UIColor descColor];
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
    
    if (model.dataList.count > 0) {
        _valueLb.text = @"";
    }
    else {
        _valueLb.text = model.placeholder;
    }
}

@end
