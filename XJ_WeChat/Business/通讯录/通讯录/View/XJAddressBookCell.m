//
//  XJAddressBookCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJAddressBookCell.h"

@interface XJAddressBookCell ()

@property (nonatomic,strong) UIImageView *headIcon;
@property (nonatomic,strong) UILabel *nameLb;

@end

@implementation XJAddressBookCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _headIcon = [UIImageView createImageViewWithFrame:CGRectMake(15, 5, 36, 36) radius:5];
        [self.contentView addSubview:_headIcon];
        
        _nameLb = [[UILabel alloc] initWithFrame:CGRectMake(_headIcon.right + 10, 0, Screen_Width - 15 - (_headIcon.right + 10), 20)];
        _nameLb.font = [UIFont systemFontOfSize:16];
        _nameLb.textColor = [UIColor titleColor];
        [self.contentView addSubview:_nameLb];
        _nameLb.centerY = _headIcon.centerY;
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

-(void)setModel:(XJAddressBookModel *)model
{
    [_headIcon sd_setImageWithURL:[NSURL URLWithString:model.headImageUrl]];
    _nameLb.text = model.name;
}

@end
