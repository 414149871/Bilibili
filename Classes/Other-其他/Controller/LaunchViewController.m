//
//  LaunchViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/20.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()<CAAnimationDelegate>
//设置开机动画界面
@property (nonatomic,strong)UIImageView  *bgImageView;
@property (nonatomic,strong)UIImageView  *playImageView;
@end

@implementation LaunchViewController
- (UIImageView *)bgImageView{
    
    if(!_bgImageView){
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _bgImageView.image = [UIImage imageNamed:@"bilibili_splash_iphone_bg"];
    }
    return _bgImageView;
}

- (UIImageView *)playImageView{
    
    if(!_playImageView){
        _playImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight/2-100, 1, 1.3)];
        _playImageView.image = [UIImage imageNamed:@"bilibili_splash_default"];
    }
    return _playImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.playImageView];
    [self performSelector:@selector(animationLunch) withObject:self afterDelay:0];
}

#pragma mark 开机动画
- (void)animationLunch{
    
    CGFloat duration = 1.5;
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @1;
    scale.toValue = @(ScreenWidth - 40);
    scale.duration = duration;
    scale.repeatCount = 1;
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.fromValue = @0;
    opacity.toValue = @1;
    opacity.duration = duration;
    scale.repeatCount = 1;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scale,opacity];
    animationGroup.duration = duration;
    animationGroup.repeatCount = 1;
    //如果是一个动画CAAnimation,则需要将其removedOnCompletion设置为NO,要不然fillMode不起作用
    animationGroup.removedOnCompletion = NO;
    //决定当前在非active时间段的行为,比如动画开始之前,动画结束之后
    animationGroup.fillMode =kCAFillModeForwards;
    animationGroup.delegate = self;
    [self.playImageView.layer addAnimation:animationGroup forKey:nil];
}

#pragma mark CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [NSThread sleepForTimeInterval:2.0];
    //移除开机动画
    [self.bgImageView removeFromSuperview];
}


@end




























































