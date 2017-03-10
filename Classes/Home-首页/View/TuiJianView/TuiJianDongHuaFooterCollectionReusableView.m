//
//  TuiJianDongHuaFooterCollectionReusableView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/27.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "TuiJianDongHuaFooterCollectionReusableView.h"
#import <UIImageView+WebCache.h>
#import "FJHDataModels.h"

@implementation TuiJianDongHuaFooterCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [_showImageView addGestureRecognizer:tap];
}

-(void)setBottom:(Bottom *)bottom{

    [_showImageView sd_setImageWithURL:[NSURL URLWithString:bottom.image]];
}

#pragma mark 响应事件
- (void)tapAction:(UITapGestureRecognizer *)sender{

}

//设置番剧 -- 新番连载尾部区域
- (void)setAdMArray:(NSMutableArray *)adMArray{
    FJHAd *ad = adMArray[0];
    NSArray *bodyArray = ad.body;
    if (bodyArray.count>0) {
        FJHBody *body = bodyArray[0];
        [_showImageView sd_setImageWithURL:[NSURL URLWithString:body.img]];
    }
}
@end




























