//
//  HomeTuiJianHuoDongZhongXinCollectionViewCell.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/26.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "HomeTuiJianHuoDongZhongXinCollectionViewCell.h"
#import "TuiJianHuoDongZhongXinBtn.h"
#import <UIImageView+WebCache.h>

@implementation HomeTuiJianHuoDongZhongXinCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIScrollView *scrView = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrView.showsVerticalScrollIndicator = NO;
        scrView.showsHorizontalScrollIndicator = NO;
        [self addSubview:scrView];
        
        
        CGFloat btnHeight = self.RL_Height;
        CGFloat btnWidth = ScreenWidth/2;
        CGFloat space = 10;
        scrView.contentSize = CGSizeMake(btnWidth*6+ space * (6+1),0);
        
        for (int i = 0; i < 6; i++) {
            TuiJianHuoDongZhongXinBtn *button = [TuiJianHuoDongZhongXinBtn initCustomsWithFrame: CGRectMake(space*(i+1) + btnWidth * i, 0, btnWidth, btnHeight)];
            button.coverImageViewHeight.constant = btnHeight - 30;
            button.tag = 190+i;
            [scrView addSubview:button];
        }
    }
    return self;
}

- (void)setTuiJianHuoDongZhongXinModel:(Data *)tuiJianHuoDongZhongXinModel{

    NSArray *array = tuiJianHuoDongZhongXinModel.body;
    for (int i = 0; i < array.count; i++) {
        Body *body = array[i];
        TuiJianHuoDongZhongXinBtn *button = [self viewWithTag:190+i];
        [button.coverImageView sd_setImageWithURL:[NSURL URLWithString:body.cover]];
        button.titleStringLabel.text =body.title;
    }
}

@end
























