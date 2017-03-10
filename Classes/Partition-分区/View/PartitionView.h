//
//  PartitionView.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/18.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PartitionBtn;

@protocol PartitionViewDelegate <NSObject>

- (void)partitionBtnAction:(UIButton *)sender;
@end

@interface PartitionView : UIView

@property (nonatomic,weak)id<PartitionViewDelegate>  delegate;

@end
