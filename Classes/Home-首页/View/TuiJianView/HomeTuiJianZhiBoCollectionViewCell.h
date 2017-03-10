//
//  HomeTuiJianZhiBoCollectionViewCell.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/26.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
#import "ZhiBoHomeDataModels.h"
#import "ZBHDataModels.h"

@interface HomeTuiJianZhiBoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cover;

@property (weak, nonatomic) IBOutlet UILabel *play;

@property (weak, nonatomic) IBOutlet UILabel *danmaku;

@property (weak, nonatomic) IBOutlet UIImageView *danmukuImageView;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *refreshNewImageWidth;

@property (weak, nonatomic) IBOutlet UIImageView *coverBottomImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverHight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverBottomHight;

@property (nonatomic,strong)NSIndexPath  *indexPath;

@property (nonatomic,strong)NSArray  *bodyArray;
//推荐直播model
@property (nonatomic,strong)Body  *tuiJianZhiBoModel;

//推荐番剧
@property (nonatomic,strong)Body  *tuiJianFanJuModel;

//设置首页直播其他分区model
@property (nonatomic,strong)NRDLives  *lives;
@property (nonatomic,strong)NSIndexPath  *livesIndexPath;

//设置首页直播分区model
@property (nonatomic,strong)ZBHBannerData  *zbhBannerData;
@property (nonatomic,strong)ZBHLives  *zbhLives;
@property (nonatomic,strong)NSMutableArray  *firstSectionCellDataSource;
@property (nonatomic,strong)NSIndexPath  *firstSectionCellIndexPath;


@end





































































