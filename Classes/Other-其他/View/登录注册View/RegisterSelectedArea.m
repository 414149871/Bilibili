//
//  RegisterSelectedArea.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/1.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RegisterSelectedArea.h"

@interface RegisterSelectedArea ()

@end

@implementation RegisterSelectedArea


+ (instancetype)initCustomWithFrame:(CGRect)frame{
    
    RegisterSelectedArea *view = [[[NSBundle mainBundle] loadNibNamed:@"RegisterSelectedArea" owner:nil options:nil] lastObject];
    view.RL_Height = frame.size.height;
    view.RL_y = frame.origin.y;
    return view;
}

//确定、取消（他们做的事情是一样的，所以响应同一个事件就可以了）
- (IBAction)conformAction:(UIButton *)sender {
    _vc.areaViewIsSelected = ! _vc.areaViewIsSelected;
    [UIView animateWithDuration:0.3 animations:^{
       self.RL_y = ScreenHeight; 
    }];
}


@end

















































































