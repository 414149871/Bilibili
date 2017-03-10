//
//  LoginAndRegisterUserModel.h
//  数据持久化
//
//  Created by 刘嘉豪 on 2016/10/31.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginAndRegisterUserModel : NSObject<NSCoding>

@property (nonatomic,strong)NSString  *name;
@property (nonatomic,strong)NSString  *pwd;
@end
