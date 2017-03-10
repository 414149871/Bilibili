//
//  ZongheSelectedView.m
//  UI_08_08_AFNetWorking
//
//  Created by 刘嘉豪 on 16/10/15.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "ZongheSelectedView.h"

@implementation ZongheSelectedView

//-(void)awakeFromNib{
//    [super awakeFromNib];
//    self.backgroundColor = [UIColor orangeColor];
//}

+ (instancetype)initCustom{

    return [[[NSBundle mainBundle] loadNibNamed:@"ZongheSelectedView" owner:nil options:nil] objectAtIndex:0];
}

@end
