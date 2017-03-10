//
//  SelecterContentScrollView.m
//  UI_SelectTool
//
//  Created by 刘嘉豪 on 2016/10/19.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "SelecterContentScrollView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation SelecterContentScrollView

- (instancetype)initWithFrame:(CGRect)frame SelecterConditionVCArray:(NSArray *)vcArray withStyle:(TypeStyle)typeStyle andBtnBlock:(ScrollPage)page{

    if (self = [super init]) {
        
        self.frame = frame;
        _vcArray = vcArray;
        
        if (typeStyle == homeStyle) {
            [self lazyLoadVCFromIndex:1];
            [self updateVCViewFromIndex:1];
        }
        else{
            [self lazyLoadVCFromIndex:0];
        }
        self.pagingEnabled = YES;
        self.contentSize = CGSizeMake(ScreenWidth * vcArray.count, 0);
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;      //移除边界回弹效果
        self.backgroundColor = RLColor(241, 241, 241);
        self.scrollPage = page;
    }
    return self;
}


- (void)lazyLoadVCFromIndex:(NSInteger)index{

    UIViewController *vc = _vcArray[index];
    vc.view.frame = CGRectMake(ScreenWidth*index, 0, ScreenWidth, self.frame.size.height);
    [self addSubview:vc.view];
}

- (void)updateVCViewFromIndex:(NSInteger)index{

    [self setContentOffset:CGPointMake(index * ScreenWidth, 0) animated:YES];
}


#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    int pageNum = scrollView.contentOffset.x / ScreenWidth;
    [self lazyLoadVCFromIndex:pageNum];
    self.scrollPage(pageNum);
}


@end


































































































