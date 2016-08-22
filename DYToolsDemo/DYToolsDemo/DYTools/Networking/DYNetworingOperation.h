//
//  DYNetworingOperation.h
//  DYNetworkingTool
//
//  Created by Yangdongwu on 16/8/2.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import "DYNetworingManager.h"

//设置请求类型
#define kRequestType RequestTypeGet

@interface DYNetworingOperation : DYNetworingManager

/**
 *  网络业务层的封装
 *
 *  @param parameters 参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)requestOperationWithParameters:(NSDictionary *)parameters success:(void(^)(id response))success failure:(void(^)(NSError *error))failure;

@end
