//
//  XJEditInfoHelpVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJEditInfoHelpVC.h"

#import "XJEditSelectSchoolVC.h"
#import "XJEditSelectDataVC.h"

@interface XJEditInfoHelpVC ()

@property (nonatomic,strong) NSMutableArray *viewsForHeader;

@end

@implementation XJEditInfoHelpVC

/// header是否需要悬停
//-(UITableViewStyle)tableViewStyle
//{
//    return UITableViewStyleGrouped;
//}

- (void)submit
{
    
}

- (void)requestWithRefresh:(BOOL)refresh
{
    // 请求接口并赋值
    //[super requestWithRefresh:refresh];
    [XJHud showWithStatus:@"加载中..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [XJHud dismiss];
        [self setUpUI:nil];
    });
}

- (void)setUpUI:(NSDictionary *)data
{
    /// 页面数据源
    self.mutArray = [XJEditInfoUtil editPageData];
    
    /// 赋值操作
    for (XJHeadModel *headModel in self.mutArray) {
        for (XJEditInfoModel *model in headModel.dataSource) {
            if ([@"head" isEqualToString:model.code]) {
                model.value = model.showValue = @"https://img4.duitang.com/uploads/item/201507/11/20150711193532_E2zF8.thumb.700_0.jpeg";
            }
            else if ([@"nickname" isEqualToString:model.code]) {
                model.value = model.showValue = @"大熊";
            }
            else if ([@"id" isEqualToString:model.code]) {
                model.value = model.showValue = @"666";
            }
            else if ([@"sex" isEqualToString:model.code]) {
                model.value = @"1";
                model.showValue = @"男";
            }
            else if ([@"age" isEqualToString:model.code]) {
                model.value = @"";
                model.showValue = @"28岁 摩羯座";
            }
            else if ([@"area" isEqualToString:model.code]) {
                model.value = model.showValue = @"湖北省-武汉市-洪山区";
            }
            else if ([@"sign" isEqualToString:model.code]) {
                model.value = model.showValue = @"";
            }
            else if ([@"PhotoWall" isEqualToString:model.code]) {
                model.value = model.showValue = @"";
            }
        }
    }
    
    [self.mTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self tableRegisterClass];
    
    //self.mTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 30)];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self requestWithRefresh:YES];
    });
}

- (void)tableRegisterClass
{
    [self.mTableView registerClass:[XJEditHeadCell class] forCellReuseIdentifier:@"XJEditHeadCell"];
    [self.mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"XJEditEmptyCell"];
    [self.mTableView registerClass:[XJEditFieldCell class] forCellReuseIdentifier:@"XJEditFieldCell"];
    [self.mTableView registerClass:[XJEditLbCell class] forCellReuseIdentifier:@"XJEditLbCell"];
    [self.mTableView registerClass:[XJEditImageCell class] forCellReuseIdentifier:@"XJEditImageCell"];
    [self.mTableView registerClass:[XJEditQuestionCell class] forCellReuseIdentifier:@"XJEditQuestionCell"];
}

#pragma mark - heightForRowAtIndexPath
- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XJEditInfoModel *model = ((XJHeadModel *)self.mutArray[indexPath.section]).dataSource[indexPath.row];
    if ([@"head" isEqualToString:model.code]) {
        return 78;
    }
    else if ([@"empty" isEqualToString:model.code]) {
        return 10;
    }
    else if ([@"nickname" isEqualToString:model.code]) {
        return 50;
    }
    else if ([@"id" isEqualToString:model.code] ||
             [@"sex" isEqualToString:model.code] ||
             [@"age" isEqualToString:model.code] ||
             [@"area" isEqualToString:model.code] ||
             [@"sign" isEqualToString:model.code] ||
             
             [@"schoolAll" isEqualToString:model.code] ||
             [@"in_school" isEqualToString:model.code] ||
             [@"industry" isEqualToString:model.code] ||
             [@"occupation" isEqualToString:model.code] ||
             
             [@"emotion" isEqualToString:model.code] ||
             [@"question" isEqualToString:model.code]) {
        return 50;
    }
    else if ([@"PhotoWall" isEqualToString:model.code]) {
        if (model.dataList.count > 0) {
            return 50 + 50 + 15;
        }
        return 50;
    }
    return 50;
}

#pragma mark - didSelectRowAtIndexPath
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    __block XJEditInfoModel *model = ((XJHeadModel *)self.mutArray[indexPath.section]).dataSource[indexPath.row];
    MJWeakSelf
    if (![@"nickname" isEqualToString:model.code]) {
        [self.view endEditing:YES];
    }
    if ([@"head" isEqualToString:model.code]) {
        [XJSelectPhoto selectPhotoWithActionSheet];
    }
    else if ([@"sex" isEqualToString:model.code] ||
             [@"in_school" isEqualToString:model.code] ||
             [@"emotion" isEqualToString:model.code]) {
        
        if ([@"in_school" isEqualToString:model.code]) {
            
            XJHeadModel *headModel = self.mutArray[1];
            XJEditInfoModel *model = [headModel.dataSource firstObject];
            if (model.showValue.length == 0) {
                [XJHud showInfoWithStatus:@"请选择学校"];
                return;
            }
        }
        [XJActionSheet showWithList:model.dataList clickItemBlock:^(NSDictionary *item) {
            model.value = item[@"code"];
            model.showValue = item[@"name"];
            if ([@"in_school" isEqualToString:model.code]) {
                
                XJHeadModel *headModel = self.mutArray[1];
                for (XJEditInfoModel *model in headModel.dataSource)
                {
                    if ([@"industry" isEqualToString:model.code] || [@"occupation" isEqualToString:model.code]) {
                        /// 变为不可点击
                        if ([@"1" isEqualToString:item[@"code"]]) {
                            model.titleColor = [UIColor descColor];
                            model.canNotClick = YES;
                            // 是否需要清空职业行业（当之前选择已毕业，选择过职业、行业，然后选择在校的时候）
                            if (model.showValue.length > 0) {
                                model.value = model.showValue = @"";
                            }
                        }
                        /// 变为可点击
                        else if ([@"2" isEqualToString:item[@"code"]]) {
                            model.titleColor = nil;
                            model.canNotClick = NO;
                        }
                    }
                }
                [weakSelf reloadSectionWithSection:1];
            }
            else {
                [weakSelf reloadRowWithIndexPath:indexPath];
            }
        }];
    }
    else if ([@"age" isEqualToString:model.code]) {
        
    }
    else if ([@"area" isEqualToString:model.code]) {
        
    }
    else if ([@"sign" isEqualToString:model.code]) {
        
    }
    else if ([@"PhotoWall" isEqualToString:model.code]) {
        
    }
    
    else if ([@"schoolAll" isEqualToString:model.code]) {
        XJEditSelectSchoolVC *vc = [[XJEditSelectSchoolVC alloc] init];
        vc.selectDataBlock = ^(NSDictionary *item) {
            model.value = item[@"id"];
            model.showValue = item[@"name"];
            [weakSelf reloadRowWithIndexPath:indexPath];
        };
        [self.navigationController pushViewController:vc animated:YES];
    }
//    else if ([@"in_school" isEqualToString:model.code]) {
//    }
    else if ([@"industry" isEqualToString:model.code] || [@"occupation" isEqualToString:model.code]) {
        if (!model.canNotClick) {
            NSLog(@"push");
            XJEditSelectDataVC *vc = [[XJEditSelectDataVC alloc] init];
            
            if ([@"industry" isEqualToString:model.code]) vc.selectType = XJSelect_Industry;
            else vc.selectType = XJSelect_Occupation;
            
            vc.selectDataBlock = ^(NSDictionary *item) {
                model.value = item[@"id"];
                model.showValue = item[@"name"];
                [weakSelf reloadRowWithIndexPath:indexPath];
            };
            XJNavigationController *nav = [[XJNavigationController alloc] initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
    }
    
//    else if ([@"emotion" isEqualToString:model.code]) {
//    }
    else if ([@"question" isEqualToString:model.code]) {
        
    }
}

#pragma mark - viewForHeaderInSection
-(UIView *)viewForHeaderInSection:(NSInteger)section
{
    XJHeadModel *headModel= self.mutArray[section];
    
    id obj = self.viewsForHeader[section];
    if ([obj isKindOfClass:[UIView class]]) {
        UIView *view = (UIView *)obj;
        /// 有变动的地方
        ((UIImageView *)[view viewWithTag:7]).image = [self getArrowImage:headModel];
        return view;
    }
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 74)];
    headerView.backgroundColor = [UIColor bgColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, Screen_Width, 50);
    btn.backgroundColor = [UIColor whiteColor];
    btn.tag = 100 + section;
    [headerView addSubview:btn];
    
    if (headModel.canClick) {
        [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *arrowIcon = [[UIImageView alloc] initWithImage:[self getArrowImage:headModel]];
        arrowIcon.centerX = Screen_Width - 20;
        arrowIcon.centerY = 25;
        arrowIcon.tag = 7;
        [headerView addSubview:arrowIcon];
    }
    
    UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, Screen_Width, 50)];
    titleLb.font = [UIFont systemFontOfSize:17];
    titleLb.textColor = [UIColor titleColor];
    titleLb.text = headModel.title;
    [headerView addSubview:titleLb];
    
    UILabel *descLb = [[UILabel alloc] initWithFrame:CGRectMake(15, btn.bottom, Screen_Width, 24)];
    descLb.font = [UIFont systemFontOfSize:14];
    descLb.textColor = [UIColor descColor];
    descLb.text = headModel.desc;
    [headerView addSubview:descLb];
    if (section == 2) {
        descLb.attributedText = [XJAppUtil highlightWithKeyword:@"*" originText:descLb.text];
    }
    [self.viewsForHeader replaceObjectAtIndex:section withObject:headerView];
    return headerView;
}

- (UIImage *)getArrowImage:(XJHeadModel *)headModel
{
    UIImage *image = headModel.isOpen ? [UIImage imageNamed:@"common_arrow_up"] : [UIImage imageNamed:@"common_arrow_down"];
    return image;
}

-(NSMutableArray *)viewsForHeader
{
    if (!_viewsForHeader) {
        _viewsForHeader = [[NSMutableArray alloc] init];
        for (int i = 0; i < self.mutArray.count; i++) {
            [_viewsForHeader addObject:@""];
        }
    }
    return _viewsForHeader;
}

- (void)clickAction:(UIButton *)btn
{
    NSInteger section = btn.tag - 100;
    XJHeadModel *headModel = self.mutArray[section];
    headModel.isOpen = !headModel.isOpen;
    [self.mTableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationNone];
    
    if (headModel.isOpen) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.mTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:headModel.dataSource.count - 1 inSection:section] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        });
    }
}

@end
