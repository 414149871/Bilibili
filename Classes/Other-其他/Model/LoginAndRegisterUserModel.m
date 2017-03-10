//
//  LoginAndRegisterUserModel.m
//  数据持久化
//
//  Created by 刘嘉豪 on 2016/10/31.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "LoginAndRegisterUserModel.h"

@implementation LoginAndRegisterUserModel

//解档
- (void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:_name forKey:@"_name"];
    [aCoder encodeObject:_pwd forKey:@"_pwd"];
}

//归档
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"_name"];
        self.pwd = [aDecoder decodeObjectForKey:@"_pwd"];
    }
    return self;
}

@end




























































































