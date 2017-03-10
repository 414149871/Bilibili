//
//  MineRegisterAndLoginView.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/18.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MineRegisterAndLoginViewDelegate <NSObject>

- (void)registerBtnAction:(UIButton *)sender;

- (void)loginBtnAction:(UIButton *)sender;

@end

@interface MineRegisterAndLoginView : UIView

@property (nonatomic,strong)UIButton  *registerBtn;
@property (nonatomic,strong)UIButton  *loginBtn;

@property (nonatomic,weak)id<MineRegisterAndLoginViewDelegate>  delegate;

@end
