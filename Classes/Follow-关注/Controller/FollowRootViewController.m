//
//  FollowRootViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/19.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "FollowRootViewController.h"
@interface FollowRootViewController ()<UIScrollViewDelegate>

@end

@implementation FollowRootViewController
//还没登录
- (NotLoginViewFollow *)notLoginFollowView{
    
    if(!_notLoginFollowView){
        
        _notLoginFollowView = [NotLoginViewFollow initWithCustom];
        _notLoginFollowView.VC = self;
    }
    return _notLoginFollowView;
}

- (UIScrollView *)mainScrollView{
    
    if(!_mainScrollView){
        
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight+5.0)];
        _mainScrollView.contentSize = CGSizeMake(0, ScreenHeight+10);
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.delegate = self;
        [_mainScrollView addSubview:self.notLoginFollowView];
    }
    return _mainScrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y > 1) {
        self.mainScrollView.backgroundColor = RLColor(241, 241, 241);
    }
    else if (scrollView.contentOffset.y <= 0){
        self.mainScrollView.backgroundColor = RLCommonBgColor;
    }
}

@end



























































