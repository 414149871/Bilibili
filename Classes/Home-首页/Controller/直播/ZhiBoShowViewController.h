//
//  ZhiBoShowViewController.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/15.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RootViewController.h"
#import "ZBHDataModels.h"
#import "ZhiBoHomeDataModels.h"

@interface ZhiBoShowViewController : RootViewController

@property (weak, nonatomic) IBOutlet UIView *playView;

@property (weak, nonatomic) IBOutlet UIImageView *face;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *master_level;

@property (weak, nonatomic) IBOutlet UIButton *uname;

@property (weak, nonatomic) IBOutlet UILabel *online;

@property (weak, nonatomic) IBOutlet UILabel *attention;

@property (weak, nonatomic) IBOutlet UIButton *attentionBtn;

@property (weak, nonatomic) IBOutlet UITextField *danmakuTextField;

//选择view
@property (weak, nonatomic) IBOutlet UIView *selectedView;

@property (weak, nonatomic) IBOutlet UIButton *huDongBtn;

@property (weak, nonatomic) IBOutlet UIButton *chongNengBangBtn;

@property (weak, nonatomic) IBOutlet UIButton *qiRiBangBtn;

@property (weak, nonatomic) IBOutlet UIButton *fansBang;

@property (weak, nonatomic) IBOutlet UIView *selectedBottomView;

//详情view
@property (weak, nonatomic) IBOutlet UIView *xiangQingView;

//处理数据
@property (nonatomic,strong)ZBHBannerData *ZBHBanner;
@property (nonatomic,strong)ZBHLives *ZBHLives;
@property (nonatomic,strong)NRDLives *NRDLives;

@property (nonatomic,assign)double roomId;
@property (nonatomic,strong)NSString  *playurl;


@end


































































