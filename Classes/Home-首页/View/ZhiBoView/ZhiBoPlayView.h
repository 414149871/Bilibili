//
//  ZhiBoPlayView.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/16.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZhiBoShowView;

//@protocol ZhiBoPlayViewDelegate <NSObject>
//
//- (void)shareAction:(UIButton *)sender;
//@end

@interface ZhiBoPlayView : UIView

@property (nonatomic,strong)UIImageView *topImageView;  //bilibili图片
@property (nonatomic,strong)UIImageView *bottomImageView;

@property (nonatomic,strong)UIButton *playBtn;  //播放按钮
@property (nonatomic,strong)UIButton *bigBtn;   //拓展变大按钮
@property (nonatomic,strong)UIButton *tvPlayBtn;//电视播放按钮
@property (nonatomic,strong)UIButton *shareBtn; //分享按钮

@property (nonatomic,strong)ZhiBoShowView  *zhiBoShowView;

//@property (nonatomic,weak)id<ZhiBoPlayViewDelegate>  delegate;
//@property (nonatomic,strong)UIViewController  *viewController;
//@property (nonatomic,strong)UIView  *shareShowAlertView;    //分享提示view
//@property (nonatomic,weak)UIAlertController *alertC;

@end


















