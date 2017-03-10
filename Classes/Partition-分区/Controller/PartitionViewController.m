//
//  PartitionViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/16.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "PartitionViewController.h"
#import "PartitionView.h"

@interface PartitionViewController ()<PartitionViewDelegate>

@end

@implementation PartitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"分区";
    [self setPartitionViewLayout];
}

- (void)setPartitionViewLayout{
    
    PartitionView *partitionView = [[PartitionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64-49+5)];
    partitionView.delegate = self;
    [self.view addSubview:partitionView];
}

#pragma mark PartitionViewDelegate
- (void)partitionBtnAction:(UIButton *)sender{
    
    NSLog(@"%ld",(long)sender.tag);
}

@end


















































































