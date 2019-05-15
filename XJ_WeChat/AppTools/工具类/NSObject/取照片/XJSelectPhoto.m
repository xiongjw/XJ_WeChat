//
//  XJSelectPhoto.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJSelectPhoto.h"

#import "TZImagePickerController.h"

@implementation XJSelectPhoto

+ (void)selectPhoto:(id)delegate
         withConfig:(SelectPhotoConfigBlock)config
      completeBlock:(SelectPhotoCompleteBlock)completeBlock
{
    XJSelectPhotoConfig *model = [[XJSelectPhotoConfig alloc] init];
    if (config) config(model);
    
    UIViewController *aSelf = nil;
    if (delegate) aSelf = delegate;
    
    MJWeakSelf
    if (model.useActionSheet) {
        if (model.useSystemActionSheet) {
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:model.actionSheetTitle message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            [ac addAction:[UIAlertAction actionWithTitle:model.libraryTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [weakSelf selectFromLibrary:aSelf model:model completeBlock:completeBlock];
            }]];
            [ac addAction:[UIAlertAction actionWithTitle:model.cameraTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [weakSelf selectFromCamera:aSelf model:model completeBlock:completeBlock];
            }]];
            [ac addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            [aSelf presentViewController:ac animated:YES completion:nil];
        }
        else {
            [XJActionSheetView showWithConfig:^(XJActionSheetModel * _Nullable configModel) {
                //
                configModel.title = model.actionSheetTitle;
                NSArray *menus = @[
                                   @{@"name":model.libraryTitle,@"code":@"photoLibrary"},
                                   @{@"name":model.cameraTitle,@"code":@"camera"}
                                   ];
                configModel.menuList = [XJActionSheetItem getModelArray:menus];
                configModel.hasCancel = YES;
            } clickBlock:^(XJActionSheetItem *item) {
                //
                if ([@"photoLibrary" isEqualToString:item.code]) {
                    [weakSelf selectFromLibrary:aSelf model:model completeBlock:completeBlock];
                }
                else if ([@"camera" isEqualToString:item.code]) {
                    [weakSelf selectFromCamera:aSelf model:model completeBlock:completeBlock];
                }
            }];
        }
        
    }
    else {
        if (model.selectPhotoType == XJSelectPhotoLibrary) {
            [self selectFromLibrary:aSelf model:model completeBlock:completeBlock];
        }
        else {
            [self selectFromCamera:aSelf model:model completeBlock:completeBlock];
        }
    }
    
}

+ (void)selectFromLibrary:(UIViewController *)aSelf
               model:(XJSelectPhotoConfig *)model
            completeBlock:(SelectPhotoCompleteBlock)completeBlock
{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:model.maxCount delegate:nil];
    
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        if (completeBlock) {
            completeBlock(photos, assets, isSelectOriginalPhoto);
        }
    }];
    imagePickerVc.showSelectedIndex = YES;
    imagePickerVc.allowTakePicture = NO;
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    if (model.isSingle) {
        imagePickerVc.allowCrop = YES;
        imagePickerVc.cropRect = CGRectMake(0, (Screen_Height - Screen_Width)/2, Screen_Width, Screen_Width);
    }
    [aSelf presentViewController:imagePickerVc animated:YES completion:nil];
}

+ (void)selectFromCamera:(UIViewController *)aSelf
                   model:(XJSelectPhotoConfig *)model
           completeBlock:(SelectPhotoCompleteBlock)completeBlock
{
    
}

@end
