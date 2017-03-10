//
//  RLNavigationController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/16.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RLNavigationController.h"

@interface RLNavigationController ()

@end

@implementation RLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置导航栏背景颜色
    [[UINavigationBar appearance] setBarTintColor:RLCommonBgColor];
    //设置item颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //设置导航栏标题字体颜色、大小
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //是否为半透明,默认为 YES, NO为不显示半透明状态(不设置会导致导航栏颜色与实际颜色有差别)
//    self.navigationBar.translucent = NO;
    
    //添加一张空白图片去掉中间分割线
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
}

@end



















































































