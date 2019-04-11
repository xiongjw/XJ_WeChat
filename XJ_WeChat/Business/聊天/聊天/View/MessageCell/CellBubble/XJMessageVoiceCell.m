//
//  XJMessageVoiceCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJMessageVoiceCell.h"

@implementation XJMessageVoiceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.animateIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, (KChatCellHeadHeight - 16)/2, 16, 16)];
        [self.contentView addSubview:self.animateIcon];
        
        self.durationLb = [UILabel createLabelWithFont:[UIFont systemFontOfSize:14] textColor:[UIColor titleColor]];
        self.durationLb.frame = CGRectMake(0, 0, 40, KChatCellHeadHeight);
        [self.contentView addSubview:self.durationLb];
        
        self.unreadView = [[UIView alloc] initWithFrame:CGRectMake(0, (KChatCellHeadHeight - 10)/2, 10, 10)];
        self.unreadView.backgroundColor = [UIColor redColor];
        self.unreadView.layer.cornerRadius = self.unreadView.height/2;
        self.unreadView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.unreadView];
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
    [super setModel:model];
    
    self.bubbleIcon.height = KChatCellHeadHeight;
    self.bubbleIcon.width = 80 + model.duration*2;
    if (model.isSender) {
        self.bubbleIcon.right = self.headIcon.left - 5;
        self.unreadView.right = self.bubbleIcon.left - 5;
        self.animateIcon.image = [UIImage imageNamed:@"bubble_voice_send_icon_3"];
        
        self.animateIcon.right = self.headIcon.left - 20;
        
        self.durationLb.right = self.animateIcon.left - 10;
        self.durationLb.textAlignment = NSTextAlignmentRight;
    }
    else {
        self.bubbleIcon.left = self.headIcon.right + 5;
        self.unreadView.left = self.bubbleIcon.right + 5;
        self.animateIcon.image = [UIImage imageNamed:@"bubble_voice_receive_icon_3"];
        
        self.animateIcon.left = self.headIcon.right + 20;
        
        self.durationLb.left = self.animateIcon.right + 10;
        self.durationLb.textAlignment = NSTextAlignmentLeft;
    }
    self.unreadView.hidden = model.voiceIsRead;
    self.durationLb.text = FormatString(@"%ld''",model.duration);
}

@end
