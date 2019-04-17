//
//  XJBaseTableVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJBaseTableVC.h"

@interface XJBaseTableVC ()

@end

@implementation XJBaseTableVC

-(UITableViewStyle)tableViewStyle
{
    return UITableViewStylePlain;
}

#pragma mark - user method
- (void)addHeaderAction
{
    MJWeakSelf
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf requestWithRefresh:YES];
    }];
    header.stateLabel.font = [UIFont systemFontOfSize:12.f];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"释放更新" forState:MJRefreshStatePulling];
    [header setTitle:@"小主别急，努力刷新中" forState:MJRefreshStateRefreshing];
    self.mTableView.mj_header = header;
}

- (void)addFooterAction
{
    MJWeakSelf
    MJRefreshAutoNormalFooter *mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf requestWithRefresh:NO];
    }];
    mj_footer.hidden = YES;
    //mj_footer.stateLabel.hidden = YES;
    mj_footer.stateLabel.font = [UIFont systemFontOfSize:12.f];
    self.mTableView.mj_footer = mj_footer;
}

- (void)addHeaderAndFooterAction
{
    [self addHeaderAction];
    [self addFooterAction];
}

- (void)headerBeginRefreshing {
    [self.mTableView.mj_header beginRefreshing];
}

- (void)endRefreshing
{
    if (self.mTableView.mj_header.isRefreshing) {
        [self.mTableView.mj_header endRefreshing];
    }
    if (self.mTableView.mj_footer.isRefreshing) {
        [self.mTableView.mj_footer endRefreshing];
    }
}

#pragma mark -  util
- (void)reloadRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self.mTableView reloadRowsAtIndexPaths:@[indexPath]
                           withRowAnimation:UITableViewRowAnimationNone];
}

- (void)reloadSectionWithSection:(NSInteger)section
{
    [self.mTableView reloadSections:[NSIndexSet indexSetWithIndex:section]
                   withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark -  system method
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.mTableView];
}

-(NSMutableArray *)mutArray
{
    if (_mutArray == nil) {
        _mutArray = [[NSMutableArray alloc] init];
    }
    return _mutArray;
}

-(UITableView *)mTableView
{
    if (!_mTableView) {
        _mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - NavHeight) style:self.tableViewStyle];
        _mTableView.separatorColor = [UIColor lineColor];
        //_mTableView.tag = 99;
        _mTableView.dataSource = self;
        _mTableView.delegate = self;
        
        [_mTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        _mTableView.backgroundColor = [UIColor clearColor];
        _mTableView.backgroundView = nil;
        _mTableView.tintColor = [UIColor themeColor];
        
        if (@available(iOS 11.0, *)) {
            _mTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _mTableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
