//
//  MineRegisterAndLoginView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/18.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "MineRegisterAndLoginView.h"

@implementation MineRegisterAndLoginView
- (UIButton *)registerBtn{
    
    if(!_registerBtn){
        
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerBtn.frame = CGRectMake(0, 0, 100, 30);
        _registerBtn.RL_right = self.RL_Width/2 - 10;
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _registerBtn.backgroundColor = RLColor(247, 117, 156);
        _registerBtn.layer.cornerRadius = 5.0;
        _registerBtn.layer.masksToBounds = YES;
        [_registerBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

- (UIButton *)loginBtn{
    
    if(!_loginBtn){
        
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(self.RL_Width/2 + 10, 0, 100, 30);
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:RLCommonBgColor forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _loginBtn.backgroundColor = [UIColor whiteColor];
        _loginBtn.layer.cornerRadius = 5.0;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.registerBtn];
        [self addSubview:self.loginBtn];
    }
    return self;
}

#pragma mark 按钮响应方法
//注册按钮响应事件
- (void)registerAction:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(registerBtnAction:)]) {
        [self.delegate registerBtnAction:sender];
    }
}

//登录按钮响应事件
- (void)loginAction:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(loginBtnAction:)]) {
        [self.delegate loginBtnAction:sender];
    }
}



@end















































































