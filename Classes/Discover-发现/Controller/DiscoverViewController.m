//
//  DiscoverViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/16.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "DiscoverViewController.h"
#import "AFNetWorkRequest.h"
#import "DiscoverTopSearchButton.h"
#import "Discover_AllSearchView.h"
#import "ZongheSelectedView.h"
#import "DiscoverTableViewCell.h"

@interface DiscoverViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)Discover_AllSearchView  *allSearchView;
@property (nonatomic,strong)UITableView  *tableView;
@property (nonatomic,strong)NSMutableArray  *dataSource;
@end

@implementation DiscoverViewController
- (Discover_AllSearchView *)allSearchView{
    if(!_allSearchView){
        
        _allSearchView = [Discover_AllSearchView initCustomWithFrame:CGRectMake(0, 64, ScreenWidth, 136)];
        //调整 收起 和 查看更多的设置
        __weak typeof(_allSearchView) weakAllSearchView = _allSearchView;
        __weak typeof(self) weakSelf = self;
        _allSearchView.block = ^(BOOL isSelected){
            
            weakSelf.tableView.RL_y = weakAllSearchView.RL_bottom;
            weakSelf.tableView.RL_Height = ScreenHeight - 49 - weakAllSearchView.RL_bottom;
        };
    }
    return _allSearchView;
}

- (UITableView *)tableView{
    if(!_tableView){
        
        CGFloat y = self.allSearchView.RL_bottom;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, y, ScreenWidth, ScreenHeight - y - 49 ) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = RLCommonBgColor;
    }
    return _tableView;
}

//数据源
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"DiscoverList" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _dataSource = [NSMutableArray arrayWithObjects:@[array[0],array[1],array[2]],
                       @[array[3],array[4]],@[array[5],array[6]], nil];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏设置
    [self navigationBar];
    //网络请求
    [self netWorkRequest];
    //大家都在搜索
    [self.view addSubview:self.allSearchView];
    [self.view addSubview:self.tableView];
}

//重新刷新tableview第一分区第一行，使得右边imageView做动画
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark 网络请求
- (void)netWorkRequest{
    
    NSString *urlString = @"http://s.search.bilibili.com/main/hotword?actionKey=appkey&appkey=27eb53fc9058f8c3&build=3940&device=phone&mobi_app=iphone&platform=ios&sign=29237baace45c0fe8b15fc644ff44778&ts=1477039516";
    [AFNetWorkRequest getRequestWithUrl:urlString result:^(id result) {
        
        self.allSearchView.dictionary = result;
    }];
}

#pragma mark 导航栏设置
- (void)navigationBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_qr"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    DiscoverTopSearchButton *topSearchBtn = [DiscoverTopSearchButton setUpWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, 30)];
    topSearchBtn.imgName = @"misc_search";
    topSearchBtn.titleString = @"搜索视频、番剧、up主或AV号";
    self.navigationItem.titleView = topSearchBtn;
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.dataSource[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = self.dataSource[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    DiscoverTableViewCell *cell = [DiscoverTableViewCell cellWithTableView:tableView withIndexPath:indexPath];
    cell.dic = dic;
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    else
        return 15;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 15)];
    view.backgroundColor = RLColor(241, 241, 241);
    return view;
}

#pragma mark ScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.y >1) {
        self.tableView.backgroundColor = RLColor(241, 241, 241);
    }
    else if (scrollView.contentOffset.y <= 0){
        self.tableView.backgroundColor = RLCommonBgColor;
    }
}

@end









































































































