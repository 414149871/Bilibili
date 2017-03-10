//
//  AFNetWorkRequest.h
//  UI_08_08_AFNetWorking
//
//  Created by 刘嘉豪 on 16/10/12.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^dataBlock)(id result);

@interface AFNetWorkRequest : NSObject

//请求
+ (void)getRequestWithUrl:(NSString *)urlString result:(dataBlock)block;

+ (void)postRequestWithUrl:(NSString *)urlString withPrameters:(NSDictionary *)dictionary  result:(dataBlock)block;

//+ (void)postRequestWithUrl:(NSString *)urlString withPrameters:(NSDictionary *)dictionary withFileData:(NSData *)data andFileType:(NSString *)fileType result:(dataBlock)block;

//检测网络连接状态
+ (void)reach:(dataBlock)block;

@end

























































































