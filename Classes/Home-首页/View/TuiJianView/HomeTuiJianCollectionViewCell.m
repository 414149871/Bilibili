//
//  HomeTuiJianCollectionViewCell.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/26.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "HomeTuiJianCollectionViewCell.h"
#import "NumberDealTool.h"
#import <UIImageView+WebCache.h>

#define scrollPicHeight  ScreenWidth / 3.1
@implementation HomeTuiJianCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _coverHight.constant = scrollPicHeight *3/4;
    _coverBottomHight.constant = scrollPicHeight *3/4 *0.5;
    _cover.layer.cornerRadius = 5.0;
    _cover.layer.masksToBounds = YES;
    
    _coverBottomImageView.layer.cornerRadius = 5.0;
    _coverBottomImageView.layer.masksToBounds = YES;
}

- (void)setModel:(Body *)model{

    [_cover sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:[UIImage imageNamed:@"videopic_default"]];
    //设置文字
    _title.text = model.title;
    _play.text = [NumberDealTool dealwithPlayNum:@(model.play)];
    _danmaku.text = [NumberDealTool dealwithPlayNum:@(model.danmaku)];
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row != _bodyArray.count-1) {
        _refreshNewImageWidth.constant = 0;
    }
    else{
        _refreshNewImageWidth.constant = 45;
    }
}



@end














