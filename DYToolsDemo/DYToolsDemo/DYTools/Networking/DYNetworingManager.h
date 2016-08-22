//
//  DYNetworingManager.h
//  DYNetworkingTool
//
//  Created by Yangdongwu on 16/8/2.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

/**
 *  网络中间类
 */
#import <AFNetworking/AFNetworking.h>

//定义枚举--网络请求的类型
typedef enum {
    //get
    RequestTypeGet,
    //post
    RequestTypePost,
} RequestType;

@interface DYNetworingManager : AFHTTPSessionManager

/**
 *  单例方法
 */
+ (instancetype)sharedManager;

/**
 *  网络请求方法
 *
 *  @param type             请求类型
 *  @param URLString        URLString
 *  @param parameters       参数
 *  @param downloadProgress 下载进度
 *  @param success          成功回调
 *  @param failure          失败回调
 */
- (void)requestWithType:(RequestType)type
              URLString:(NSString  *)URLString
             parameters:(id )parameters
               progress:(void (^)(NSProgress *progress))downloadProgress
                success:(void (^)(NSURLSessionDataTask *task, id response))success
                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
