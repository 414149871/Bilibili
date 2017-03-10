//
//  NumberDealTool.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/26.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "NumberDealTool.h"

@implementation NumberDealTool

//处理时间的方法
+ (NSString *)dealWithTime:(NSString *)text{
    
    NSArray *array = [text componentsSeparatedByString:@":"];
    
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
    if (mArray.count <3) {
        [mArray insertObject:@"0" atIndex:0];
    }
    
    NSMutableArray *mArray2 = [NSMutableArray array];
    for (NSString *timeText in mArray) {
        int timeNum = [timeText intValue];
        [mArray2 addObject:[NSString stringWithFormat:@"%02d",timeNum]];
    }
    return [mArray2 componentsJoinedByString:@":"];
}

//处理播放和弹幕人数
+ (NSString *)dealwithPlayNum:(NSNumber *)text{
    
    int num = [text intValue];
    if (num < 10000) {
        return [NSString stringWithFormat:@"%d",num];
    }
    else{
        return [NSString stringWithFormat:@"%.1f万",(float)num/10000.0];
    }
}

//处理首页番剧推荐日期
+ (NSString *)dealWithDate:(NSString *)text{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* result = [formatter dateFromString:text];

    //目标日期
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    // NSDateComponent 可以获得日期的详细信息，即日期的组成
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:result];
    
    //今天日期
    NSDateComponents *compsNow = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:[NSDate date]];
    
    if (comps.day == compsNow.day) {
        if (comps.hour <= 12) {
            return [NSString stringWithFormat:@"早上%02ld:%02ld",(long)comps.hour,(long)comps.minute];
        }
        else if (comps.hour>12){
            return [NSString stringWithFormat:@"下午%02ld:%02ld",comps.hour-12,comps.minute];
        }
    }
    else if (comps.day == compsNow.day-1){
        return [NSString stringWithFormat:@"昨天%02ld:%02ld",(long)comps.hour,(long)comps.minute];
    }
    else{
        return [NSString stringWithFormat:@"%02ld.%02ld.%02ld %02ld:%02ld",(long)comps.year,(long)comps.month,comps.day,comps.hour,comps.minute];
    }
    return nil;
}



@end
























































