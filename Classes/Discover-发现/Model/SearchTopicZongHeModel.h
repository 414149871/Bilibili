//
//  SearchTopicZongHeModel.h
//  UI_08_08_AFNetWorking
//
//  Created by 刘嘉豪 on 16/10/13.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchTopicZongHeModel : NSObject

@property (nonatomic , copy) NSString              * author;
@property (nonatomic , copy) NSString              * Description;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , strong) NSNumber              * favorites;
@property (nonatomic , strong) NSNumber              * mid;
@property (nonatomic , copy) NSString              * duration;
@property (nonatomic , strong) NSNumber              * badgepay;
@property (nonatomic , copy) NSString              * Typename;
@property (nonatomic , copy) NSString              * create;
@property (nonatomic , copy) NSString              * aid;
@property (nonatomic , copy) NSString              * pic;
@property (nonatomic , strong) NSNumber              * play;
@property (nonatomic , copy) NSString              * subtitle;
@property (nonatomic , strong) NSNumber              * coins;
@property (nonatomic , strong) NSNumber              * credit;
@property (nonatomic , strong) NSNumber              * Typeid;
@property (nonatomic , copy) NSString              * copyright;
@property (nonatomic , strong) NSNumber              * comment;
@property (nonatomic , strong) NSNumber              * review;
@property (nonatomic , strong) NSNumber              * video_review;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (NSMutableArray *)processingDic:(NSDictionary *)dictionary;

@end












