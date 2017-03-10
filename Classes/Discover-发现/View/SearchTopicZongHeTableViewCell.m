//
//  SearchTopicZongHeTableViewCell.m
//  UI_08_08_AFNetWorking
//
//  Created by 刘嘉豪 on 16/10/13.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "SearchTopicZongHeTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface UISearchContainerViewController ()

@end

@implementation SearchTopicZongHeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *identifier = @"CellIdentifier";
    SearchTopicZongHeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell =  [[[NSBundle mainBundle] loadNibNamed:@"SearchTopicZongHeTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
        [cell cellStyle];
    }
    return cell;
}

- (void)cellStyle{

    
    self.contentView.backgroundColor = RLColor(241, 241, 241);
    
    self.title.numberOfLines = 2;
    
    //图片
    self.pic.layer.cornerRadius = 5.0;
    self.pic.layer.masksToBounds = YES;
    //时间
    self.duration.layer.cornerRadius = 3.0;
    self.duration.layer.masksToBounds = YES;
    self.duration.alpha = 0.4;
}

- (void)setModel:(SearchTopicZongHeModel *)model{

    self.author.text = model.author;
    
    [self.pic sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:nil];
    
    self.title.text = model.title;
    
    self.duration.text = [self setDurationText:model.duration];
    
    self.play.text = [self setPlayAndVideo_review:model.play];
    
    self.video_review.text = [self setPlayAndVideo_review:model.video_review];
}

//处理时间的方法
- (NSString *)setDurationText:(NSString *)text{

    NSArray *array = [text componentsSeparatedByString:@":"];
    
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
    if (mArray.count <3) {
        [mArray insertObject:@"0" atIndex:0];
    }
    
    NSMutableArray *mArray2 = [NSMutableArray array];
    for (NSString *timeText in mArray) {
        int timeNum = [timeText intValue];
        [mArray2 addObject:[NSString stringWithFormat:@"%02d",timeNum]];
    }
    return [mArray2 componentsJoinedByString:@":"];
}

//处理播放和弹幕人数
- (NSString *)setPlayAndVideo_review:(NSNumber *)text{
    
    int num = [text intValue];
    if (num < 10000) {
        return [NSString stringWithFormat:@"%d",num];
    }
    else{
        return [NSString stringWithFormat:@"%.1f万",(float)num/10000.0];
    }
}

//设置历史记录Model
- (void)setBodyModel:(Body *)bodyModel{
    [self.pic sd_setImageWithURL:[NSURL URLWithString:bodyModel.cover] placeholderImage:nil];
    self.title.text = bodyModel.title;
    self.play.text = [self setPlayAndVideo_review:@(bodyModel.play)];
    self.video_review.text = [self setPlayAndVideo_review:[NSNumber numberWithDouble:bodyModel.danmaku]];
    self.duration.hidden = YES;
}


@end






















