//
//  XJDiscoveryUtil.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJDiscoveryUtil.h"

@implementation XJDiscoveryUtil

+ (NSArray *)demoData
{
    return @[
             @[
                 @{@"image":@"ff_IconShowAlbum",@"title":@"朋友圈"}
                 ],
             @[
                 @{@"image":@"ff_IconQRCode",@"title":@"扫一扫"},
                 @{@"image":@"ff_IconShake",@"title":@"摇一摇"}
                 ],
             @[
                 @{@"image":@"CreditCard_ShoppingBag",@"title":@"看一看"},
                 @{@"image":@"MoreGame",@"title":@"搜一搜"}
                 ],
             @[
                 @{@"image":@"ff_IconLocationService",@"title":@"附近的人"},
                 @{@"image":@"ff_IconBottle",@"title":@"漂流瓶"}
                 ],
             @[
                 @{@"image":@"CreditCard_ShoppingBag",@"title":@"购物"},
                 @{@"image":@"MoreGame",@"title":@"游戏"}
                 ],
             @[
                 @{@"image":@"ff_IconLocationService",@"title":@"小程序"}
                 ]
             ];
}

@end
