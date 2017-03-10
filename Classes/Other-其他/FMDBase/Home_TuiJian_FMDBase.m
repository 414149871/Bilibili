//
//  Home_TuiJian_FMDBase.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/8.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "Home_TuiJian_FMDBase.h"

//表名
#define tuijianTable @"tuijianTable"
//字段名
#define Col1 @"play"
#define Col2 @"status"
#define Col3 @"param"
#define Col4 @"index"
#define Col5 @"uri"
#define Col6 @"area"
#define Col7 @"gotoProperty"
#define Col8 @"areaId"
#define Col9 @"title"
#define Col10 @"danmaku"
#define Col11 @"cover"
#define Col12 @"mtime"
#define Col13 @"online"
#define Col14 @"name"
#define Col15 @"face"

@implementation Home_TuiJian_FMDBase

/**
 *  iOS 中原生的 SQLite API在进行数据存储的时候,需要使用 C 语言中的函数,操作比较繁琐。于是就出现了一些列将 SQLite API进行封装的库,例如 FMDB
 
 优点:以 OC 的方式封装了 SQLite 的 C 语言 API,使用起来更加方便
 FMDB 是轻量级的框架,使用灵活
 缺点:因为它是OC 的语言封装的,只能在 iOS 开发的时候使用,所以在实现跨平台操作的时候存在局限性
 
 FMDatabase:一个 FMDatabase 对象就代表一个单独的 SQLite 数据库,用来执行 SQL 语句
 FMResultSet:使用 FMDatabase 执行查询后的结果集
 */

+ (FMDatabase *)openDB{

    //使用fmdb创建数据库
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbPath = [doc stringByAppendingPathComponent:@"Home_TuiJian_FMDBase.sqlite"];
    
    //获得数据库
    /**
     *  创建 FMDatabase 对象时参数为 SQLite 数据库文件路径,该路径可以是一下三种方式之一:
     1.文件路径。该文件路径无需真实存在,如果不存在会自动创建;
     2.空字符串(@"")。表示会在临时目录创建一个空的数据库,当 FMDatabase 连接关闭时,文件也会删除
     3.NULL。将创建一个内在数据库,同样的,当 FMDatabase 连接关闭时,数据将会被销毁。
     */
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    
    //在和数据库交互之前,数据库必须是打开的。如果权限不足或者资源不足,则无法打开和创建数据库
    if ([db open]) {
        
        //创建表
        NSString *sqlCreateTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' ('%@' TEXT, '%@' TEXT, '%@' TEXT, '%@' TEXT, '%@' TEXT,'%@' TEXT, '%@' TEXT,'%@' TEXT,'%@' TEXT,'%@' TEXT,'%@' TEXT,'%@' TEXT,'%@' TEXT,'%@' TEXT,'%@' TEXT)",tuijianTable,Col1,Col2,Col3,Col4,Col5,Col6,Col7,Col8,Col9,Col10,Col11,Col12,Col13,Col14,Col15];
        
        BOOL flag = [db executeUpdate:sqlCreateTable];
        if (flag) {
//            RLLog(@"创建表成功");
        }
        else{
//            RLLog(@"创建表失败");
        }
    }
    return db;
}

+ (NSArray *)find{

    NSMutableArray *mArray = [NSMutableArray array];
    FMDatabase *db = [self openDB];
    
    if ([db open]) {
        
        NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",tuijianTable];
        //执行查询语句,查询整个表
        FMResultSet *rs = [db executeQuery:sql];
        
        while ([rs next]) {
         
            Body *model = [Body new];
            model.play = [[rs stringForColumn:Col1] doubleValue];
            model.status = [[rs stringForColumn:Col2] doubleValue];
            model.param = [rs stringForColumn:Col3];
            model.index = [rs stringForColumn:Col4];
            model.uri = [rs stringForColumn:Col5];
            model.area = [rs stringForColumn:Col6];
            model.gotoProperty = [rs stringForColumn:Col7];
            model.areaId = [[rs stringForColumn:Col8] doubleValue];
            model.title = [rs stringForColumn:Col9];
            model.danmaku = [[rs stringForColumn:Col10] doubleValue];
            model.cover = [rs stringForColumn:Col11];
            model.mtime = [rs stringForColumn:Col12];
            model.online = [[rs stringForColumn:Col13] doubleValue];
            model.name = [rs stringForColumn:Col14];
            model.face = [rs stringForColumn:Col15];
            
            [mArray addObject:model];
        }
    }
    //关闭数据库
    return mArray;
}

+ (BOOL)insertModel:(Body *)model{

    BOOL flag = NO;
    FMDatabase *db = [self openDB];
    
    if ([db open]) {
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO '%@' ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@') VALUES('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')",tuijianTable,Col1,Col2,Col3,Col4,Col5,Col6,Col7,Col8,Col9,Col10,Col11,Col12,Col13,Col14,Col15,@(model.play),@(model.status),model.param,model.index,model.uri,model.area,model.gotoProperty,@(model.areaId),model.title,@(model.danmaku),model.cover,model.mtime,@(model.online),model.name,model.face];
        
        flag = [db executeUpdate:insertSql];
        if (flag) {
//            RLLog(@"数据插入成功");
        }
        else{
//            RLLog(@"数据插入失败");
        }
    }
    return flag;
}

+ (BOOL)deleteModel:(Body *)model{

    BOOL flag = NO;
    FMDatabase *db = [self openDB];
    if ([db open]) {
        
        NSString *deleteSql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ = '%@'",tuijianTable,Col9,model.title];
        flag = [db executeUpdate:deleteSql];
        if (flag) {
//            RLLog(@"数据删除成功");
        }
        else{
//            RLLog(@"数据删除失败");
        }
    }
    return flag;
}














@end























































































