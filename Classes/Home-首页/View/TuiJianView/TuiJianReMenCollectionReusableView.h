//
//  TuiJianReMenCollectionReusableView.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/25.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuiJianHeaderButton.h"
#import "RLScrollPic.h"

@interface TuiJianReMenCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIView *scrollBgView;  //滚动视图底部view

@property (weak, nonatomic) IBOutlet TuiJianHeaderButton *tuiJianHeaderBtn; //热门推荐按钮

@property (nonatomic,strong)NSMutableArray  *bannerTopImageMArray;  //顶部滚动图片数组

@property (nonatomic,strong)RLScrollPic *scrollPic;

@end








