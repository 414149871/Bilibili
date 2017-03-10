//
//  HomeTuiJianZhiBoCollectionViewCell.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/26.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "HomeTuiJianZhiBoCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "NumberDealTool.h"

#define scrollPicHeight  ScreenWidth / 3.1

@implementation HomeTuiJianZhiBoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _coverHight.constant = scrollPicHeight *3/4;
    _coverBottomHight.constant = scrollPicHeight *3/4 *0.5;
    _cover.layer.cornerRadius = 5.0;
    _cover.layer.masksToBounds = YES;
    
    _coverBottomImageView.layer.cornerRadius = 5.0;
    _coverBottomImageView.layer.masksToBounds = YES;
}

//设置推荐model
- (void)setTuiJianZhiBoModel:(Body *)tuiJianZhiBoModel{
    

    [_cover sd_setImageWithURL:[NSURL URLWithString:tuiJianZhiBoModel.cover]];
    
    //设置文字,## 之间的文字变颜色
    NSString *preString = [NSString stringWithFormat:@"#%@#",tuiJianZhiBoModel.area];
    
    NSString *string = [NSString stringWithFormat:@"#%@# %@",tuiJianZhiBoModel.area,tuiJianZhiBoModel.title];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:string];
    [mString addAttribute:NSForegroundColorAttributeName value:RLCommonBgColor range:NSMakeRange(0,preString.length)];
    
    _title.attributedText = mString;
    
    _play.text = tuiJianZhiBoModel.name;
    _danmaku.text = [NumberDealTool dealwithPlayNum:@(tuiJianZhiBoModel.online)];
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row != _bodyArray.count-1) {
        _refreshNewImageWidth.constant = 0;
    }
    else{
        _refreshNewImageWidth.constant = 45;
    }
}

//推荐番剧
- (void)setTuiJianFanJuModel:(Body *)tuiJianFanJuModel{

    [_cover sd_setImageWithURL:[NSURL URLWithString:tuiJianFanJuModel.cover]];
    _title.text = tuiJianFanJuModel.title;
    _refreshNewImageWidth.constant = 0;
    _danmaku.hidden = YES;
    _danmukuImageView.hidden = YES;
    
    NSString *timeString = [NumberDealTool dealWithDate:@"2016-10-26 03:00:10"];
    _play.text = [NSString stringWithFormat:@"%@ 第%@话",timeString,tuiJianFanJuModel.index];
}

//首页直播其他分区处理
- (void)setLives:(NRDLives *)lives{
    
    NRDCover *cover = lives.cover;
    [_cover sd_setImageWithURL:[NSURL URLWithString:cover.src] placeholderImage:[UIImage imageNamed:@"videopic_default"]];
    
    //设置文字
    NRDOwner *owner = lives.owner;
    _play.text = owner.name;
    _danmaku.text = [NumberDealTool dealwithPlayNum:@(lives.online)];
    _title.text = lives.title;
}

- (void)setLivesIndexPath:(NSIndexPath *)livesIndexPath{

    if (livesIndexPath.row != 3) {
        _refreshNewImageWidth.constant = 0;
    }
    else{
        _refreshNewImageWidth.constant = 45;
    }
}


//设置首页直播分区model
- (void)setZbhBannerData:(ZBHBannerData *)zbhBannerData{

    ZBHCover *cover = zbhBannerData.cover;
    [_cover sd_setImageWithURL:[NSURL URLWithString:cover.src] placeholderImage:[UIImage imageNamed:@"videopic_default"]];
    //设置文字
    ZBHOwner *owner = zbhBannerData.owner;
    _play.text = owner.name;
    _danmaku.text = [NumberDealTool dealwithPlayNum:@(zbhBannerData.online)];
    
    //设置文字,## 之间的文字变颜色
    NSString *preString = [NSString stringWithFormat:@"#%@#",zbhBannerData.area];
    
    NSString *string = [NSString stringWithFormat:@"#%@# %@",zbhBannerData.area,zbhBannerData.title];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:string];
    [mString addAttribute:NSForegroundColorAttributeName value:RLCommonBgColor range:NSMakeRange(0,preString.length)];
    _title.attributedText = mString;
}

- (void)setZbhLives:(ZBHLives *)zbhLives{

    ZBHCover *cover = zbhLives.cover;
    [_cover sd_setImageWithURL:[NSURL URLWithString:cover.src] placeholderImage:[UIImage imageNamed:@"videopic_default"]];
    
    //设置文字
    ZBHOwner *owner = zbhLives.owner;
    _play.text = owner.name;
    _danmaku.text = [NumberDealTool dealwithPlayNum:@(zbhLives.online)];
    
    //设置文字,## 之间的文字变颜色
    NSString *preString = [NSString stringWithFormat:@"#%@#",zbhLives.area];
    
    NSString *string = [NSString stringWithFormat:@"#%@# %@",zbhLives.area,zbhLives.title];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:string];
    [mString addAttribute:NSForegroundColorAttributeName value:RLCommonBgColor range:NSMakeRange(0,preString.length)];
    _title.attributedText = mString;
}

- (void)setFirstSectionCellIndexPath:(NSIndexPath *)firstSectionCellIndexPath{

    if (firstSectionCellIndexPath.row != _firstSectionCellDataSource.count-1) {
        _refreshNewImageWidth.constant = 0;
    }
    else{
        _refreshNewImageWidth.constant = 45;
    }
}

@end
















































