//
//  HMWeakTimerTargetObj.h
//  08-定时器的坑-(理解)
//
//  Created by hm04 on 16/6/10.
//  Copyright © 2016年 hm04. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYWeakTimerTargetObj : NSObject

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

@end
