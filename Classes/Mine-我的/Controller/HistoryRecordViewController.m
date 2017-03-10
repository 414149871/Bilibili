//
//  HistoryRecordViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/4.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "HistoryRecordViewController.h"
#import "SearchTopicZongHeTableViewCell.h"
#import "Home_TuiJian_DataBase.h"
#import "Home_TuiJian_FMDBase.h"

@interface HistoryRecordViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView  *tableView;
@property (nonatomic,strong)NSMutableArray  *dataSource;
@end

@implementation HistoryRecordViewController
- (UITableView *)tableView{
    
    if(!_tableView){
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 100;
        _tableView.backgroundColor = RLGrayBgColor;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

- (NSMutableArray *)dataSource{
    
    if(!_dataSource){
        
//        _dataSource = [NSMutableArray arrayWithArray:[Home_TuiJian_DataBase find]];
        _dataSource = [NSMutableArray arrayWithArray:[Home_TuiJian_FMDBase find]];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = RLCommonBgColor;
    //导航栏设置
    [self navigationBar];
    [self.view addSubview:self.tableView];
    
}

#pragma mark 导航栏设置
- (void)navigationBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"music_sound_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.title = @"历史记录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icnav_trash_light"] style:UIBarButtonItemStylePlain target:self action:@selector(deleteAction:)];
}

#pragma mark 响应事件
- (void)backAction:(UIBarButtonItem *)sender{

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)deleteAction:(UIBarButtonItem *)sender{

    for (int i= 0; i < self.dataSource.count; i++) {
//        [Home_TuiJian_DataBase deletModel:self.dataSource[i]];
        [Home_TuiJian_FMDBase deleteModel:self.dataSource[i]];
    }
    
//    self.dataSource = [NSMutableArray arrayWithArray:[Home_TuiJian_DataBase find]];
    
    self.dataSource = [NSMutableArray arrayWithArray:[Home_TuiJian_FMDBase find]];
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchTopicZongHeTableViewCell *cell = [SearchTopicZongHeTableViewCell cellWithTableView:tableView];
    cell.bodyModel = self.dataSource[indexPath.row];
    return cell;
}



@end









































































