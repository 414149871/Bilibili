//
//  ZhiBoPlayView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/16.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "ZhiBoPlayView.h"
#import "ZhiBoShowView.h"

@implementation ZhiBoPlayView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        //顶部图片
        _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 0, 80, 24)];
        _topImageView.image = [UIImage imageNamed:@"live_bilih_ico"];
        [self addSubview:_topImageView];
        
        //底部图片
        _bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 160, ScreenWidth, 40)];
        _bottomImageView.image = [UIImage imageNamed:@"live_bottom_bg"];
        _bottomImageView.userInteractionEnabled = YES;
        [self addSubview:_bottomImageView];
        
        //拓展变大按钮
        _bigBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bigBtn setImage:[UIImage imageNamed:@"player_fullScreen_iphone"] forState:UIControlStateNormal];
        _bigBtn.frame = CGRectMake(ScreenWidth - 40, 168, 31, 22);
        [self addSubview:_bigBtn];
        
        //播放按钮
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setImage:[UIImage imageNamed:@"player_play_bottom_window"] forState:UIControlStateNormal];
        _playBtn.frame = CGRectMake(8, 168, 31, 22);
        [_playBtn addTarget:self action:@selector(playBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_playBtn];

        //电视播放按钮
        _tvPlayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tvPlayBtn setImage:[UIImage imageNamed:@"player_play_c"] forState:UIControlStateNormal];
        [_tvPlayBtn setImage:[UIImage imageNamed:@"player_pause"] forState:UIControlStateSelected];
        _tvPlayBtn.frame = CGRectMake(ScreenWidth - 58, 130, 50, 31);
        [_tvPlayBtn addTarget:self action:@selector(playBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _tvPlayBtn.selected = NO;
        [self addSubview:_tvPlayBtn];
        
        //分享按钮
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setImage:[UIImage imageNamed:@"live_more_normal_portrait"] forState:UIControlStateNormal];
        _shareBtn.frame = CGRectMake(ScreenWidth - 40, 30, 30, 22);
//        [_shareBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_shareBtn];
    }
    return self;
}

#pragma mark 响应事件
- (void)playBtnAction:(UIButton *)sender{

    sender.selected = !sender.selected;
    _tvPlayBtn.selected = sender.selected;
    _playBtn.selected = sender.selected;
    
    if (![_zhiBoShowView.player isPlaying]) {
        [_zhiBoShowView.player play];
    }else{
        [_zhiBoShowView.player pause];
    }
}

//分享
//- (void)shareBtnAction:(UIButton *)sender{
//
//    if ([self.delegate respondsToSelector:@selector(shareAction:)]) {
//        [self.delegate shareAction:sender];
//    }
//}
//
//
////懒加载
////分享提示view
//- (UIView *)shareShowAlertView{
//    
//    if(!_shareShowAlertView){
//        
//        _shareShowAlertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
//        _shareShowAlertView.backgroundColor = [UIColor blackColor];
//        _shareShowAlertView.alpha = 0.3;
//        _shareShowAlertView.hidden = YES;
//        
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//        
//        UIAlertAction *shareAction = [UIAlertAction actionWithTitle:@"分享" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            RLLog(@"分享");
//        }];
//        [alertController addAction:shareAction];
//        
//        UIAlertAction *reportAction = [UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            RLLog(@"举报");
//        }];
//        [alertController addAction:reportAction];
//        
//        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            RLLog(@"取消");
//        }];
//        [alertController addAction:cancleAction];
//        
//        //修改按钮字体颜色
//        [shareAction setValue:RLCommonBgColor forKey:@"titleTextColor"];
//        [reportAction setValue:RLCommonBgColor forKey:@"titleTextColor"];
//        [cancleAction setValue:RLCommonBgColor forKey:@"titleTextColor"];
////        [_viewController presentViewController:alertController animated:YES completion:^{
////            
////        }];
//        
//        self.alertC = alertController;
//        
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//        [_shareShowAlertView addGestureRecognizer:tapGesture];
//    }
//    return _shareShowAlertView;
//}
//
//- (void)tapAction:(UITapGestureRecognizer *)sender{
//
//    _shareShowAlertView.hidden = YES;
//}

@end

























