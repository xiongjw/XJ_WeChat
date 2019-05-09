//
//  XJPokerVC.m
//  XJ_WeChat
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XJPokerVC.h"

#import "XJPoker.h"

#import "XJAllPokerView.h"
#import "XJPokerView.h"

@interface XJPokerVC ()

@property (nonatomic,strong) NSMutableArray *allPokerArr;

@property (nonatomic,strong) NSMutableArray *lastPokerArr;

@end

@implementation XJPokerVC

- (void)createCards
{
    CGFloat posY = 60;
    XJAllPokerView *allPokerView = nil;
    for (int i = 0; i < self.lastPokerArr.count; i++) {
        NSMutableArray *mutArray = self.lastPokerArr[i];
        XJPokerPlayer *model = [[XJPokerPlayer alloc] init];
        model.pokers = mutArray.mutableCopy;
        MJWeakSelf
        allPokerView = [[XJAllPokerView alloc] initWithFrame:CGRectMake(0, posY, Screen_Width - 15, 90)];
        allPokerView.tag = 10000 + i;
        allPokerView.model = model;
        allPokerView.clickBlock = ^(NSString *pokerStr) {
            [weakSelf clickPokerWithIndex:i pokerStr:pokerStr];
        };
        [self.view addSubview:allPokerView];
        posY += 110;
    }
}

- (void)clickPokerWithIndex:(int)index pokerStr:(NSString *)pokerStr
{
    if (index > 2) {
        return;
    }
    XJAllPokerView *allPokerView = [self.view viewWithTag:10000 + index];
    XJPokerPlayer *model = allPokerView.model;
    [model.pokers removeObject:pokerStr];
    allPokerView.model = model;
}

- (void)reSend
{
    for (int i = 0; i < 4; i++) {
        UIView *view = [self.view viewWithTag:10000 + i];
        [view removeFromSuperview];
    }
    [self mixPoker:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showBackBtn:YES withTitle:@"斗地主"];
    
    [self mixPoker:YES];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, Screen_Height - NavHeight - 40, Screen_Width, 40);
    [btn setTitle:@"重新发牌" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(reSend) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)mixPoker:(BOOL)shuffleCards
{
    [self.lastPokerArr removeAllObjects];
    
    NSMutableArray *mixMutArray = [NSMutableArray new];
    
    if (shuffleCards) {
        NSMutableArray *copyMutArray = self.allPokerArr.mutableCopy;
        for (int i = 0; i < self.allPokerArr.count; i++)
        {
            NSString *randomStr = copyMutArray[arc4random() % copyMutArray.count];
            [mixMutArray addObject:randomStr];
            [copyMutArray removeObject:randomStr];
        }
        self.lastPokerArr = [self shuffleCards:mixMutArray];
    }
    else {
        NSMutableArray *copyMutArray = self.allPokerArr.mutableCopy;
        for (int i = 0; i < 17; i++)
        {
            NSString *randomStr = copyMutArray[arc4random() % copyMutArray.count];
            [mixMutArray addObject:randomStr];
            [copyMutArray removeObject:randomStr];
        }
        if (copyMutArray.count > 0) {
            [mixMutArray addObjectsFromArray:copyMutArray];
        }
        
        self.lastPokerArr = [self unShuffleCards:mixMutArray];
    }
    
    [self createCards];
}

/// 洗牌的话，每个人的牌分别是
- (NSMutableArray *)shuffleCards:(NSArray *)mixArr
{
    NSMutableArray *resultArray = [NSMutableArray new];
    
    NSMutableArray *firstArray = [NSMutableArray new];
    NSMutableArray *secondArray = [NSMutableArray new];
    NSMutableArray *thirdArray = [NSMutableArray new];
    
    for (int i = 0; i < mixArr.count - 3; i++) {
        if (i % 3 == 0) {
            [firstArray addObject:mixArr[i]];
        }
        else if (i % 3 == 1) {
            [secondArray addObject:mixArr[i]];
        }
        else {
            [thirdArray addObject:mixArr[i]];
        }
    }
    
    [resultArray addObject:[self sortCards:firstArray]];
    [resultArray addObject:[self sortCards:secondArray]];
    [resultArray addObject:[self sortCards:thirdArray]];
    
    /// 最后三张
    NSArray *lastArray = [mixArr subarrayWithRange:NSMakeRange(mixArr.count - 3, 3)];
    [resultArray addObject:lastArray];
    return resultArray;
}

/// 不洗牌，每个人的牌分别是
- (NSMutableArray *)unShuffleCards:(NSArray *)mixArr
{
    NSMutableArray *resultArray = [NSMutableArray new];
    NSMutableArray *sortArray = [[NSMutableArray alloc] initWithArray:mixArr];
    NSInteger location = arc4random() % (sortArray.count - 17);
    NSMutableArray *firstArray = [self sortCards:[sortArray subarrayWithRange:NSMakeRange(location, 17)]];
    [resultArray addObject:firstArray];
    [sortArray removeObjectsInArray:firstArray];
    
    location = arc4random() % (sortArray.count - 17);
    NSMutableArray *secondArray = [self sortCards:[sortArray subarrayWithRange:NSMakeRange(location, 17)]];
    [resultArray addObject:secondArray];
    [sortArray removeObjectsInArray:secondArray];
    
    location = arc4random() % (sortArray.count - 17);
    NSMutableArray *thirdArray = [self sortCards:[sortArray subarrayWithRange:NSMakeRange(location, 17)]];
    [resultArray addObject:thirdArray];
    [sortArray removeObjectsInArray:thirdArray];
    
    /// 最后三张
    [resultArray addObject:[self sortCards:sortArray]];

    return resultArray;
}

/// 发好牌之后，排序
- (NSMutableArray *)sortCards:(NSArray *)array
{
    NSMutableArray *sortArr = [NSMutableArray arrayWithArray:self.allPokerArr];
    for (NSString *str in self.allPokerArr) {
        if (![array containsObject:str]) {
            [sortArr removeObject:str];
        }
    }
    return sortArr;
}

-(NSMutableArray *)allPokerArr
{
    if (!_allPokerArr) {
        _allPokerArr = [[NSMutableArray alloc] initWithArray:@[@"大王",@"小王"]];
        NSArray *colorArr = @[@"黑",@"红",@"梅",@"方"];
        NSArray *numArr = @[@"2",@"A",@"K",@"Q",@"J",@"10",@"9",@"8",@"7",@"6",@"5",@"4",@"3"];
        
        for (NSString *numStr in numArr) {
            for (NSString *colorStr in colorArr) {
                [_allPokerArr addObject:FormatString(@"%@%@",colorStr, numStr)];
            }
        }
        
    }
    return _allPokerArr;
}

@end
