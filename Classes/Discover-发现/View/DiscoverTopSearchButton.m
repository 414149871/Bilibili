//
//  DiscoverTopSearchButton.m
//  UI_AFNetWorking
//
//  Created by 刘嘉豪 on 2016/10/20.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "DiscoverTopSearchButton.h"

@implementation DiscoverTopSearchButton

+ (instancetype)setUpWithFrame:(CGRect)frame{

    DiscoverTopSearchButton *btn = [DiscoverTopSearchButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.layer.cornerRadius = 5.0;
    btn.layer.masksToBounds = YES;
    
    //右边文字
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    btn.backgroundColor = [UIColor whiteColor];
    
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    return btn;
}

- (void)setTitleString:(NSString *)titleString{
    
    [self setTitle:titleString forState:UIControlStateNormal];
}

//左边图片
- (void)setImgName:(NSString *)imgName{
    
    [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
}

@end

























































































