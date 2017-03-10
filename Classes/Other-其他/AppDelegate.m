//
//  AppDelegate.m
//  Bilibili
//
//  Created by 刘嘉豪 on 16/10/13.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "AppDelegate.h"
#import "RLTabBarViewController.h"
#import "LaunchViewController.h"
 #import <SMS_SDK/SMSSDK.h>

@interface AppDelegate ()<CAAnimationDelegate>

@property (nonatomic,strong)LaunchViewController  *launchVC;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = RLCommonBgColor;
    //显示窗口
    [self.window makeKeyAndVisible];
    //设置根视图控制器
    self.window.rootViewController = [[RLTabBarViewController alloc] init];

    _launchVC = [[LaunchViewController alloc] init];
    //添加到场景
    [self.window addSubview:_launchVC.view];
    //放到最顶层
    [self.window bringSubviewToFront:_launchVC.view];
    [self performSelector:@selector(removeLunch) withObject:self afterDelay:2.0];
    
    //初始化应用，appKey和appSecret从后台申请得
    [SMSSDK registerApp:mobAppKey withSecret:mobAppSecret];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark 移除开机动画
- (void)removeLunch{
    
    [_launchVC.view removeFromSuperview];
    
    //http://blog.csdn.net/yungeios/article/details/52095016
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

@end








































