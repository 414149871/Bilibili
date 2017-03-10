//
//  TuiJianHeaderButton.m
//  UICollectionView
//
//  Created by 刘嘉豪 on 2016/10/25.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "TuiJianHeaderButton.h"

@implementation TuiJianHeaderButton

+ (instancetype)initWithCustomWithFrame:(CGRect)frame{

    TuiJianHeaderButton *btn = [[[NSBundle mainBundle] loadNibNamed:@"TuiJianHeaderButton" owner:nil options:nil] objectAtIndex:0];
    btn.frame = frame;
    return btn;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super initWithCoder:aDecoder]) {
        
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    [[NSBundle mainBundle] loadNibNamed:@"TuiJianHeaderButton" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame = self.bounds; //填一下自动布局的坑！最好要写这一句
}

@end




















































































