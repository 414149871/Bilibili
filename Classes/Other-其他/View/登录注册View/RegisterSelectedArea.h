//
//  RegisterSelectedArea.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/1.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistViewController.h"
@interface RegisterSelectedArea : UIView

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic,strong)RegistViewController  *vc;

+ (instancetype)initCustomWithFrame:(CGRect)frame ;
@end
