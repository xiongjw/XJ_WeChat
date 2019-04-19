//
//  XJAddressBookMainVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJAddressBookMainVC.h"

#import "XJAddressBookCell.h"

#import "XJAddressBookUtil.h"

#import "PinYin4Objc.h"

@interface XJAddressBookMainVC ()

@property(nonatomic,strong) NSArray *lettersArray;
@property(nonatomic,strong) NSMutableDictionary *nameDic;

@end

@implementation XJAddressBookMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mTableView.height = Screen_Height - NavHeight - TabBarHeight;
    [self.mTableView registerClass:[XJAddressBookCell class] forCellReuseIdentifier:@"XJAddressBookCell"];
    //设置右边索引index的字体颜色和背景颜色
    self.mTableView.sectionIndexColor = [UIColor darkGrayColor];
    self.mTableView.sectionIndexBackgroundColor = [UIColor clearColor];
    
    self.mutArray = [XJAddressBookUtil demoData];
    
    self.nameDic = [[NSMutableDictionary alloc] init];
    [self handleLettersArray];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.lettersArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *nameArray = [self.nameDic objectForKey:self.lettersArray[section]];
    return nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XJAddressBookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJAddressBookCell" forIndexPath:indexPath];
    XJAddressBookModel *model = self.nameDic[self.lettersArray[indexPath.section]][indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 20)];
    headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    NSString *letterString =  self.lettersArray[section];
    UILabel *letterLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, headerView.frame.origin.y, headerView.frame.size.width-10, headerView.frame.size.height)];
    letterLabel.textColor = [UIColor grayColor];
    letterLabel.font = [UIFont systemFontOfSize:14.f];
    letterLabel.text =letterString;
    [headerView addSubview:letterLabel];
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == self.mTableView) {
        return 20.0;
    }
    return CGFLOAT_MIN;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.lettersArray[section];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    NSInteger count = 0;
    for(NSString *letter in self.lettersArray){
        if([letter isEqualToString:title]){
            return count;
        }
        count++;
    }
    return 0;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.lettersArray;
}

#pragma mark - 处理letterArray，包括按英文字母顺序排序
- (void)handleLettersArray {
    NSMutableDictionary *tempDic = [[NSMutableDictionary alloc]init];
    for(XJAddressBookModel *model  in self.mutArray){
        HanyuPinyinOutputFormat *formatter =  [[HanyuPinyinOutputFormat alloc] init];
        formatter.caseType = CaseTypeLowercase;
        formatter.vCharType = VCharTypeWithV;
        formatter.toneType = ToneTypeWithoutTone;
        NSString *outputPinyin = [PinyinHelper toHanyuPinyinStringWithNSString:model.name withHanyuPinyinOutputFormat:formatter withNSString:@""];
        [tempDic setObject:model forKey:[[outputPinyin substringToIndex:1] uppercaseString]];
    }
    
    self.lettersArray = tempDic.allKeys;
    for (NSString *letter in self.lettersArray) {
        NSMutableArray *tempArry = [[NSMutableArray alloc] init];
        
        for (NSInteger i = 0; i < self.mutArray.count; i++) {
            XJAddressBookModel *model = self.mutArray[i];
            HanyuPinyinOutputFormat *formatter =  [[HanyuPinyinOutputFormat alloc] init];
            formatter.caseType = CaseTypeUppercase;
            formatter.vCharType = VCharTypeWithV;
            formatter.toneType = ToneTypeWithoutTone;
            
            //把friend的userName汉子转为汉语拼音，比如：张磊---->zhanglei
            NSString *outputPinyin =[PinyinHelper toHanyuPinyinStringWithNSString:model.name withHanyuPinyinOutputFormat:formatter withNSString:@""];
            if ([letter isEqualToString:[[outputPinyin substringToIndex:1] uppercaseString]]) {
                [tempArry addObject:model];
            }
        }
        [self.nameDic setObject:tempArry forKey:letter];
    }
    
    self.lettersArray = tempDic.allKeys;
    //排序，排序的根据是字母
    NSComparator cmptr = ^(id obj1, id obj2){
        if ([obj1 characterAtIndex:0] > [obj2 characterAtIndex:0]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 characterAtIndex:0] < [obj2 characterAtIndex:0]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };
    
    self.lettersArray = [[NSMutableArray alloc] initWithArray:[self.lettersArray sortedArrayUsingComparator:cmptr]];
}
@end
