//
//  NSString+Chinese.h
//  QHZC_DEV
//
//  Created by Vincent on 2020/5/6.
//  Copyright © 2020 QHJF. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Chinese)

- (BOOL)isChinese;//判断是否是纯汉字

- (BOOL)includeChinese;//判断是否含有汉字

@end

NS_ASSUME_NONNULL_END
