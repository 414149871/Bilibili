//
//  FollowRootViewController.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/19.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RootViewController.h"
#import "NotLoginViewFollow.h"

@interface FollowRootViewController : RootViewController

@property (nonatomic,strong)NotLoginViewFollow  *notLoginFollowView;
@property (nonatomic,strong)UIScrollView  *mainScrollView;

@end
