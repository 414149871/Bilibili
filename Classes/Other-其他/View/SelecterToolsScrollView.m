//
//  SelecterToolsScrollView.m
//  UI_SelectTool
//
//  Created by 刘嘉豪 on 2016/10/19.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "SelecterToolsScrollView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define titleFont 14
@interface SelecterToolsScrollView ()
//@property (nonatomic,assign)CGFloat  preiousNum;
@property (nonatomic,strong)NSMutableArray  *titleArray;

@end

@implementation SelecterToolsScrollView
- (CGFloat)titleBtnWidth{
    
    if(!_titleBtnWidth){
        _titleBtnWidth = 95;
    }
    return _titleBtnWidth;
}


- (instancetype)initWithFrame:(CGRect)frame SelecterConditionTitleArray:(NSArray *)titleArray andTypeStyle:(TypeStyle)typeStyle andBtnBlock:(BtnClick)btnClick{

    if (self = [super init]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.frame = frame;
        _btnArray = [NSMutableArray array];
        
        self.titleBtnWidth = frame.size.width/3;
        
        for (int i = 0 ; i < titleArray.count; i++) {
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            titleBtn.frame = CGRectMake(self.titleBtnWidth*i, 0, self.titleBtnWidth, 40);
            titleBtn.tag = 300+i;
            [titleBtn addTarget:self action:@selector(titleBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [titleBtn setTitle:titleArray[i] forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:titleFont];
            [self addSubview:titleBtn];
            
            [_btnArray addObject:titleBtn];
            
            if (typeStyle == homeStyle) {
                typeStyle = homeStyle;
                if (i == 1) {
                    _previousBtn = _btnArray[0];
                    _currentBtn = titleBtn;
                    titleBtn.selected = YES;
                }
            }
            else{
                typeStyle = notHomeStyle;
                if (i == 0) {
                    _previousBtn = titleBtn;
                    _currentBtn = titleBtn;
                    titleBtn.selected = YES;
                }
            }
        }
        
        NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:titleFont]};
        CGSize size = [titleArray[0] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;

        
        CGFloat bottomScrollLineWidth = size.width + 4;
        _bottomScrollLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-2, bottomScrollLineWidth, 2)];
        _bottomScrollLine.center = CGPointMake(_currentBtn.center.x, _bottomScrollLine.center.y);
        _bottomScrollLine.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bottomScrollLine];
        
        self.contentSize = CGSizeMake(titleArray.count * self.titleBtnWidth, 0);
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;

        self.btnClick = btnClick;
        
        _titleArray = [NSMutableArray arrayWithArray:titleArray];
    }
    return self;
}

- (void)titleBtnAction:(UIButton *)sender{
    
    self.btnClick(sender);
}

- (void)updateSelecterToolsIndex:(NSInteger)index{

    UIButton *button = _btnArray[index];
    [self changeSelectBtn:button];
}

- (void)changeSelectBtn:(UIButton *)sender{

    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:titleFont]};
    CGSize size = [_titleArray[sender.tag-300] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;

    _previousBtn = _currentBtn;
    _currentBtn = sender;
    _previousBtn.selected = NO;
    _currentBtn.selected = YES;
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        _bottomScrollLine.RL_Width = size.width+4;
        _bottomScrollLine.center = CGPointMake(_currentBtn.center.x, _bottomScrollLine.center.y);
    } completion:^(BOOL finished) {
        
    }];

    if (_typeStyle == homeStyle) {
        return;
    }
    //让toolBtn居中
    if (_currentBtn.center.x < ScreenWidth/2) {
        [self setContentOffset:CGPointZero animated:YES];
    }
    else if (_currentBtn.center.x > self.contentSize.width - ScreenWidth/2){
        [self setContentOffset:CGPointMake(self.contentSize.width - ScreenWidth, 0) animated:YES];
    }
    else{
        [self setContentOffset:CGPointMake(_currentBtn.center.x - ScreenWidth/2, 0) animated:NO];
    }
}

@end


































































































