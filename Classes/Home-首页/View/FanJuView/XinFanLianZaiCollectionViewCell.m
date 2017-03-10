//
//  XinFanLianZaiCollectionViewCell.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/11.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "XinFanLianZaiCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "NumberDealTool.h"

@implementation XinFanLianZaiCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    CGFloat width = (ScreenWidth - 40)/3;
    _coverHeight.constant = width *4/3;
    _coverBottomHeight.constant = width *4/3 *0.5;

}

- (void)setSerializing:(FJHSerializing *)serializing{
    
    [_cover sd_setImageWithURL:[NSURL URLWithString:serializing.cover] placeholderImage:[UIImage imageNamed:@"videopic_default"]];
    _favourites.text = [NSString stringWithFormat:@"%.0f人在看",serializing.watchingCount];
    _title.text = serializing.title;
    _newest_ep_index.text = [NSString stringWithFormat:@"更新至%@话",serializing.newestEpIndex];
}

- (void)setList:(FJHList *)list{

    [_cover sd_setImageWithURL:[NSURL URLWithString:list.cover] placeholderImage:[UIImage imageNamed:@"videopic_default"]];
    _favourites.text = [NSString stringWithFormat:@"%@人追番",[NumberDealTool dealwithPlayNum:@([list.favourites doubleValue])]];
    _title.text = list.title;
}

@end





























