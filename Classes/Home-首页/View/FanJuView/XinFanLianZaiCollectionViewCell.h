//
//  XinFanLianZaiCollectionViewCell.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/11.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FJHDataModels.h"

@interface XinFanLianZaiCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cover;

@property (weak, nonatomic) IBOutlet UILabel *favourites;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *newest_ep_index;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverBottomHeight;

//新番连载
@property (nonatomic,strong)FJHSerializing *serializing;
//7月新番
@property (nonatomic,strong)FJHList *list;


@end
