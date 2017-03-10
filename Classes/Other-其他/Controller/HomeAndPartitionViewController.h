//
//  HomeAndPartitionViewController.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/23.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RootViewController.h"
#import "SelecterToolsScrollView.h"
#import "SelecterContentScrollView.h"

@interface HomeAndPartitionViewController : RootViewController

@property (nonatomic,strong)NSArray  *titleArray;
@property (nonatomic,strong)NSMutableArray  *vcArray;
@property (nonatomic,strong)SelecterToolsScrollView  *selecterToolsScrollView;
@property (nonatomic,strong)SelecterContentScrollView  *selecterContentScrollView;

@end
