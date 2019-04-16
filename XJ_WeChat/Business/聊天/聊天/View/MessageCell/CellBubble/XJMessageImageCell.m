//
//  XJMessageImageCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJMessageImageCell.h"

@implementation XJMessageImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imageIcon = [UIImageView createImageViewWithFrame:CGRectMake(0, 0, Screen_Width*0.4, Screen_Width*0.4) radius:5];
        [self.contentView addSubview:self.imageIcon];
        
        self.imageIcon.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self.imageIcon addGestureRecognizer:tap];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    [XJViewPhoto viewSinglePhoto:tap.view urlString:self.model.imageUrl];
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
    
    if (model.isSender) {
        self.imageIcon.left = self.headIcon.left - 10 - self.imageIcon.width;
    }
    else {
        self.imageIcon.left = self.headIcon.right + 10;
    }
    [self.imageIcon sd_setImageWithURL:[NSURL URLWithString:model.imageUrl]];
}

@end
