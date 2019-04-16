//
//  XJEditHeadCell.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJEditHeadCell.h"

#import "SDPhotoBrowser.h"

@interface XJEditHeadCell () <SDPhotoBrowserDelegate>

@end

@implementation XJEditHeadCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
                
        [self.contentView addSubview:self.headIcon];
        self.keyLb.centerY = self.headIcon.centerY;
        
        self.headIcon.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self.headIcon addGestureRecognizer:tap];
    }
    return self;
}

-(UIImageView *)headIcon
{
    if (!_headIcon) {
        _headIcon = [UIImageView createImageViewWithFrame:CGRectMake(Screen_Width - 48 - 15, 15, 48, 48) radius:24];
    }
    return _headIcon;
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = tap.view;
    browser.imageCount = 1;
    browser.currentImageIndex = 0;
    browser.delegate = self;
    [browser show];
}

#pragma mark - photobrowser代理方法
// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    return self.headIcon.image;
}

// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    return [NSURL URLWithString:self.model.showValue];
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
    [super setModel:model];
    [_headIcon sd_setImageWithURL:[NSURL URLWithString:model.showValue]];
}

@end
