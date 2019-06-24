//
//  PPFileModel.h
//  XJ_WeChat
//
//  Created by mac on 2019/6/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PPFileType) {
    PPFileTypeImage = 0,
    PPFileTypeAudio = 1,
    PPFileTypeVideo = 2
};

@interface PPFileModel : NSObject

// 必传：文件对象，图片/音频
@property (nonatomic,strong) id fileObj;
// 必传：服务器对应名字
@property (nonatomic,  copy) NSString *name;
// 文件名（非必传）
@property (nonatomic,  copy) NSString *fileName;
// 文件类型（image、audio、video）,也当作文件唯一标识
@property (nonatomic,assign) PPFileType fileType;
// 文件后缀(音频模式下，必传，m4a)
@property (nonatomic,  copy) NSString *fileSuffix;
// 文件来源，好做分类
@property (nonatomic,  copy) NSString *fileUseType;
// 请求服务器成功之后，每个文件的结果
@property (nonatomic,  copy) NSString *resultUrlString;


+ (PPFileModel *)fileModelWithFileObj:(id)fileObj
                                 name:(NSString *)name
                             fileName:(NSString *)fileName
                             fileType:(PPFileType)fileType
                           fileSuffix:(NSString *)fileSuffix
                          fileUseType:(NSString *)fileUseType;

+ (NSArray *)fileModelsWithImages:(NSArray *)images;
+ (NSArray *)fileModelsWithImages:(NSArray *)images fileUseType:(NSString *)fileUseType;

@end
