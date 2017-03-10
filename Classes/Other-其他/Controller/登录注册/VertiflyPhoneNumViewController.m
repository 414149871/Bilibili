//
//  VertiflyPhoneNumViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/2.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "VertiflyPhoneNumViewController.h"
#import <SMSSDK/SMS_SDK/SMSSDK.h>

@interface VertiflyPhoneNumViewController ()

@end

@implementation VertiflyPhoneNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏设置
    [self setNavigationBar];
    self.phoneNumLabel.text = [NSString stringWithFormat:@"%@  %@",_areaCodeString,_phoneNumString];
}

#pragma mark 导航栏设置
- (void)setNavigationBar{
    
    self.navigationItem.title = @"验证手机号码";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"music_sound_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
}

- (void)backAction:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 响应事件
- (IBAction)nextAction:(UIButton *)sender {

    /**
     * @from               v1.1.1
     * @brief              提交验证码(Commit the verification code)
     *
     * @param code         验证码(Verification code)
     * @param phoneNumber  电话号码(The phone number)
     * @param zone         区域号，不要加"+"号(Area code)
     * @param result       请求结果回调(Results of the request)
     */
    [SMSSDK commitVerificationCode:self.vertiflyNumTextField.text phoneNumber:_phoneNumString zone:_areaCodeString result:^(NSError *error) {
        
        if (!error) {
            self.veritiflyResultLabel.text = @"验证成功";
        }
        else
        {
            self.veritiflyResultLabel.text = @"验证码错误";
        }
    }];
}



@end



































































