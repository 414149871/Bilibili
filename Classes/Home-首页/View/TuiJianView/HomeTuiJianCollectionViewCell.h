//
//  HomeTuiJianCollectionViewCell.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/26.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"

@interface HomeTuiJianCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cover;

@property (weak, nonatomic) IBOutlet UILabel *play;

@property (weak, nonatomic) IBOutlet UILabel *danmaku;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverHight;

@property (weak, nonatomic) IBOutlet UIImageView *coverBottomImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverBottomHight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *refreshNewImageWidth;

@property (nonatomic,strong)Body  *model;
@property (nonatomic,strong)NSIndexPath  *indexPath;
@property (nonatomic,strong)NSArray  *bodyArray;


@end
















































































