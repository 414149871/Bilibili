//
//  MineCollectionViewCell.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/17.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "MineCollectionViewCell.h"

@implementation MineCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = RLColor(226, 226, 226).CGColor;
}

- (void)setDictionary:(NSDictionary *)dictionary{

    _textStringLabel.text = dictionary[@"titleString"];
    _imgView.image = [UIImage imageNamed:dictionary[@"imageName"]];
}

@end








































































