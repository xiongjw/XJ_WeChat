//
//  XJBaseTableVC.h
//  XJ_WeChat
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJBaseTableVC : XJBaseVC <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *mTableView;

@property (nonatomic,strong) NSMutableArray *mutArray;
@property (nonatomic,strong) NSArray *array;


- (void)headerBeginRefreshing;
- (void)endRefreshing;

- (void)addHeaderAction;
- (void)addFooterAction;
- (void)addHeaderAndFooterAction;

@end
