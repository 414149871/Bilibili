//
//  SelecterToolsScrollView.h
//  UI_SelectTool
//
//  Created by 刘嘉豪 on 2016/10/19.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BtnClick)(UIButton *btn);

typedef enum {
    
    homeStyle,
    notHomeStyle,
} TypeStyle;

@interface SelecterToolsScrollView : UIScrollView

@property (nonatomic,strong)NSMutableArray  *btnArray;

@property (nonatomic,strong)UIButton  *previousBtn;

@property (nonatomic,strong)UIButton  *currentBtn;

@property (nonatomic,strong)UIView  *bottomScrollLine;

@property (nonatomic,assign)CGFloat  titleBtnWidth;

@property (nonatomic,copy)BtnClick  btnClick;

@property (nonatomic,assign)TypeStyle  typeStyle;  //判断是否为主页的样式

- (void)updateSelecterToolsIndex:(NSInteger)index;

- (instancetype)initWithFrame:(CGRect)frame SelecterConditionTitleArray:(NSArray *)titleArray andTypeStyle:(TypeStyle)typeStyle andBtnBlock:(BtnClick)btnClick;

@end








































































































