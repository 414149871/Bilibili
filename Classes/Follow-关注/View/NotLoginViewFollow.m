//
//  NotLoginViewFollow.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/19.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "NotLoginViewFollow.h"
#import "LoginAndRegisterViewController.h"

@implementation NotLoginViewFollow

+ (instancetype)initWithCustom{

    NotLoginViewFollow *notLoginFollowView = [[[NSBundle mainBundle] loadNibNamed:@"NotLoginViewFollow" owner:nil options:nil] objectAtIndex:0];
    notLoginFollowView.RL_Width = ScreenWidth;
    notLoginFollowView.backgroundColor = RLColor(241, 241, 241);
    return notLoginFollowView;
}

- (IBAction)loginAction:(UIButton *)sender {
    
    LoginAndRegisterViewController *loginAndRegisterVC = [[LoginAndRegisterViewController alloc] init];
    UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:loginAndRegisterVC];
    [_VC presentViewController:loginNav animated:YES completion:^{
        
    }];
}


@end
