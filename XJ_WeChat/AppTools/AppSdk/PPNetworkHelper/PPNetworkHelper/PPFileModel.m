//
//  PPFileModel.m
//  XJ_WeChat
//
//  Created by mac on 2019/6/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import "PPFileModel.h"

@implementation PPFileModel

+ (PPFileModel *)fileModelWithFileObj:(id)fileObj
                                 name:(NSString *)name
                             fileName:(NSString *)fileName
                             fileType:(PPFileType)fileType
                           fileSuffix:(NSString *)fileSuffix
                          fileUseType:(NSString *)fileUseType
{
    PPFileModel *model = [[PPFileModel alloc] init];
    model.fileObj = fileObj;
    model.name = name;
    model.fileName = fileName;
    model.fileType = fileType;
    model.fileSuffix = fileSuffix;
    model.fileUseType = fileUseType;
    return model;
}

+ (NSArray *)fileModelsWithImages:(NSArray *)images
{
    return [self fileModelsWithImages:images fileUseType:nil];
}

+ (NSArray *)fileModelsWithImages:(NSArray *)images fileUseType:(NSString *)fileUseType
{
    if (images.count == 0) {
        return @[];
    }
    NSMutableArray *files = [[NSMutableArray alloc] init];
    
    PPFileModel *model = nil;
    for (UIImage *image in images) {
        model = [PPFileModel fileModelWithFileObj:image name:@"files" fileName:nil fileType:PPFileTypeImage fileSuffix:nil fileUseType:fileUseType];
        [files addObject:model];
    }
    return [NSArray arrayWithArray:files];
}

@end
