//
//  XJMessageLocationCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJMessageLocationCell.h"

@implementation XJMessageLocationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //665 385
        // 759 284
        
        CGFloat width = Screen_Width - (KChatCellHeadHeight + 20)*2 - 40;
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width*0.58)];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 5;
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.borderWidth = 0.5;
        _bgView.layer.borderColor = [UIColor lineColor].CGColor;
        [self.contentView addSubview:self.bgView];
        
        UIImage *image = [UIImage imageNamed:@"chat_location_demo.jpg"];
        self.mapView = [[UIImageView alloc] initWithImage:image];
        _mapView.width = width;
        _mapView.height = width*0.37;
        _mapView.bottom = self.bgView.bottom;
        [self.bgView addSubview:self.mapView];
        
        self.addressNameLb = [UILabel createLabelWithFont:[UIFont systemFontOfSize:16] textColor:[UIColor titleColor]];
        self.addressNameLb.frame = CGRectMake(10, 10, self.bgView.width - 20, 16);
        [self.bgView addSubview:self.addressNameLb];
        
        self.addressDescLb = [UILabel createLabelWithFont:[UIFont systemFontOfSize:12] textColor:[UIColor descColor]];
        self.addressDescLb.frame = CGRectMake(10, self.addressNameLb.bottom + 4, self.addressNameLb.width, 12);
        [self.bgView addSubview:self.addressDescLb];
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
    if (model.isSender) {
        //self.bubbleIcon.right = self.headIcon.left - 5;
        self.bgView.right = self.headIcon.left - 10;
    }
    else {
        //self.bubbleIcon.left = self.headIcon.right + 5;
        self.bgView.left = self.headIcon.right + 10;
    }
    //self.bubbleIcon.width = self.bgView.width + 5;
    //self.bubbleIcon.height = self.bgView.height;
    self.addressNameLb.text = model.locationModel.name;
    self.addressDescLb.text = model.locationModel.address;
}

@end
