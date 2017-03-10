//
//  NumberDealTool.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/26.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberDealTool : NSObject

//处理时间的方法
+ (NSString *)dealWithTime:(NSString *)text;

//处理播放和弹幕人数
+ (NSString *)dealwithPlayNum:(NSNumber *)text;

//处理首页番剧推荐日期
+ (NSString *)dealWithDate:(NSString *)text;

@end
