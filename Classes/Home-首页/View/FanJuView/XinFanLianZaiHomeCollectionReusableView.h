//
//  XinFanLianZaiHomeCollectionReusableView.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/11.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuiJianHeaderButton.h"
#import "RLScrollPic.h"

@interface XinFanLianZaiHomeCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIView *scrollBgView;

@property (weak, nonatomic) IBOutlet TuiJianHeaderButton *tuiJianHeaderBtn;

@property (nonatomic,strong)NSMutableArray  *adMArray;  //顶部滚动图片数据源
@property (nonatomic,strong)RLScrollPic *scrollPic;
@end















































































