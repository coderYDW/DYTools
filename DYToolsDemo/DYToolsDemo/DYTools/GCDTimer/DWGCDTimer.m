//
//  DWGCDTimerTool.m
//  OCAPPDemo
//
//  Created by 杨冬武 on 2021/5/14.
//

#import "DWGCDTimer.h"

@implementation DWGCDTimer

static NSMutableDictionary *timers;
static dispatch_semaphore_t semaphone;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timers = [NSMutableDictionary new];
        semaphone = dispatch_semaphore_create(1);
    });
}

+ (NSString *)executeWithTask:(void(^)(void))task interval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeat:(BOOL)repeat async:(BOOL)async {
    
    return [self executeWithTask:task interval:interval delay:delay repeat:repeat async:async cancelHandler:nil];
    
}

+ (NSString *)executeWithTask:(void(^)(void))task interval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeat:(BOOL)repeat async:(BOOL)async cancelHandler:(void(^)(void))cancelHandler {
    
    if (!task || (repeat && interval <= 0) || delay < 0) {
        return nil;
    }
    
    //创建dispatch source指定类型和队列
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置定时器开始时间,时间间隔
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)delay * NSEC_PER_SEC);
    dispatch_source_set_timer(source, time, interval * NSEC_PER_SEC, (uint64_t)0 * NSEC_PER_SEC);
    
    //线程安全
    dispatch_semaphore_wait(semaphone, DISPATCH_TIME_FOREVER);
    
    NSString *timerID = [NSString stringWithFormat:@"%lu", (unsigned long)timers.count];
    [timers setObject:source forKey:timerID];
    
    dispatch_semaphore_signal(semaphone);
    
    //设置处理事件
    dispatch_source_set_event_handler(source, ^{
        task();
        if (!repeat) {
            [self cancelTimerWithID:timerID];
        }
    });
    
    //定时器取消时候的回调
    if (cancelHandler) {
        dispatch_source_set_cancel_handler(source, cancelHandler);
    }
    
    //手动启动定时器
    dispatch_resume(source);
    
    return timerID;
}

+ (void)cancelTimerWithID:(NSString *)timerID {
    
    if (!timerID) {
        return;
    }
    
    dispatch_semaphore_wait(semaphone, DISPATCH_TIME_FOREVER);
    
    dispatch_source_t timer = [timers objectForKey:timerID];
    if (timer) {
        dispatch_source_cancel(timer);
        [timers removeObjectForKey:timerID];
    }
    
    dispatch_semaphore_signal(semaphone);
    
}

+ (NSString *)executeWithTarget:(id)target selector:(SEL)selector interval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeat:(BOOL)repeat async:(BOOL)async cancelHandler:(void(^)(void))cancelHandler {
    
    return [self executeWithTask:^{
        
        if ([target respondsToSelector:selector]) {
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            
            [target performSelector:selector];
            
#pragma clang diagnostic pop
            
        }
        
    } interval:interval delay:delay repeat:repeat async:async cancelHandler:cancelHandler];
    
}



/*
- (void)suspendTimer:(id)sender {
    dispatch_suspend(self.timer);
}

- (void)resumeTimer:(id)sender {
    dispatch_resume(self.timer);
}

- (void)createTimer:(id)sender {
    [self dispatchSourceTimer];
}

- (void)cancelTimer:(id)sender {
    dispatch_source_cancel(self.timer);
    self.timer = nil;
}

*/

@end
