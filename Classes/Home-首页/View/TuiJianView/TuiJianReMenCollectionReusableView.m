//
//  TuiJianReMenCollectionReusableView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/25.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "TuiJianReMenCollectionReusableView.h"

@implementation TuiJianReMenCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //在xib中使用另一个xib进行开发
    //http://www.jianshu.com/p/371b1a195fb9
    
    _tuiJianHeaderBtn.leftImageView.image = [UIImage imageNamed:@"hd_home_recommend"];
    _tuiJianHeaderBtn.middleImageView.image = [UIImage imageNamed:@"hd_home_rank"];
    _tuiJianHeaderBtn.contentStringLabel.text = @"排行榜";
    _tuiJianHeaderBtn.contentStringLabel.textColor = RLColor(253, 181, 40);
}

- (void)setBannerTopImageMArray:(NSMutableArray *)bannerTopImageMArray{

    _scrollPic =  [[RLScrollPic alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 3.1) WithImageName:bannerTopImageMArray];
    [_scrollBgView addSubview:_scrollPic];
}

@end









