//
//  Home_TuiJian_DataBase.h
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/2.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModels.h"

@interface Home_TuiJian_DataBase : NSObject

+ (Home_TuiJian_DataBase *)shareDataBase;

+ (void)openDB;

+ (NSArray *)find;

+ (BOOL)insertModel:(Body *)model;

+ (BOOL)deletModel:(Body *)model;

@end







































































































