//
//  AFNetWorkRequest.m
//  UI_08_08_AFNetWorking
//
//  Created by 刘嘉豪 on 16/10/12.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "AFNetWorkRequest.h"
#import <AFNetworking.h>
@implementation AFNetWorkRequest

+ (void)reach:(dataBlock)block{
    
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  未知
     AFNetworkReachabilityStatusNotReachable     = 0,   无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   局域网络,wifi
     */
    //如果要检测网络状态的变化,必须用检测管理器的单例的 startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        block(@(status));
    }];
}

+ (void)getRequestWithUrl:(NSString *)urlString result:(dataBlock)block{
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [manager GET:url.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"downloadProgress = %@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"task = %@",responseObject);
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
    }];
}

+ (void)postRequestWithUrl:(NSString *)urlString withPrameters:(NSDictionary *)dictionary
                    result:(dataBlock)block{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置返回格式
    //这里得到是 json 数据,默认的responseSerializer是 json 数据
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //这里得到的是 NSData 数据
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    [manager POST:urlString parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"uploadProgress = %@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"responseObject = %@",responseObject);
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

//+ (NSData *)dataFromDictionary:(NSDictionary *)dictionary{
//    
//    NSMutableArray *mArray = [NSMutableArray array];
//    for (NSString *key in dictionary.allKeys) {
//        NSString *string = [NSString stringWithFormat:@"%@=%@",key,dictionary[key]];
//        [mArray addObject:string];
//    }
//    NSString *string = [mArray componentsJoinedByString:@"&"];
//    NSData *data = [string dataUsingEncoding:4];
//    return data;
//}

@end
























































































