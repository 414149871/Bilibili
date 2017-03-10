//
//  ZhiBoShowView.h
//  ijkplayerDemo
//
//  Created by 刘嘉豪 on 2016/11/16.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface ZhiBoShowView : UIView

@property (nonatomic,strong)NSString  *urlString;
@property (atomic, strong) NSURL *url;
@property (atomic, retain) id <IJKMediaPlayback> player;
@property (weak, nonatomic) UIView *PlayerView;

@end
