//
//  XJMessageVideoCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJMessageVideoCell.h"

@implementation XJMessageVideoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.videoIcon = [UIImageView createImageViewWithFrame:CGRectZero radius:5];
        [self.contentView addSubview:self.videoIcon];
        
        self.playBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chat_videoPlay_icon"]];
        [self.contentView addSubview:self.playBtn];
        
        self.durationLb = [UILabel createLabelWithFont:[UIFont systemFontOfSize:12] textColor:[UIColor whiteColor]];
        self.durationLb.frame = CGRectMake(0, 0, 60, 14);
        self.durationLb.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.durationLb];
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
    
    self.bubbleIcon.hidden = YES;
    
    self.videoIcon.image = [UIImage imageNamed:@"chat_video_demo.jpg"];
    self.videoIcon.size = CGSizeMake(Screen_Width*0.25, Screen_Width*0.4);
    if (model.isSender) {
        self.videoIcon.right = self.headIcon.left - 10;
    }
    else {
        self.videoIcon.left = self.headIcon.right + 10;
    }
    self.playBtn.center = self.videoIcon.center;
    self.durationLb.right = self.videoIcon.right - 5;
    self.durationLb.bottom = self.videoIcon.bottom - 5;
    
    if (model.duration < 10) {
        self.durationLb.text = FormatString(@"0:0%ld",model.duration);
    }
    else if (model.duration < 60) {
        self.durationLb.text = FormatString(@"0:%ld",model.duration);
    }
}

@end
