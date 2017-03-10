//
//  Discover_AllSearchView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/21.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "Discover_AllSearchView.h"

@implementation Discover_AllSearchView

- (AMTagListView *)tagListView{
    
    if(!_tagListView){
        
        _tagListView = [[AMTagListView alloc] initWithFrame:self.topicSearchScrollView.bounds];
        [[AMTagView appearance] setRadius:5.0];
        [[AMTagView appearance] setInnerTagPadding:0];
        [[AMTagView appearance] setInnerTagColor:RLColor(247, 118, 157)];
        [[AMTagView appearance] setTextFont:[UIFont systemFontOfSize:13]];
        [[AMTagView appearance] setTagLength:2];
        [[AMTagView appearance] setTagColor:[UIColor clearColor]];
        //让tagListView一开始不可滚动
        _tagListView.scrollEnabled = NO;
    }
    return _tagListView;
}


+ (instancetype)initCustomWithFrame:(CGRect)frame{

    Discover_AllSearchView *allSearchView = [[[NSBundle mainBundle] loadNibNamed:@"Discover_AllSearchView" owner:nil options:nil] objectAtIndex:0];
    allSearchView.frame = frame;
    allSearchView.isSelected = NO;
    allSearchView.keywordArray = [NSMutableArray array];    
    return allSearchView;
}

- (IBAction)searchMoreBtn:(UIButton *)sender {
    
    _isSelected = !_isSelected;
    if (_isSelected) {
        self.RL_Height = (ScreenHeight - 64 - 49)/2;
        [_searchMoreBtn setTitle:@"收起" forState:UIControlStateNormal];
        _topicSearchScrollViewHeight.constant = self.RL_Height - 26 - 40;
        self.tagListView.RL_Height = self.RL_Height - 26 - 40;
        //让tagListView可滚动
        self.tagListView.scrollEnabled = YES;
    }
    else{
        self.RL_Height = 26+ 60+5+30+5;
        [_searchMoreBtn setTitle:@"查看更多" forState:UIControlStateNormal];
        _topicSearchScrollViewHeight.constant = 60;
        self.tagListView.RL_Height = 60;
        //让tagListView不可滚动
        self.tagListView.scrollEnabled = NO;
    }
    self.block(self.isSelected);
}

- (void)setDictionary:(NSDictionary *)dictionary{

    NSArray *list = dictionary[@"list"];
    
    for (int i =0; i < list.count; i++) {
        
        NSDictionary *dic = list[i];
        NSString *keyword = dic[@"keyword"];
        [_keywordArray addObject:keyword];
    }

    [self.tagListView addTags:_keywordArray];
    [self.topicSearchScrollView addSubview:self.tagListView];
    
    //点击标签响应事件
    [self.tagListView setTapHandler:^(AMTagView *view) {
        
        RLLog(@"%@",view.tagText);
    }];
}



@end
































































