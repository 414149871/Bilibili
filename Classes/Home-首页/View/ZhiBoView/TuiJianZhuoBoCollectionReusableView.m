//
//  TuiJianZhuoBoCollectionReusableView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/9.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "TuiJianZhuoBoCollectionReusableView.h"
#import "ZhiBoHomeDataModels.h"
#import <UIImageView+WebCache.h>

@implementation TuiJianZhuoBoCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _tuiJianHeaderBtn.leftImageView.image = [UIImage imageNamed:@"home_region_icon_live_v2"];
    _tuiJianHeaderBtn.titleStringLabel.text = @"推荐主播";
    
}

- (void)setBannerTopImageMArray:(NSMutableArray *)bannerTopImageMArray{
    
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < bannerTopImageMArray.count; i++) {
        
        NRDBanner *banner = bannerTopImageMArray[i];
        [mArray addObject:banner.img];
        
//        [mArray addObject: [bannerTopImageMArray[i] objectForKey:@"img"]];
        
    }

    NSLog(@"mArray = %@",mArray);
    
    if (mArray.count == 1) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 3.1)];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:mArray[0]]];
        [_scrollBgView addSubview:_imageView];
    }
    else{
        _scrollPic =  [[RLScrollPic alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 3.1) WithImageName:mArray];
        [_scrollBgView addSubview:_scrollPic];
    }
}

- (void)setRecommendData:(ZBHRecommendData *)recommendData{

    ZBHPartition *partition = recommendData.partition;
    double count = partition.count;
    
    NSString *string = [NSString stringWithFormat:@"当前%.0f个直播",count];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = [string rangeOfString:@"个"];
    [mString addAttribute:NSForegroundColorAttributeName value:RLCommonBgColor range:NSMakeRange(2,range.location - 2)];
    _tuiJianHeaderBtn.contentStringLabel.attributedText = mString;
    _tuiJianHeaderBtn.rightImageView.image = [UIImage imageNamed:@"common_rightArrowShadow"];
}

@end













