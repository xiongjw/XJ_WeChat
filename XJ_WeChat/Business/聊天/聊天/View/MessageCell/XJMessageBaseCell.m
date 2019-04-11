//
//  XJMessageBaseCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJMessageBaseCell.h"

@implementation XJMessageBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.headIcon = [UIImageView createImageViewWithFrame:CGRectMake(0, 0, KChatCellHeadHeight, KChatCellHeadHeight) radius:5];
    [self.contentView addSubview:self.headIcon];
    
    self.bubbleIcon = [[UIImageView alloc] init];
    [self.contentView addSubview:self.bubbleIcon];
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
    [self.headIcon sd_setImageWithURL:[NSURL URLWithString:model.headImageUrl]];
    UIImage *bubbleImage = nil;
    if (model.isSender) {
        self.headIcon.left = Screen_Width - self.headIcon.width - KChatCellPadding;
        bubbleImage = [UIImage imageNamed:@"chat_bubble_out"];
    }
    else {
        self.headIcon.left = KChatCellPadding;
        bubbleImage = [UIImage imageNamed:@"chat_bubble_in"];
    }
    self.bubbleIcon.image = [bubbleImage stretchableImageWithLeftCapWidth:bubbleImage.size.width*0.5 topCapHeight:bubbleImage.size.height*0.7];
}


+ (CGFloat)getCellHeight:(XJMessageModel *)model
{
    if (model.cellType == XJMessageCellType_Text) {
        CGFloat maxBubbleWidth = Screen_Width - (KChatCellHeadHeight + KChatCellPadding)*2;
        CGFloat maxTextWidth = maxBubbleWidth - 15 - 10;
        
        CGSize size = [XJChatUtil getLabelSize:model.text font:[UIFont systemFontOfSize:16] width:maxTextWidth];

        return KChatCellPadding*2 + size.height + 15;
    }
    else if (model.cellType == XJMessageCellType_Image){
        return Screen_Width*0.4 + 15;
    }
    else if (model.cellType == XJMessageCellType_Voice){
        return KChatCellHeadHeight + 15;
    }
    else if (model.cellType == XJMessageCellType_Video){
        return Screen_Width*0.4 + 15;
    }
    else if (model.cellType == XJMessageCellType_Location) {
        CGFloat width = Screen_Width - (KChatCellHeadHeight + 20)*2 - 40;
        return width*0.58 + 15;
    }
    else if (model.cellType == XJMessageCellType_Tips) {
        return 40;
    }
    return 100;
}

@end
