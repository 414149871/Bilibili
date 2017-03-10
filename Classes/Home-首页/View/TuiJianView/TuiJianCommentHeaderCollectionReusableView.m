//
//  TuiJianCommentHeaderCollectionReusableView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/25.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "TuiJianCommentHeaderCollectionReusableView.h"

@implementation TuiJianCommentHeaderCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setIndexPath:(NSIndexPath *)indexPath{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeTuiJianList" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = array[indexPath.section-1];
    _tuiJianHeaderBtn.leftImageView.image = [UIImage imageNamed:dic[@"imageName"]];
    _tuiJianHeaderBtn.titleStringLabel.text = dic[@"titleString"];
    
    if (indexPath.section == 1) {
        
        //设置推荐直播分区的contentStringLabel内容
        NSString *string = [NSString stringWithFormat:@"当前%.0f个直播",_ext.liveCount];
        NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:string];
        NSRange range = [string rangeOfString:@"个"];
        [mString addAttribute:NSForegroundColorAttributeName value:RLCommonBgColor range:NSMakeRange(2,range.location - 2)];
        _tuiJianHeaderBtn.contentStringLabel.attributedText = mString;
    }
    else{
    _tuiJianHeaderBtn.contentStringLabel.text = dic[@"contentString"];
    }
}

//设置主页直播分区header内容
- (void)setTuijianHomeIndexPath:(NSIndexPath *)tuijianHomeIndexPath{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"ZhiBoHomeList" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = array[tuijianHomeIndexPath.section-1];
    _tuiJianHeaderBtn.leftImageView.image = [UIImage imageNamed:dic[@"imageName"]];
    _tuiJianHeaderBtn.titleStringLabel.text = dic[@"titleString"];
}

- (void)setPartitions:(NRDPartitions *)partitions{
    
    _partitions = partitions;
    NRDPartition *partition = _partitions.partition;
    //设置推荐直播分区的contentStringLabel内容
    NSString *string = [NSString stringWithFormat:@"当前%.0f个直播",partition.count];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = [string rangeOfString:@"个"];
    [mString addAttribute:NSForegroundColorAttributeName value:RLCommonBgColor range:NSMakeRange(2,range.location - 2)];
    _tuiJianHeaderBtn.contentStringLabel.attributedText = mString;
    _tuiJianHeaderBtn.rightImageView.image = [UIImage imageNamed:@"common_rightArrowShadow"];
}

//设置主页番剧header内容
- (void)setFanjuHomeIndexPath:(NSIndexPath *)fanjuHomeIndexPath{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeFanJuList" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = array[fanjuHomeIndexPath.section-1];
    _tuiJianHeaderBtn.leftImageView.image = [UIImage imageNamed:dic[@"imageName"]];
    _tuiJianHeaderBtn.titleStringLabel.text = dic[@"titleString"];
    _tuiJianHeaderBtn.contentStringLabel.text = dic[@"contentString"];
}

@end














