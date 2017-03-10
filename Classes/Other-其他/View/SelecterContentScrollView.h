//
//  SelecterContentScrollView.h
//  UI_SelectTool
//
//  Created by 刘嘉豪 on 2016/10/19.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelecterToolsScrollView.h"

typedef void(^ScrollPage)(int num);

@interface SelecterContentScrollView : UIScrollView<UIScrollViewDelegate>

@property (nonatomic,strong)NSArray  *vcArray;

@property (nonatomic,copy)ScrollPage  scrollPage;

@property (nonatomic,assign)BOOL  isHomeStyle;  //判断是否为主页的样式

- (void)updateVCViewFromIndex:(NSInteger)index;

- (instancetype)initWithFrame:(CGRect)frame SelecterConditionVCArray:(NSArray *)vcArray withStyle:(TypeStyle)typeStyle andBtnBlock:(ScrollPage)page;

@end







































































































