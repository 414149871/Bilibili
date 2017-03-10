//
//  PartitionView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/18.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "PartitionView.h"
#import "RLPartitionButton.h"
#import "PartitionBtn.h"
@implementation PartitionView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"PartitionList" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        self.backgroundColor = RLColor(241, 241, 241);
        CGFloat rowSpace = 10;
        CGFloat height = (self.RL_Height - 6*rowSpace - 5)/5;
        CGFloat width = height;
        CGFloat columnSpace = (self.RL_Width - 3*width)/4;
        
        int count = 0;
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 3; j++) {
            
                NSDictionary *dic = array[count];
                PartitionBtn *button = [[[NSBundle mainBundle] loadNibNamed:@"PartitionBtn" owner:nil options:nil] objectAtIndex:0];
                button.frame = CGRectMake(width*j + columnSpace*(j+1), height*i + rowSpace*(i+1), width, height);
                button.titleStringLabel.text = dic[@"titleString"];
                button.titleStringLabel.font = [UIFont systemFontOfSize:12];
                button.picImgView.image = [UIImage imageNamed:dic[@"imageName"]];
                [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
                
                //设置按钮区域内选中时改变背景颜色
                [button addTarget:self action:@selector(btnBackgroundColor:) forControlEvents:UIControlEventTouchDown];
                [button addTarget:self action:@selector(btnBackgroundColor:) forControlEvents:UIControlEventTouchDragInside];
//                [button addTarget:self action:@selector(btnBackgroundColor:) forControlEvents:UIControlEventTouchDragEnter];
                //清除颜色
                [button addTarget:self action:@selector(btnClearBackgroundColor:) forControlEvents:UIControlEventTouchDragOutside];
                [button addTarget:self action:@selector(btnClearBackgroundColor:) forControlEvents:UIControlEventTouchDragExit];
                
                button.tag = 200+count;
                count++;
                [self addSubview:button];
            }
        }
    }
    return self;
}

//按钮响应事件
- (void)btnAction:(PartitionBtn *)sender{

    sender.backgroundColor = [UIColor clearColor];
    
    if ([self.delegate respondsToSelector:@selector(partitionBtnAction:)]) {
        [self.delegate partitionBtnAction:sender];
    }
}

- (void)btnBackgroundColor:(PartitionBtn *)sender{

    sender.backgroundColor = RLColor(234, 234, 234);
}

- (void)btnClearBackgroundColor:(PartitionBtn *)sender{
    sender.backgroundColor = [UIColor clearColor];
}

@end




























































