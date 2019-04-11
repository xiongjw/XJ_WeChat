//
//  XJConversationCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJConversationCell.h"

@interface XJConversationCell ()

@property (nonatomic,strong) UIImageView *headIcon;
@property (nonatomic,strong) UILabel *badgeLb;
@property (nonatomic,strong) UILabel *nameLb;
@property (nonatomic,strong) UILabel *timeLb;
@property (nonatomic,strong) UILabel *descLb;

@end

@implementation XJConversationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _headIcon = [UIImageView createImageViewWithFrame:CGRectMake(15, 10, 40, 40) radius:5];
        [self.contentView addSubview:_headIcon];
        
        _badgeLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
        _badgeLb.center = CGPointMake(_headIcon.right, _headIcon.top);
        _badgeLb.layer.cornerRadius = _badgeLb.height/2;
        _badgeLb.layer.masksToBounds = YES;
        _badgeLb.textColor = [UIColor whiteColor];
        _badgeLb.font = [UIFont systemFontOfSize:12];
        _badgeLb.textAlignment = NSTextAlignmentCenter;
        _badgeLb.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_badgeLb];
        
        _timeLb = [[UILabel alloc] initWithFrame:CGRectMake(Screen_Width - 15 - 100, 10, 100, 20)];
        _timeLb.font = [UIFont systemFontOfSize:12];
        _timeLb.textColor = [UIColor descColor];
        _timeLb.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_timeLb];
        
        _nameLb = [[UILabel alloc] initWithFrame:CGRectMake(_headIcon.right + 10, 10, _timeLb.left - (_headIcon.right + 10), 20)];
        _nameLb.font = [UIFont systemFontOfSize:16];
        _nameLb.textColor = [UIColor titleColor];
        [self.contentView addSubview:_nameLb];
        
        _descLb = [[UILabel alloc] initWithFrame:CGRectMake(_nameLb.left, _nameLb.bottom, Screen_Width - 15 - _nameLb.left, 20)];
        _descLb.font = [UIFont systemFontOfSize:14];
        _descLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_descLb];
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

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    if (!_badgeLb.hidden) {
        _badgeLb.backgroundColor = [UIColor redColor];
    }
}

-(void)setModel:(XJConversationModel *)model
{
    _model = model;
    
    [_headIcon sd_setImageWithURL:[NSURL URLWithString:model.headImageUrl]];
    _nameLb.text = model.nickname;
    _timeLb.text = @"17:34";
    _descLb.text = model.desc;
    
    _badgeLb.hidden = YES;
    if (model.unReadNum > 0) {
        _badgeLb.hidden = NO;
        if (model.unReadNum < 10) {
            _badgeLb.width = 16;
            _badgeLb.text = FormatString(@"%ld",model.unReadNum);
        }
        else if (model.unReadNum < 100) {
            _badgeLb.width = 24;
            _badgeLb.text = FormatString(@"%ld",model.unReadNum);
        }
        else {
            _badgeLb.width = 32;
            _badgeLb.text = @"99+";
        }
        _badgeLb.center = CGPointMake(_headIcon.right, _headIcon.top);
        
    }
    
}

@end
