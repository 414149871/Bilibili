//
//  RegistViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/2.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RegistViewController.h"
#import "RegisterVertifierView.h"
#import "RegisterSelectedArea.h"
#import <SMSSDK/SMS_SDK/SMSSDK.h>
#import "VertiflyPhoneNumViewController.h"

@interface RegistViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,RegisterVertifierViewDelegate>

@property (nonatomic,strong)RegisterSelectedArea  *selectedAreaView;
@property (nonatomic,strong)NSMutableArray  *pickerViewDataSource;
@property (weak, nonatomic) IBOutlet RegisterVertifierView *registerVertifierView;
@end

@implementation RegistViewController
- (NSMutableArray *)pickerViewDataSource{
    
    if(!_pickerViewDataSource){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"RegisterSelectedAreaList" ofType:@"plist"];
        _pickerViewDataSource = [NSMutableArray arrayWithContentsOfFile:path];
    }
    return _pickerViewDataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏设置
    [self setNavigationBar];
    //添加选择地区视图
    [self addChoseAreaLayout];
    //添加手势
    [self addGesture];
    _registerVertifierView.delegate = self;
}

#pragma mark 导航栏设置
- (void)setNavigationBar{
    
    self.navigationItem.title = @"注册账号";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"music_sound_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
}

#pragma mark 添加选择地区视图
- (void)addChoseAreaLayout{
    
    _selectedAreaView = [RegisterSelectedArea initCustomWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 200)];
    _selectedAreaView.pickerView.dataSource = self;
    _selectedAreaView.pickerView.delegate = self;
    [self.view addSubview:_selectedAreaView];
    _areaViewIsSelected = NO;
    _selectedAreaView.vc = self;
}

#pragma mark 添加手势
- (void)addGesture{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.areaNameView addGestureRecognizer:tapGesture];
}

#pragma mark 响应事件
- (void)backAction:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tapAction:(UITapGestureRecognizer *)sender{
    //注册第一响应者
    [_areaNumTextField resignFirstResponder];
    _areaViewIsSelected = !_areaViewIsSelected;
    [UIView animateWithDuration:0.3 animations:^{
        if (_areaViewIsSelected) {
            _selectedAreaView.RL_y = ScreenHeight - 200;
        }
        else{
            _selectedAreaView.RL_y = ScreenHeight;
        }
    }];
}

#pragma mark  UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.pickerViewDataSource.count;
}

#pragma mark UIPickerViewDelegate
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSDictionary *dic = self.pickerViewDataSource[row];
    return dic.allKeys[0];
}

//更换view设置字体大小
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    
    UILabel *pickerLabel = (UILabel *)view;
    if (!pickerLabel) {
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:14]];
    }
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
     NSDictionary *dic = self.pickerViewDataSource[row];
    self.areaNameLabel.text = dic.allKeys[0];
    self.areaNumLabel.text = dic.allValues[0];
}

#pragma mark RegisterVertifierViewDelegate

- (void)vertiflyAction:(UIButton *)sender{
    /**
     *  @from                    v1.1.1
     *  @brief                   获取验证码(Get verification code)
     *
     *  @param method            获取验证码的方法(The method of getting verificationCode)
     *  @param phoneNumber       电话号码(The phone number)
     *  @param zone              区域号，不要加"+"号(Area code)
     *  @param customIdentifier  自定义短信模板标识 该标识需从官网http://www.mob.com上申请，审核通过后获得。(Custom model of SMS.  The identifier can get it  from http://www.mob.com  when the application had approved)
     *  @param result            请求结果回调(Results of the request)
     */
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.areaNumTextField.text zone:_areaNumLabel.text customIdentifier:nil result:^(NSError *error) {
        if (!error) {
        
            VertiflyPhoneNumViewController *vertiflyPhoneNumVC = [[VertiflyPhoneNumViewController alloc] initWithNibName:@"VertiflyPhoneNumViewController" bundle:[NSBundle mainBundle]];
            vertiflyPhoneNumVC.phoneNumString = self.areaNumTextField.text;
            vertiflyPhoneNumVC.areaCodeString = self.areaNumLabel.text;
            [self.navigationController pushViewController:vertiflyPhoneNumVC animated:YES];
        } else {
            RLLog(@"错误信息：%@",error);
        }
    }];
}

@end













































































