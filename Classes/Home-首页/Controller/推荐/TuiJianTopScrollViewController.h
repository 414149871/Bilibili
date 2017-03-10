//
//  TuiJianTopScrollViewController.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/2.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RootViewController.h"

@interface TuiJianTopScrollViewController : RootViewController

@property (nonatomic,strong)NSString  *urlString;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
