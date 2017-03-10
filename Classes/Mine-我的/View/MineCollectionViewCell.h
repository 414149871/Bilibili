//
//  MineCollectionViewCell.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/17.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (nonatomic,strong)NSDictionary  *dictionary;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *textStringLabel;
@end
