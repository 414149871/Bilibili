//
//  RLTabBarViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/16.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RLTabBarViewController.h"
#import "HomeViewController.h"
#import "PartitionViewController.h"
#import "FollowViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"
#import "RLNavigationController.h"

@interface RLTabBarViewController ()

@end

@implementation RLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //是否为半透明,默认为 YES, NO为不显示半透明状态（不要用这个，会导致坐标系混乱）
//    self.tabBar.translucent = NO;
    
    //设置tabBar背景颜色
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    /** 设置子视图控制器 */
    [self setUpViewController];
}

/** 设置子视图控制器 */
- (void)setUpViewController{
    
    [self setUpOneChildController:[[RLNavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]] Title:nil Image:@"home_home_tab" SelectedImage:@"home_home_tab_s"];
    
    [self setUpOneChildController:[[RLNavigationController alloc] initWithRootViewController:[[PartitionViewController alloc] init]] Title:nil Image:@"home_category_tab" SelectedImage:@"home_category_tab_s"];
    
    [self setUpOneChildController:[[RLNavigationController alloc] initWithRootViewController:[[FollowViewController alloc] init]] Title:nil Image:@"home_attention_tab" SelectedImage:@"home_attention_tab_s"];
    
    [self setUpOneChildController:[[RLNavigationController alloc] initWithRootViewController:[[DiscoverViewController alloc] init]] Title:nil Image:@"home_discovery_tab" SelectedImage:@"home_discovery_tab_s"];
    
    [self setUpOneChildController:[[RLNavigationController alloc] initWithRootViewController:[[MineViewController alloc] init]] Title:nil Image:@"home_mine_tab" SelectedImage:@"home_mine_tab_s"];
}

/**
 *  初始化一个子视图控制器
 *
 *  @param vc     子视图控制器类名
 *  @param title         标题
 *  @param image         图标
 *  @param selectedImage 选中图标
 */
- (void)setUpOneChildController:(UIViewController *)vc Title:(NSString *)title Image:(NSString *)image SelectedImage:(NSString *)selectedImage{
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    CGFloat offset = 5.0;
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
    
    [self addChildViewController:vc];
}

@end




































































