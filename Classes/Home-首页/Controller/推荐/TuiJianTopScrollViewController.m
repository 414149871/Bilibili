//
//  TuiJianTopScrollViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/2.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "TuiJianTopScrollViewController.h"

@interface TuiJianTopScrollViewController ()<UIWebViewDelegate>

@end

@implementation TuiJianTopScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏设置
    [self setNavigationBar];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    [self.webView loadRequest:request];
}

#pragma mark 导航栏设置
- (void)setNavigationBar{
    
//    self.navigationItem.title = @"注册账号";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
}

#pragma mark 响应事件
- (void)backAction:(UIBarButtonItem *)sender{

    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{

    self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end















































































