//
//  XJMessageTextCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJMessageTextCell.h"

@implementation XJMessageTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.textLb = [UILabel createLabelWithFont:[UIFont systemFontOfSize:16] textColor:[UIColor titleColor]];
        _textLb.numberOfLines = 0;
        [self.contentView addSubview:self.textLb];
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
    
    CGFloat maxBubbleWidth = Screen_Width - (KChatCellHeadHeight + KChatCellPadding)*2;
    CGFloat maxTextWidth = maxBubbleWidth - 15 - 10;
    
    CGSize size = [XJChatUtil getLabelSize:model.text font:self.textLb.font width:maxTextWidth];
    
    self.bubbleIcon.width = size.width + 25;
    self.bubbleIcon.height = KChatCellPadding*2 + size.height;
    if (model.isSender) {
        self.bubbleIcon.right = self.headIcon.left - 5;
        self.textLb.left = self.bubbleIcon.left + 10;
    }
    else {
        self.bubbleIcon.left = self.headIcon.right + 5;
        self.textLb.left = self.bubbleIcon.left + 15;
    }
    self.textLb.top = KChatCellPadding;
    self.textLb.size = size;
    
    self.textLb.text = model.text;
    
}
@end
