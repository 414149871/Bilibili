//
//  LoginAndRegisterViewController.m
//  数据持久化
//
//  Created by 刘嘉豪 on 2016/10/30.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "LoginAndRegisterViewController.h"
#import "LoginAndRegisterUserModel.h"
#import "RegistViewController.h"

#define LoginKey @"LoginKey"
#define UsersKey @"UsersKey"
@interface LoginAndRegisterViewController ()

@end

@implementation LoginAndRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
        NSUserDefaults适合存储轻量级的本地数据，一些简单的数据（NSString类型的）例如密码，网址等，NSUserDefaults肯定是首选，但是如果我们自定义了一个对象，对象保存的是一些信息，这时候就不能直接存储到NSUserDefaults了
     */
    
    //导航栏
    [self setNavigationBar];
    //根据登录状态取最后登录用户名显示
    [self showUserInfo];
}

#pragma mark 导航栏
- (void)setNavigationBar{

    self.navigationItem.title = @"登录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"忘记密码" style:UIBarButtonItemStylePlain target:self action:@selector(forgetPwdAction:)];
    //设置rightBarButtonItem字体样式
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"live_tv_del"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (textField == _loginTextField) {
        _headImageView.image = [UIImage imageNamed:@"login_header"];
        _phoneImageView.image = [UIImage imageNamed:@"ictab_me_selected"];
        _pwdImageView.image = [UIImage imageNamed:@"pws_icon"];
        
    }
    else{
        _headImageView.image = [UIImage imageNamed:@"login_header_cover_eyes"];
        _phoneImageView.image = [UIImage imageNamed:@"ictab_me"];
        _pwdImageView.image = [UIImage imageNamed:@"pws_icon_hover"];
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    NSLog(@"%lu,%lu",range.location,range.length);

    BOOL flag =  (range.length == 0) || (range.location>=1 && range.length == 1);
    if (textField == _loginTextField && flag && _pwdTextField.text.length >= 6) {

        _loginBtn.enabled = YES;
        _loginBtn.layer.opacity = 1.0;
        return YES;
    }
    
    if (range.location <5 || (range.location <= 5 && range.length == 1)) {
        //登录按钮不能点击
        _loginBtn.enabled = NO;
        _loginBtn.layer.opacity = 0.5;
    }
    else if (textField == _pwdTextField){
        //同时需要用户名TF不为空才能点击登录
        if (_loginTextField.text.length > 0) {
            _loginBtn.enabled = YES;
            _loginBtn.layer.opacity = 1.0;
        }
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    _loginBtn.enabled = NO;
    _loginBtn.layer.opacity = 0.5;
    return YES;
}

#pragma mark Touch系统
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    _headImageView.image = [UIImage imageNamed:@"login_header"];
    _phoneImageView.image = [UIImage imageNamed:@"ictab_me"];
    _pwdImageView.image = [UIImage imageNamed:@"pws_icon"];
    [_loginTextField resignFirstResponder];
    [_pwdTextField resignFirstResponder];
}

#pragma mark 响应事件
- (void)forgetPwdAction:(UIBarButtonItem *)sender{
    NSLog(@"忘记密码");
}

- (void)backAction:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registerAction:(UIButton *)sender {
    
//    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    RegistViewController *registVC = [[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:registVC animated:YES];
}

- (IBAction)loginAction:(UIButton *)sender {
    //向服务器提交用户名和密码,验证通过后,如果记住密码为 YES,就将当前用户归档;如果记住密码为 NO,则将当前用户不归档
    if ([[NSUserDefaults standardUserDefaults] boolForKey:LoginKey]) {
        
        LoginAndRegisterUserModel *userModel = [[LoginAndRegisterUserModel alloc] init];
        userModel.name = self.loginTextField.text;
        userModel.pwd = self.pwdTextField.text;
        
        NSMutableArray *mArray;
        NSString *userInfoPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"user.txt"];
        NSFileManager *manager = [NSFileManager defaultManager];
        
        if (![manager fileExistsAtPath:userInfoPath]) {
            
            mArray = [NSMutableArray arrayWithObjects:userModel, nil];
        }
        else{
            NSData *data = [NSData dataWithContentsOfFile:userInfoPath];
            //定义一个解档器
            NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
            //将归档的内容还原为 array
            NSArray *array = [unArchiver decodeObjectForKey:UsersKey];
            //结束解档器
            [unArchiver finishDecoding];
            
            mArray = [NSMutableArray arrayWithArray:array];
            [mArray addObject:userModel];
        }
        
        NSLog(@"mArray = %@",mArray);
        
        NSMutableData *mData = [NSMutableData data];
        //定义一个归档器
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mData];
        //使用归档器将 mArray 进行归档
        [archiver encodeObject:mArray forKey:UsersKey];
        //将归档器关闭
        [archiver finishEncoding];
        
        [mData writeToFile:userInfoPath atomically:YES];
    }
}

//根据登录状态取最后登录用户名显示
- (void)showUserInfo{
    
    [_loginTextField becomeFirstResponder];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:LoginKey];
    //写入磁盘
    [[NSUserDefaults standardUserDefaults] synchronize];

    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *usersInfoPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"user.txt"];
    
    BOOL flag = [[NSUserDefaults standardUserDefaults] boolForKey:LoginKey];
    if (flag) {
        
        if ([manager fileExistsAtPath:usersInfoPath]) {
            
            NSData *data = [NSData dataWithContentsOfFile:usersInfoPath];
            //定义一个解档器
            NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
            //将归档器的内容还原为NSArray
            NSMutableArray *mArray = [unArchiver decodeObjectForKey:UsersKey];
            //结束解档器
            [unArchiver finishDecoding];
            
            LoginAndRegisterUserModel *userModel = [mArray lastObject];
            self.loginTextField.text = userModel.name;
        }
    }

}


@end

































































