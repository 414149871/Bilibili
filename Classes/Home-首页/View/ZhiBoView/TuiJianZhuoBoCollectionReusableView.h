//
//  TuiJianZhuoBoCollectionReusableView.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/9.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLScrollPic.h"
#import "TuiJianHeaderButton.h"
#import "ZBHDataModels.h"
@interface TuiJianZhuoBoCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIView *scrollBgView;

@property (weak, nonatomic) IBOutlet TuiJianHeaderButton *tuiJianHeaderBtn;

@property (nonatomic,strong)NSMutableArray  *bannerTopImageMArray;  //顶部滚动图片数组

@property (nonatomic,strong)RLScrollPic *scrollPic;

@property (nonatomic,strong)UIImageView *imageView;

@property (nonatomic,strong)ZBHRecommendData  *recommendData;

@end











































































