//
//  XJSelectPhoto.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJSelectPhoto.h"

#import "TZImagePickerController.h"

@interface XJSelectPhoto () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic,strong) UIImagePickerController *imagePickerVc;

@property (nonatomic,strong) XJSelectPhotoConfig *model;
@property (nonatomic,  copy) SelectPhotoCompleteBlock completeBlock;

@end

@implementation XJSelectPhoto

#pragma mark - private
+ (XJSelectPhoto *)sharedInstance {
    static XJSelectPhoto *instance;
    static dispatch_once_t onceToken;
    //利用dispatch_once 来创建单例模式
    dispatch_once(&onceToken, ^ {
        instance = [[XJSelectPhoto alloc] init];
    });
    return instance;
}

+ (void)selectPhoto:(id)delegate
         withConfig:(SelectPhotoConfigBlock)config
      completeBlock:(SelectPhotoCompleteBlock)completeBlock
{
    XJSelectPhotoConfig *model = [[XJSelectPhotoConfig alloc] init];
    if (config) config(model);
    
    UIViewController *aSelf = nil;
    if (delegate) aSelf = delegate;
    else aSelf = [self currentViewController];
        
    MJWeakSelf
    if (model.useActionSheet) {
        if (model.useSystemActionSheet) {
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:model.actionSheetTitle message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            [ac addAction:[UIAlertAction actionWithTitle:model.libraryTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [weakSelf selectFromLibrary:aSelf model:model completeBlock:completeBlock];
            }]];
            
            [ac addAction:[UIAlertAction actionWithTitle:model.cameraTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[XJSelectPhoto sharedInstance] selectFromCamera:aSelf model:model completeBlock:completeBlock];
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
                    [[XJSelectPhoto sharedInstance] selectFromCamera:aSelf model:model completeBlock:completeBlock];
                }
            }];
        }
        
    }
    else {
        if (model.selectPhotoType == XJSelectPhotoLibrary) {
            [self selectFromLibrary:aSelf model:model completeBlock:completeBlock];
        }
        else {
            [[XJSelectPhoto sharedInstance] selectFromCamera:aSelf model:model completeBlock:completeBlock];
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
    imagePickerVc.allowTakeVideo = NO;
    imagePickerVc.showSelectedIndex = YES;
    imagePickerVc.allowTakePicture = NO;
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    if (model.isSingle) {
        imagePickerVc.allowCrop = YES;
        imagePickerVc.cropRect = CGRectMake(0, (Screen_Height - Screen_Width)/2, Screen_Width, Screen_Width);
    }
    
    /// 配置
    /// 导航部分
    imagePickerVc.statusBarStyle = UIStatusBarStyleDefault;
    imagePickerVc.naviBgColor = [UIColor whiteColor];
    imagePickerVc.naviTitleColor = [UIColor titleColor];
    imagePickerVc.naviTitleFont = [UIFont boldSystemFontOfSize:18];
    imagePickerVc.barItemTextColor = [UIColor themeColor];
    imagePickerVc.barItemTextFont = [UIFont boldSystemFontOfSize:15];
    imagePickerVc.navLeftBarButtonSettingBlock = ^(UIButton *leftButton) {
        [leftButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
        ///增加返回按钮点击范围
        [leftButton setTitle:@"　　　" forState:(UIControlStateNormal)];
        [leftButton sizeToFit];
    };
    
    /// 一些按钮，选中等
    imagePickerVc.photoSelImage = [UIImage imageNamed:@"tz_photoSelImage"];
    imagePickerVc.oKButtonTitleColorNormal = RGBCOLOR(228, 99, 82);
    imagePickerVc.oKButtonTitleColorDisabled = RGBACOLOR(228, 99, 82, 0.5);
    imagePickerVc.photoNumberIconImage = [UIImage imageNamed:@"tz_photoSelImage"];
    imagePickerVc.photoOriginSelImage = [UIImage imageNamed:@"tz_photoOriginSelImage"];
    [aSelf presentViewController:imagePickerVc animated:YES completion:nil];
}

- (void)selectFromCamera:(UIViewController *)aSelf
                   model:(XJSelectPhotoConfig *)model
           completeBlock:(SelectPhotoCompleteBlock)completeBlock
{
    _completeBlock = completeBlock;
    _model = model;
    self.imagePickerVc.allowsEditing = _model.isCut;
    [aSelf presentViewController:self.imagePickerVc animated:YES completion:nil];
}

-(UIImagePickerController *)imagePickerVc
{
    if (!_imagePickerVc) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        _imagePickerVc.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    return _imagePickerVc;
}

#pragma mark - UINavigationControllerDelegate,UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *photo = nil;
    if (picker.allowsEditing) photo = [info objectForKey:UIImagePickerControllerEditedImage];
    else photo = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (photo) {
        if (self.completeBlock) self.completeBlock(@[photo], nil, YES);
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
