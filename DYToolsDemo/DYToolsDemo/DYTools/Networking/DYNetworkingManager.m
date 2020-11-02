//
//  DYNetworingManager.m
//  DYNetworkingTool
//
//  Created by Yangdongwu on 16/8/2.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import "DYNetworkingManager.h"

@interface DYNetworkingManager ()

@end


@implementation DYNetworkingManager

+ (instancetype)sharedManager {

    static DYNetworkingManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
    
}


- (void)requestWithType:(RequestType)type
              URLString:(NSString *)URLString
             parameters:(id)parameters
               progress:(void (^)(NSProgress *progress))downloadProgress
                success:(void (^)(NSURLSessionDataTask *task, id response))success
                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    
    void(^successBlock)(NSURLSessionDataTask *task, id responseObject) = ^(NSURLSessionDataTask *task, id responseObject) {
        success(task,responseObject);
    };
    
    void(^failureBlock)(NSURLSessionDataTask *task, NSError *error) = ^(NSURLSessionDataTask *task, NSError *error) {
        failure(task,error);
    };
    
    
    //设置网络返回的数据类型,如果解析不出来数据,要查看是不是数据类型不同,不同的话要进行格式设置
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    
    
    if (type == RequestTypeGet) {
        [self GET:URLString parameters:parameters progress:downloadProgress success:successBlock failure:failureBlock];
    } else if (type == RequestTypePost) {
        [self POST:URLString parameters:parameters progress:downloadProgress success:successBlock failure:failureBlock];
    }
    

}

@end
