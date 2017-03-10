//
//  Discover_AllSearchView.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/21.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMTagListView.h>

typedef void(^searchMoreBtnBlock)(BOOL isSelected);

@interface Discover_AllSearchView : UIView

@property (weak, nonatomic) IBOutlet UIView *topicSearchScrollView;
@property (weak, nonatomic) IBOutlet UIButton *searchMoreBtn;                           //更多按钮
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topicSearchScrollViewHeight;   //高度约束

@property (nonatomic,assign)BOOL  isSelected;       //判断是否搜索更多
@property (nonatomic,copy)searchMoreBtnBlock  block;    //回传topicSearchScrollView的高度用于调整tableView的高度

@property (nonatomic,strong)NSDictionary *dictionary;
@property (nonatomic,strong)NSMutableArray  *keywordArray;

@property (nonatomic,strong)AMTagListView *tagListView;

+ (instancetype)initCustomWithFrame:(CGRect)frame;
@end











































































