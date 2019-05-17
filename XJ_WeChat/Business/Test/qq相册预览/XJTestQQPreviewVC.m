//
//  XJTestQQPreviewVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/17.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJTestQQPreviewVC.h"

#import "XJPreviewView.h"

@interface XJTestQQPreviewVC () <UIScrollViewDelegate>

@property (nonatomic,strong) UILabel *numLb;
@property (nonatomic,strong) UIScrollView *mScollView;
@property (nonatomic,strong) NSMutableArray *images;

@property (nonatomic,strong) NSMutableArray *selectedImages;

@end

@implementation XJTestQQPreviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showBackBtn:YES withTitle:@"QQ相册"];
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.mScollView];
    [self.view addSubview:self.numLb];
    self.numLb.left = 15;
    self.numLb.bottom = self.mScollView.top - 15;
    
    CGFloat posX = 2;
    XJPreviewView *previewView = nil;
    UIImage *image = nil;
    CGFloat width = 0.0;
    MJWeakSelf
    for (int i = 0; i < self.images.count; i++) {
        image = self.images[i];
        width = image.size.width*160.0/image.size.height;
        previewView = [[XJPreviewView alloc] initWithFrame:CGRectMake(posX, 0, width, 160)];
        //previewView.mImageView.image = image;
        previewView.image = image;
        previewView.tag = 1000 + i;
        previewView.clickBlock = ^(NSInteger tag, BOOL selected) {
            [weakSelf clickAction:tag selected:selected];
        };
        if (previewView.right > Screen_Width) {
            previewView.selectLb.left = MAX(Screen_Width - previewView.left - previewView.selectLb.width, 0);
        }
        [self.mScollView addSubview:previewView];
        posX = previewView.right + 2;
    }
    [self.mScollView setContentSize:CGSizeMake(posX, self.mScollView.height)];
}

- (void)clickAction:(NSInteger)tag selected:(BOOL)selected
{
    XJPreviewView *previewView = [self.mScollView viewWithTag:tag];
    if (selected) {
        [self.selectedImages addObject:previewView];
        previewView.num = self.selectedImages.count;
        
        // 移动下一个的位置
        XJPreviewView *nextPreview = [self.mScollView viewWithTag:tag + 1];
        CGFloat base = Screen_Width + self.mScollView.contentOffset.x;
        //CGFloat moveWidth = MIN(nextPreview.height*3/4, previewView.width - previewView.selectLb.width - 2);
        CGFloat moveWidth = 80;
        if (nextPreview.left + moveWidth > base) {
            [self.mScollView setContentOffset:CGPointMake(nextPreview.left + moveWidth - Screen_Width, 0) animated:YES];
        }
    }
    else {
        if (previewView.num < self.selectedImages.count)
        {
            for (XJPreviewView *subView in self.selectedImages) {
                if (subView.num > previewView.num) {
                    subView.num -= 1;
                }
            }
        }
        [self.selectedImages removeObject:previewView];
        previewView.num = 0;
    }
    
    if (self.selectedImages.count > 0) {
        self.numLb.hidden = NO;
        self.numLb.text = FormatString(@"%ld",self.selectedImages.count);
    }
    else {
        self.numLb.hidden = YES;
        self.numLb.text = @"";
    }
}

-(UILabel *)numLb
{
    if (!_numLb) {
        _numLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _numLb.backgroundColor = [UIColor themeColor];
        _numLb.textColor = [UIColor whiteColor];
        _numLb.font = [UIFont systemFontOfSize:12];
        _numLb.textAlignment = NSTextAlignmentCenter;
        _numLb.layer.borderWidth = 1;
        _numLb.layer.borderColor = [UIColor whiteColor].CGColor;
        _numLb.layer.cornerRadius = _numLb.height/2;
        _numLb.layer.masksToBounds = YES;
        _numLb.hidden = YES;
    }
    return _numLb;
}

-(UIScrollView *)mScollView
{
    if (!_mScollView) {
        _mScollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, Screen_Height - NavHeight - 200, Screen_Width, 200)];
        _mScollView.backgroundColor = [UIColor whiteColor];
        _mScollView.delegate = self;
    }
    return _mScollView;
}

-(NSMutableArray *)images
{
    if (!_images) {
        _images = [[NSMutableArray alloc] init];
        for (NSInteger i = 1; i <= 22; i++) {
            NSString *imagePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:FormatString(@"testImage_%ld.jpeg",i)];
            [_images addObject:[UIImage imageWithContentsOfFile:imagePath]];
        }
        for (NSInteger i = 1; i <= 22; i++) {
            NSString *imagePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:FormatString(@"testImage_%ld.jpeg",i)];
            [_images addObject:[UIImage imageWithContentsOfFile:imagePath]];
        }
    }
    return _images;
}

-(NSMutableArray *)selectedImages
{
    if (!_selectedImages) {
        _selectedImages = [NSMutableArray new];
    }
    return _selectedImages;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"contentOffsetX:%f",scrollView.contentOffset.x);
    
    for (UIView *view in self.mScollView.subviews) {
        if ([view isMemberOfClass:[XJPreviewView class]]) {
            XJPreviewView *previewView = (XJPreviewView *)view;
            
            CGFloat base = Screen_Width + scrollView.contentOffset.x;
            if (previewView.left > base) {
                continue;
            }
            if (previewView.right > base) {
                previewView.selectLb.left = MAX(MIN(base - previewView.left - previewView.selectLb.width, previewView.width - previewView.selectLb.width - 2), 0);
            }
            
        }
    }
}
@end
