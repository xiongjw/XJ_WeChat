//
//  XJMessageTipsCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJMessageTipsCell.h"

@implementation XJMessageTipsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.tipLb = [UILabel createLabelWithFont:[UIFont systemFontOfSize:12] textColor:[UIColor descColor]];
        _tipLb.textAlignment = NSTextAlignmentCenter;
        _tipLb.frame = CGRectMake(15, 0, Screen_Width - 30, 40);
        [self.contentView addSubview:self.tipLb];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(XJMessageModel *)model
{
    self.tipLb.text = model.tipStr;
}

@end
