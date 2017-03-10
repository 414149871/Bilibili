//
//  ZhiBoLastFooterCollectionReusableView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/10.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "ZhiBoLastFooterCollectionReusableView.h"

@implementation ZhiBoLastFooterCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _allZhiBoBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _allZhiBoBtn.layer.borderWidth = 0.5;
}

@end
