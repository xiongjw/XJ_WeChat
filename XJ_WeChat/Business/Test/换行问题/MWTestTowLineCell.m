//
//  MWTestTowLineCell.m
//  SXMoWan
//
//  Created by mac on 2019/4/1.
//  Copyright © 2019 SX. All rights reserved.
//

#import "MWTestTowLineCell.h"

#import <CoreText/CoreText.h>

@interface MWTestTowLineCell ()
{
    UILabel *_firstLb;
    UILabel *_secondLb;
    
    UIButton *_firstBtn;
    UIButton *_secondBtn;
}

@end

@implementation MWTestTowLineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _firstLb = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, Screen_Width - 30, 18)];
        _firstLb.font = [UIFont systemFontOfSize:16];
        _firstLb.textColor = [UIColor titleColor];
        [self.contentView addSubview:_firstLb];
        
        _secondLb = [[UILabel alloc] initWithFrame:CGRectMake(15, _firstLb.bottom + 10, Screen_Width - 30, 18)];
        _secondLb.font = [UIFont systemFontOfSize:16];
        _secondLb.textColor = [UIColor titleColor];
        [self.contentView addSubview:_secondLb];
        
        _secondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _secondBtn.frame = CGRectMake(Screen_Width - 15 - 44, _secondLb.top, 44, 18);
        [_secondBtn setTitle:@"33" forState:UIControlStateNormal];
        _secondBtn.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_secondBtn];
        
        _firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _firstBtn.frame = CGRectMake(_secondBtn.left - 5 - 44, _secondLb.top, 44, 18);
        [_firstBtn setTitle:@"44" forState:UIControlStateNormal];
        _firstBtn.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:_firstBtn];
        
        _secondLb.width = _firstBtn.left - _firstLb.left;
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

-(void)setData:(NSDictionary *)data
{
    NSArray *lines = [self getSeparatedLinesFromtext:data[@"text"] font:_firstLb.font maxWidth:Screen_Width - 30];
    _firstLb.text = @"";
    if (lines.count > 0) {
        _firstLb.text = lines[0];
        // 不加这行代码，可能最后一个字无法展现全
        [_firstLb sizeToFit];
    }
    _secondLb.text = @"";
    if (lines.count > 1) {
        _secondLb.text = lines[1];
    }
}

- (NSArray *)getSeparatedLinesFromtext:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth
{
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,maxWidth,100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    
    for (id line in lines)
    {
        CTLineRef lineRef = (__bridge CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    return (NSArray *)linesArray;
}

@end
