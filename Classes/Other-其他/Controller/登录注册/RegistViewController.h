//
//  RegistViewController.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/2.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RootViewController.h"

@interface RegistViewController : RootViewController

@property (weak, nonatomic) IBOutlet UIView *areaNameView;
@property (weak, nonatomic) IBOutlet UILabel *areaNameLabel;        //区域名称
@property (weak, nonatomic) IBOutlet UILabel *areaNumLabel;         //区域号码
@property (weak, nonatomic) IBOutlet UITextField *areaNumTextField; //输入手机号码文本框
@property (nonatomic,assign)BOOL  areaViewIsSelected;
@end
