//
//  HomeViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/16.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "HomeViewController.h"
#import "ZhiBoViewController.h"
#import "TuiJianViewController.h"
#import "FanjuViewController.h"

@interface HomeViewController ()

@end


@implementation HomeViewController
@synthesize vcArray = _vcArray;
@synthesize titleArray = _titleArray;

- (NSArray *)titleArray{
    
    if(!_titleArray){
        _titleArray = @[@"直播",@"推荐",@"番剧"];
    }
    return _titleArray;
}

- (NSMutableArray *)vcArray{
    
    if(!_vcArray){
        
        ZhiBoViewController *zhiBoVC = [ZhiBoViewController new];
        TuiJianViewController *tuiJianVC = [TuiJianViewController new];
        FanjuViewController *fanJuVC = [FanjuViewController new];
        [self addChildViewController:zhiBoVC];
        [self addChildViewController:tuiJianVC];
        [self addChildViewController:fanJuVC];
        _vcArray = [NSMutableArray arrayWithObjects:zhiBoVC,tuiJianVC,fanJuVC, nil];
    }
    return _vcArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


@end







































































