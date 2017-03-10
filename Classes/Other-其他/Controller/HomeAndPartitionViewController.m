//
//  HomeAndPartitionViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/23.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "HomeAndPartitionViewController.h"

@interface HomeAndPartitionViewController ()

@end

@implementation HomeAndPartitionViewController

//标题栏scrollView
- (SelecterToolsScrollView *)selecterToolsScrollView{
    
    if(!_selecterToolsScrollView){
        
        __weak typeof(self) weakSelf = self;
        CGRect frame = CGRectMake(0, 0, ScreenWidth*3/5, 35);
        _selecterToolsScrollView = [[SelecterToolsScrollView alloc] initWithFrame:frame  SelecterConditionTitleArray:self.titleArray andTypeStyle:homeStyle andBtnBlock:^(UIButton *btn) {
            
            [weakSelf updateVCViewFrom:btn.tag - 300];
        }];
    }
    return _selecterToolsScrollView;
}

//创建内容控制器
- (SelecterContentScrollView *)selecterContentScrollView{
    
    if(!_selecterContentScrollView){
        
        __weak typeof(self) weakSelf = self;
        CGRect frame = CGRectMake(0, 64, ScreenWidth, ScreenHeight-64-49);
        _selecterContentScrollView = [[SelecterContentScrollView alloc] initWithFrame:frame SelecterConditionVCArray:self.vcArray  withStyle:homeStyle andBtnBlock:^(int num) {
            
            [weakSelf updateSelecterToolsIndex:num];
        }];
    }
    return _selecterContentScrollView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.titleView = self.selecterToolsScrollView;
    [self.view addSubview:self.selecterContentScrollView];
    
}

//更新控制器
- (void)updateVCViewFrom:(NSInteger)index{
    
    [self.selecterContentScrollView updateVCViewFromIndex:index];
}
//更新顶部scrollView
- (void)updateSelecterToolsIndex:(NSInteger)index{
    
    [self.selecterToolsScrollView updateSelecterToolsIndex:index];
}
@end
