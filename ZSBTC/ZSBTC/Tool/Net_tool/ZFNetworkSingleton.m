//
//  ZFNetworkSingleton.m
//  findproperty
//
//  Created by MacAir on 16/7/24.
//  Copyright © 2016年 Centaline. All rights reserved.
//

#import "ZFNetworkSingleton.h"

@implementation ZFNetworkSingleton

+ (ZFNetworkSingleton *)sharedManager {
    static ZFNetworkSingleton *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZFNetworkSingleton alloc] init];
    });
    return manager;
}

/**
 *  此处设置 网络请求中需要设置的参数
 */
- (AFHTTPSessionManager *)manager {
    // 1 获取一个网络请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 2 指定响应序列的可接收类型 指定为自定义类型
    manager.responseSerializer.acceptableContentTypes = [self acceptableContentTypes];
    
    // 3 指定请求超时的时间
    manager.requestSerializer.timeoutInterval = TIMEOUT;
    
    // 4 设置使用cookie
    [manager.requestSerializer setHTTPShouldHandleCookies:YES];
    
    // 5 设置数据的json格式
    [manager.requestSerializer setStringEncoding:NSUTF8StringEncoding];
    [manager.responseSerializer setStringEncoding:NSUTF8StringEncoding];
    
    // 6 设置报头
    NSDictionary *headers = [self headerValues];
    for (NSString *field in [headers allKeys]) {
        [manager.requestSerializer setValue:headers[field] forHTTPHeaderField:field];
    }
    return manager;
}

- (void)GET:(NSString *)url params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure {

    AFHTTPSessionManager *manager = [self manager];
    [manager GET:[NetworkURL stringByAppendingString:url] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

- (void)POST:(NSString *)url params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    AFHTTPSessionManager *manager = [self manager];
    
    [manager POST:[NetworkURL stringByAppendingString:url] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

- (void)POSTJSONString:(NSString *_Nonnull)url params:(NSString * _Nullable)params success:(_Nonnull  SuccessBlock )success failure:(_Nonnull FailureBlock)failure {
    AFHTTPSessionManager *manager = [self manager];

    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:[NetworkURL stringByAppendingString:url] parameters:nil error:nil];
    
    req.timeoutInterval= 15;
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req setHTTPBody:[params    dataUsingEncoding:NSUTF8StringEncoding]];
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            if (success) {
                success(responseObject,responseObject);
            }
        } else {
            if (failure) {
                failure(responseObject, error);
            }
        }
    }] resume];
}

- (void)OtherGET:(NSString *_Nonnull)host url:(NSString *_Nonnull)url params:(NSDictionary * _Nullable)params success:(_Nonnull SuccessBlock )success failure:(_Nonnull FailureBlock)failure {
    
    AFHTTPSessionManager *manager = [self manager];
    NSString *hostUrl = [host stringByAppendingString:url];
    [manager GET:hostUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

- (void)OtherPOST:(NSString *_Nonnull)host url:(NSString *_Nonnull)url params:(NSDictionary * _Nullable)params success:(_Nonnull  SuccessBlock )success failure:(_Nonnull FailureBlock)failure {
    
    AFHTTPSessionManager *manager = [self manager];
    NSString *hostUrl = [host stringByAppendingString:url];
    [manager POST:hostUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}


- (void)networkReachbility {
    
}

#pragma mark - private
/**
 *  设置可接收的文件类型
 */
- (NSSet *)acceptableContentTypes {
    return [NSSet setWithObjects:@"application/json",@"text/plain", @"text/html", nil];
}

/**
 *  设置请求头内容
 */
- (NSDictionary *)headerValues {
    NSDictionary *headerValues = [[NSDictionary alloc] init];
    return headerValues;
}

@end
