//
//  TuiJianHuoDongZhongXinBtn.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/26.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "TuiJianHuoDongZhongXinBtn.h"

@implementation TuiJianHuoDongZhongXinBtn

+ (instancetype)initCustomsWithFrame:(CGRect)frame{

   TuiJianHuoDongZhongXinBtn *btn = [[[NSBundle mainBundle] loadNibNamed:@"TuiJianHuoDongZhongXinBtn" owner:nil options:nil] objectAtIndex:0];
    btn.frame = frame;
    btn.coverImageView.layer.cornerRadius = 5.0;
    btn.coverImageView.layer.masksToBounds = YES;
    return btn;
}

@end
