//
//  SearchTopicZongHeModel.m
//  UI_08_08_AFNetWorking
//
//  Created by 刘嘉豪 on 16/10/13.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "SearchTopicZongHeModel.h"

@implementation SearchTopicZongHeModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"description"]) {
        _Description = value;
    }
    else if ([key isEqualToString:@"typename"]){
        _Typename = value;
    }
    else if ([key isEqualToString:@"typeid"]){
        _Typeid = value;
    }
}

+ (NSMutableArray *)processingDic:(NSDictionary *)dictionary{
    
    NSMutableArray *resultMArray = [NSMutableArray array];
    NSDictionary *result = dictionary[@"result"];
    NSArray *video = result[@"video"];
    for (NSDictionary *dic in video) {
        
        SearchTopicZongHeModel *model = [[SearchTopicZongHeModel alloc] initWithDictionary:dic];
        [resultMArray addObject:model];
    }
    return resultMArray;
}

@end










