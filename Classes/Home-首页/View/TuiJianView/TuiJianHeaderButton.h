//
//  TuiJianHeaderButton.h
//  UICollectionView
//
//  Created by 刘嘉豪 on 2016/10/25.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuiJianHeaderButton : UIButton

@property (nonatomic,weak)IBOutlet  UIView *view;

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleStringLabel;

@property (weak, nonatomic) IBOutlet UIImageView *middleImageView;

@property (weak, nonatomic) IBOutlet UILabel *contentStringLabel;

@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;


+ (instancetype)initWithCustomWithFrame:(CGRect)frame;

@end






























