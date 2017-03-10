//
//  RLPartitionButton.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/18.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RLPartitionButton.h"

@implementation RLPartitionButton

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.RL_y = 0;
    self.imageView.RL_centerX = self.RL_Width/2;
//    self.imageView.RL_Height -= 10;
//    self.imageView.RL_Width -= 10;
    
    self.titleLabel.RL_x = 0;
    self.titleLabel.RL_y = self.imageView.RL_bottom;
    self.titleLabel.RL_Width = self.RL_Width;
    self.titleLabel.RL_Height = self.RL_Height - self.imageView.RL_bottom;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
