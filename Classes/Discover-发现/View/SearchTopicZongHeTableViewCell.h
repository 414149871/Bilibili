//
//  SearchTopicZongHeTableViewCell.h
//  UI_08_08_AFNetWorking
//
//  Created by 刘嘉豪 on 16/10/13.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTopicZongHeModel.h"
#import "DataModels.h"

@interface SearchTopicZongHeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *duration;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *play;
@property (weak, nonatomic) IBOutlet UILabel *video_review;

@property (nonatomic,strong)SearchTopicZongHeModel  *model;

//历史记录
@property (nonatomic,strong)Body  *bodyModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end





































































































