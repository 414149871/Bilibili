//
//  RegisterVertifierView.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/31.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RegisterVertifierViewDelegate <NSObject>

- (void)vertiflyAction:(UIButton *)sender;
@end

@interface RegisterVertifierView : UIView

@property (nonatomic,weak)IBOutlet  UIView *view;
@property (nonatomic,weak)id<RegisterVertifierViewDelegate>  delegate;


+ (instancetype)initCustomWithFrame:(CGRect)frame;
@end
