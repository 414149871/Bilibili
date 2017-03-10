//
//  RegisterVertifierView.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/31.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RegisterVertifierView.h"

@implementation RegisterVertifierView

+ (instancetype)initCustomWithFrame:(CGRect)frame{

    RegisterVertifierView *vertifierView = [[[NSBundle mainBundle] loadNibNamed:@"RegisterVertifierView" owner:nil options:nil] lastObject];
    vertifierView.frame= frame;
    return vertifierView;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super initWithCoder:aDecoder]) {
        
        [self createView];
    }
    return self;
}

- (void)createView{

    [[NSBundle mainBundle] loadNibNamed:@"RegisterVertifierView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame = self.frame;
}

- (IBAction)vertiflyAction:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(vertiflyAction:)]) {
        [self.delegate vertiflyAction:sender];
    }
}


@end




















































































