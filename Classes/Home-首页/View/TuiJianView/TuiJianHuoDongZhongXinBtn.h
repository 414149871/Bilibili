//
//  TuiJianHuoDongZhongXinBtn.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/26.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuiJianHuoDongZhongXinBtn : UIButton

@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleStringLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverImageViewHeight;

+ (instancetype)initCustomsWithFrame:(CGRect)frame;

@end
