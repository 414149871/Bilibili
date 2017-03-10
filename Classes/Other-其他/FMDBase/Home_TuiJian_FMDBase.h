//
//  Home_TuiJian_FMDBase.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/8.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
#import "DataModels.h"

@interface Home_TuiJian_FMDBase : NSObject

+ (FMDatabase *)openDB;

+ (NSArray *)find;

+ (BOOL)insertModel:(Body *)model;

+ (BOOL)deleteModel:(Body *)model;

@end





































































































