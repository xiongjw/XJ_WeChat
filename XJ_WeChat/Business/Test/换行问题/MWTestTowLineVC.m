//
//  MWTestTowLineVC.m
//  SXMoWan
//
//  Created by mac on 2019/4/1.
//  Copyright © 2019 SX. All rights reserved.
//

#import "MWTestTowLineVC.h"

#import "MWTestTowLineCell.h"

@interface MWTestTowLineVC ()

@end

@implementation MWTestTowLineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showBackBtn:YES withTitle:@"换行问题处理"];
    
    [self.mTableView registerClass:[MWTestTowLineCell class] forCellReuseIdentifier:@"MWTestTowLineCell"];
    
    for (int i = 0; i < 5; i++) {
        if (i == 0) {
            [self.mutArray addObject:@{@"text":@"要始终保持敬畏之心,对阳光，对美，对痛楚"}];
        }
        else if (i == 1) {
            [self.mutArray addObject:@{@"text":@"没有比当傻瓜更简单的事了,为一件事疯狂，总有一天可以从中找到答案找到答案"}];
        }
        else if (i == 2) {
            [self.mutArray addObject:@{@"text":@"任何变化都不是突然发生的,都是自己无意间一点一点选择的"}];
        }
        else if (i == 3) {
            [self.mutArray addObject:@{@"text":@"山有木兮卿有意,昨夜星辰恰似你/山有木兮卿有意,昨夜星辰恰似你/山有木兮卿有意,昨夜星辰恰似你"}];
        }
        else if (i == 4) {
            [self.mutArray addObject:@{@"text":@"山有木兮卿有意,昨夜星辰恰似你山有木兮卿有意,昨夜星辰恰似你山有木兮卿有意,昨夜星辰恰似你山有木兮卿有意,昨夜星辰恰似你"}];
        }
        else {
            [self.mutArray addObject:@{@"text":@"世上最宝贵之物，是两心相悦的情爱,绝非价值连城的宝藏"}];
        }
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mutArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MWTestTowLineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MWTestTowLineCell" forIndexPath:indexPath];
    cell.data = self.mutArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 10 + 18 + 10 + 18 + 10;
}

@end
