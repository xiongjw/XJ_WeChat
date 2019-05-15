//
//  XJViewPhoto.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJViewPhoto.h"

#import "SDPhotoBrowser.h"

@interface XJViewPhoto () <SDPhotoBrowserDelegate>

@property (nonatomic,  copy) NSString *urlString;

@end

@implementation XJViewPhoto

+ (void)viewSinglePhoto:(UIView *)imageView urlString:(NSString *)urlString
{
    [[XJViewPhoto sharedInstance] viewSinglePhoto:imageView urlString:urlString];
}

#pragma mark - private
+ (XJViewPhoto *)sharedInstance {
    static XJViewPhoto *instance;
    static dispatch_once_t onceToken;
    //利用dispatch_once 来创建单例模式
    dispatch_once(&onceToken, ^ {
        instance = [[XJViewPhoto alloc] init];
    });
    return instance;
}

- (void)viewSinglePhoto:(UIView *)imageView urlString:(NSString *)urlString
{
    _urlString = urlString;
    
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = imageView;
    browser.imageCount = 1;
    browser.currentImageIndex = 0;
    browser.delegate = self;
    [browser show];
}

#pragma mark - photobrowser代理方法
// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    UIImageView *imageView = (UIImageView *)browser.sourceImagesContainerView;
    return imageView.image;
}

// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    if (_urlString) {
        return [NSURL URLWithString:_urlString];
    }
    return nil;
}

@end
