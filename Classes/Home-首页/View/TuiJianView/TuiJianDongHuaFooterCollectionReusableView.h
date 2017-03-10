//
//  TuiJianDongHuaFooterCollectionReusableView.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/27.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
@interface TuiJianDongHuaFooterCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

@property (nonatomic,strong)Bottom  *bottom;

//设置番剧 -- 新番连载尾部区域
@property (nonatomic,strong)NSMutableArray  *adMArray;
@end
