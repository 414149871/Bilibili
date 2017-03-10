//
//  DiscoverTableViewCell.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/22.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "DiscoverTableViewCell.h"

@implementation DiscoverTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"CellIdentifier";
    DiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DiscoverTableViewCell" owner:nil options:nil] objectAtIndex:0];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.rightBackgroundView.hidden = NO;
        cell.rightImageView.hidden = NO;
    }
    else{
        cell.rightBackgroundView.hidden = YES;
        cell.rightImageView.hidden = YES;
    }
    return cell;
}

- (void)setDic:(NSDictionary *)dic{

    _titleNameLabel.text = dic[@"titleName"];
    _leftImageView.image = [UIImage imageNamed:dic[@"imageName"]];
}

- (void)setRightImageView:(UIImageView *)rightImageView{

    rightImageView.animationImages = @[[UIImage imageNamed:@"discovery_circleNew_ico_2"],[UIImage imageNamed:@"discovery_circleNew_ico_1"]];
    rightImageView.animationDuration = 0.5;
    rightImageView.animationRepeatCount = CGFLOAT_MAX;
    [rightImageView startAnimating];
}

@end





































































