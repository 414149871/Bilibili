//
//  RegisterView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/1.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

+ (instancetype)initCustomWithFrame:(CGRect)frame{

    RegisterView *view = [[[NSBundle mainBundle] loadNibNamed:@"RegisterView" owner:nil options:nil] lastObject];
    view.frame = frame;
    return view;
}


@end
