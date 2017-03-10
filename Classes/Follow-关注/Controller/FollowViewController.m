//
//  FollowViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/16.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "FollowViewController.h"
#import "ZhuiFanFollowViewController.h"
#import "DongTaiFollowViewController.h"
#import "BiaoQianFollowViewController.h"

@interface FollowViewController ()

@end

@implementation FollowViewController
@synthesize titleArray = _titleArray;
@synthesize vcArray = _vcArray;

- (NSArray *)titleArray{
    
    if(!_titleArray){
        _titleArray = @[@"追番",@"动态",@"标签"];
    }
    return _titleArray;
}

- (NSMutableArray *)vcArray{
    
    if(!_vcArray){
        
        ZhuiFanFollowViewController *zhuiFanVC = [ZhuiFanFollowViewController new];
        DongTaiFollowViewController *dongTaiVC = [DongTaiFollowViewController new];
        BiaoQianFollowViewController *biaoQianVC = [BiaoQianFollowViewController new];
        [self addChildViewController:zhuiFanVC];
        [self addChildViewController:dongTaiVC];
        [self addChildViewController:biaoQianVC];
        _vcArray = [NSMutableArray arrayWithObjects:zhuiFanVC,dongTaiVC,biaoQianVC, nil];
    }
    return _vcArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
@end




















































































