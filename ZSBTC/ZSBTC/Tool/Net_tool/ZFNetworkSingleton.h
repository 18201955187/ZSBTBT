//
//  ZFNetworkSingleton.h
//  findproperty
//
//  Created by MacAir on 16/7/24.
//  Copyright © 2016年 Centaline. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>
#import "ZFConst.h"

//请求超时
#define TIMEOUT 15
/** 成功的网络请求 */
typedef void(^SuccessBlock)(NSURLSessionDataTask * _Nonnull task, id _Nonnull responseObject);
/** 失败的网络请求 */
typedef void(^FailureBlock)(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error);

@interface ZFNetworkSingleton : NSObject

/** 共享的网络请求管理者 */
+ (ZFNetworkSingleton * _Nonnull)sharedManager;

/** GET URL 不可为空,参数可为空 返回的成功或者失败不允许为空 */
- (void)GET:(NSString * _Nonnull)url params:(NSDictionary * _Nullable)params success:(_Nonnull SuccessBlock )success failure:(_Nonnull FailureBlock)failure;


/** POST URL 不可为空,参数可为空 返回的成功或者失败不允许为空 */
- (void)POST:(NSString *_Nonnull)url params:(NSDictionary * _Nullable)params success:(_Nonnull  SuccessBlock )success failure:(_Nonnull FailureBlock)failure;
- (void)POSTJSONString:(NSString *_Nonnull)url params:(NSString * _Nullable)params success:(_Nonnull  SuccessBlock )success failure:(_Nonnull FailureBlock)failure;


/** GET URL 不可为空,参数可为空 返回的成功或者失败不允许为空 */
- (void)OtherGET:(NSString *_Nonnull)host url:(NSString *_Nonnull)url params:(NSDictionary * _Nullable)params success:(_Nonnull SuccessBlock )success failure:(_Nonnull FailureBlock)failure;

/** POST URL 不可为空,参数可为空 返回的成功或者失败不允许为空 */
- (void)OtherPOST:(NSString *_Nonnull)host url:(NSString *_Nonnull)url params:(NSDictionary * _Nullable)params success:(_Nonnull  SuccessBlock )success failure:(_Nonnull FailureBlock)failure;

/** 上传 */

- (AFHTTPSessionManager * _Nonnull)manager;
/** 下载 */

/** 网络状态检测 对应调用不同的 block 通知网络状态的转换 */
- (void)networkReachbility;
@end
