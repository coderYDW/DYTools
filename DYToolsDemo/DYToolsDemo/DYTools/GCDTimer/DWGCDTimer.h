//
//  DWGCDTimerTool.h
//  OCAPPDemo
//
//  Created by 杨冬武 on 2021/5/14.
//

#import <Foundation/Foundation.h>

@interface DWGCDTimer : NSObject

+ (NSString *)executeWithTask:(void(^)(void))task interval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeat:(BOOL)repeat async:(BOOL)async;

+ (NSString *)executeWithTask:(void(^)(void))task interval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeat:(BOOL)repeat async:(BOOL)async cancelHandler:(void(^)(void))cancelHandler;

+ (NSString *)executeWithTarget:(id)target selector:(SEL)selector interval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeat:(BOOL)repeat async:(BOOL)async cancelHandler:(void(^)(void))cancelHandler;

+ (void)cancelTimerWithID:(NSString *)timerID;

@end
