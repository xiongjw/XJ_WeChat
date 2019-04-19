//
//  XJEditBaseCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJEditBaseCell.h"

@implementation XJEditBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.keyLb];
        //[self.contentView addSubview:self.sepLine];
    }
    return self;
}

-(UILabel *)keyLb
{
    if (!_keyLb) {
        _keyLb = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 100, 20)];
        _keyLb.textColor = [UIColor titleColor];
        _keyLb.font = [UIFont systemFontOfSize:16];
    }
    return _keyLb;
}

-(UIView *)sepLine
{
    if (!_sepLine) {
        _sepLine = [[UIView alloc] initWithFrame:CGRectMake(15, 0, Screen_Width - 30, .5)];
        _sepLine.backgroundColor = [UIColor lineColor];
    }
    return _sepLine;
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
    _model = model;
    self.keyLb.text = model.title;
}

@end
