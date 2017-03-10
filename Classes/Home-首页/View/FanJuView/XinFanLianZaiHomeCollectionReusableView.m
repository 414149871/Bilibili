//
//  XinFanLianZaiHomeCollectionReusableView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/11.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "XinFanLianZaiHomeCollectionReusableView.h"
#import "FJHDataModels.h"

@implementation XinFanLianZaiHomeCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
   
    _tuiJianHeaderBtn.leftImageView.image = [UIImage imageNamed:@"home_region_icon_33"];
    _tuiJianHeaderBtn.titleStringLabel.text = @"新番连载";
    _tuiJianHeaderBtn.contentStringLabel.text = @"更多连载";
}

- (void)setAdMArray:(NSMutableArray *)adMArray{
    
    FJHAd *ad = adMArray[0];
    NSArray *headArray = ad.head;
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < headArray.count; i++) {
        FJHHead *head = headArray[i];
        [mArray addObject:head.img];
    }
    _scrollPic =  [[RLScrollPic alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 3.1) WithImageName:mArray];
    [_scrollBgView addSubview:_scrollPic];
}

@end
































































