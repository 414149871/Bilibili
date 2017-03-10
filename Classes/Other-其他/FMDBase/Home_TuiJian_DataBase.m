//
//  Home_TuiJian_DataBase.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/2.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "Home_TuiJian_DataBase.h"
#import <sqlite3.h>

@implementation Home_TuiJian_DataBase

+ (Home_TuiJian_DataBase *)shareDataBase{

    static Home_TuiJian_DataBase *dataBaseHandle = nil;
    if (dataBaseHandle == nil) {
        dataBaseHandle = [[Home_TuiJian_DataBase alloc] init];
    }
    return dataBaseHandle;
}

//创建一个数据库对象
static sqlite3 *db;

#pragma mark --打开数据库--

+(void)openDB
{
    //将导入的数据库移动到 Documents 文件夹下
    NSString *originPath = [[NSBundle mainBundle] pathForResource:@"HomeTuiJian" ofType:@"sqlite"];
    NSString *targetPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"HomeTuiJian.sqlite"];

    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:targetPath])
    {
        [manager moveItemAtPath:originPath toPath:targetPath error:nil];
    }
    
    char *filename = (char *)[targetPath UTF8String];
    //打开数据库
//    int result = sqlite3_open_v2(filename, &db, SQLITE_OPEN_READWRITE, NULL);
    int result = sqlite3_open(filename, &db);
    if (result == SQLITE_OK)
    {
        NSLog(@"数据库开启成功");
    }
    else
    {
        NSLog(@"数据库开启失败");
    }
}

+ (NSArray *)find{

    [self openDB];
    
    NSMutableArray *mArray = [NSMutableArray array];
    
    //操作数据库
    //声明一个陈述
    sqlite3_stmt *stmt = nil;
    //sql语句
    const char *sql = "select * from tuijianTable";
    
    //这个函数将 sql 文本转变成一个 准本语句对象,同时返回这个对象的指针。这个接口需要一个数据库连接指针以及一个要准备 SQL 语句的文本
    /**
     *  <#Description#>
     *
     *  @ db       数据指针
     *  @ zSql#>   sql 语句 description#>
     *  @ nByte#>  如果nByte小于0，则函数取出zSql中从开始到第一个0终止符的内容；如果nByte不是负的，那么它就是这个函数能从zSql中读取的字节数的最大值。如果nBytes非负，zSql在第一次遇见’/000/或’u000’的时候终止
     description#>
     *  @ ppStmt#> 上面提到zSql在遇见终止符或者是达到设定的nByte之后结束，假如zSql还有剩余的内容，那么这些剩余的内容被存放到pZTail中，不包括终止符 description#>
     *  @ pzTail#> 能够使用sqlite3_step()执行的编译好的准备语句的指针，如果错误发生，它被置为NULL，如假如输入的文本不包括sql语句。调用过程必须负责在编译好的sql语句完成使用后使用sqlite3_finalize()删除它。 description#>
     */
    
    int result = sqlite3_prepare_v2(db, sql, -1, &stmt, nil);
    
    if (result == SQLITE_OK) {
        
//        RLLog(@"准备查询成功");
        
        //循环比那里查询数据库每行
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            //提取数据
            const char *play = (const char*)sqlite3_column_text(stmt, 0);
            const char *status = (const char*)sqlite3_column_text(stmt, 1);
            const char *param = (const char*)sqlite3_column_text(stmt, 2);
//            const char *index = (const char*)sqlite3_column_text(stmt, 3);
            const char *uri = (const char*)sqlite3_column_text(stmt, 4);
//            const char *area = (const char*)sqlite3_column_text(stmt, 5);
            const char *gotoProperty = (const char*)sqlite3_column_text(stmt, 6);
            const char *areaId = (const char*)sqlite3_column_text(stmt, 7);
            const char *title = (const char*)sqlite3_column_text(stmt, 8);
            const char *danmaku = (const char*)sqlite3_column_text(stmt, 9);
            const char *cover = (const char*)sqlite3_column_text(stmt, 10);
//            const char *mtime = (const char*)sqlite3_column_text(stmt, 11);
            const char *online = (const char*)sqlite3_column_text(stmt, 12);
//            const char *name = (const char*)sqlite3_column_text(stmt, 13);
//            const char *face = (const char*)sqlite3_column_text(stmt, 14);
            
            Body *model = [[Body alloc] init];
            model.play = [[NSNumber numberWithDouble:[[NSString stringWithCString:play encoding:4] doubleValue]] doubleValue];
            model.status = [[NSNumber numberWithDouble:[[NSString stringWithCString:status encoding:4] doubleValue]] doubleValue];
            model.param = [NSString stringWithCString:param encoding:4];
//            model.index = [NSString stringWithCString:index encoding:4];
            model.uri = [NSString stringWithCString:uri encoding:4];
//            model.area = [NSString stringWithCString:area encoding:4];
            model.gotoProperty = [NSString stringWithCString:gotoProperty encoding:4];
            model.areaId = [[NSNumber numberWithDouble:[[NSString stringWithCString:areaId encoding:4] doubleValue]] doubleValue];
            model.title = [NSString stringWithCString:title encoding:4];
            model.danmaku = [[NSNumber numberWithDouble:[[NSString stringWithCString:danmaku encoding:4] doubleValue]] doubleValue];
            model.cover = [NSString stringWithCString:cover encoding:4];
//            model.mtime = [NSString stringWithCString:mtime encoding:4];
            model.online = [[NSNumber numberWithDouble:[[NSString stringWithCString:online encoding:4] doubleValue]] doubleValue];
//            model.name = [NSString stringWithCString:name encoding:4];
//            model.face = [NSString stringWithCString:face encoding:4];
            [mArray addObject:model];
        }
    }
    return mArray;
}

+ (BOOL)insertModel:(Body *)model{

    BOOL flag = NO;
    [self openDB];
    //操作数据库
    //声明一个陈述
    sqlite3_stmt *stmt = nil;
    //sql语句

    const char *sql = "INSERT INTO 'tuijianTable' ('play','status','param','index','uri','area','gotoProperty','areaId','title','danmaku','cover','mtime','online','name','face') VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    
    int result = sqlite3_prepare(db, sql, -1, &stmt, nil);

    if (result == SQLITE_OK) {
        
        //将要插入的数据插入到数据库
        //sqlite3_bind_text的第二个参数为序号（从1开始），第三个参数为字符串值，第四个参数为字符串长度。sqlite3_bind_text的第五个参数为一个函数指针，SQLITE3执行完操作后回调此函数，通常用于释放字符串占用的内存。（这个函数指针参数具体怎么使用，我现在还不清楚）
        
        sqlite3_bind_text(stmt, 1, [[NSString stringWithFormat:@"%f",model.play] UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 2, [[NSString stringWithFormat:@"%f",model.status] UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 3, [model.param UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 4, [model.index UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 5, [model.uri UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 6, [model.area UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 7, [model.gotoProperty UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 8, [[NSString stringWithFormat:@"%f",model.areaId] UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 9, [model.title UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 10, [[NSString stringWithFormat:@"%f",model.danmaku] UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 11, [model.cover UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 12, [model.mtime UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 13, [[NSString stringWithFormat:@"%f",model.online] UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 14, [model.name UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 15, [model.face UTF8String], -1, nil);
        
        if (sqlite3_step(stmt) == SQLITE_DONE) {
            flag = YES;
            RLLog(@"数据插入成功");
        }
        else{
            RLLog(@"数据插入失败");
        }
    }
    return flag;
}

+ (BOOL)deletModel:(Body *)model{

    BOOL flag = NO;
    
    [self openDB];
    //sql语句
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM tuijianTable WHERE title = '%@'",model.title];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, nil);
    if (result == SQLITE_OK) {
        
//        RLLog(@"删除成功");
        flag = YES;
    }
    else{
//        RLLog(@"删除失败");
    }
    return flag;
}





















@end













































































































