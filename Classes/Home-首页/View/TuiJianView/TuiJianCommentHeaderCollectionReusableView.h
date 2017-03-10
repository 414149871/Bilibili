//
//  TuiJianCommentHeaderCollectionReusableView.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/25.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuiJianHeaderButton.h"
#import "DataModels.h"
#import "ZhiBoHomeDataModels.h"
@interface TuiJianCommentHeaderCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet TuiJianHeaderButton *tuiJianHeaderBtn;

@property (nonatomic,strong)NSIndexPath  *indexPath;

@property (nonatomic,strong)Ext  *ext;

//设置主页直播分区header内容
@property (nonatomic,strong)NSIndexPath  *tuijianHomeIndexPath;
@property (nonatomic,strong)NRDPartitions  *partitions;

//设置主页番剧header内容
@property (nonatomic,strong)NSIndexPath  *fanjuHomeIndexPath;

@end













































































