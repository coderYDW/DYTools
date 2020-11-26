//
//  NSNumber+Format.h
//  YDWDemo
//
//  Created by Yangdongwu on 2020/11/20.
//  Copyright © 2020 ydw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (Format)

/// 常规的小数表示(此方法可以修复精度丢失问题)
- (NSString *)dw_decimalString;

/// 最少保留2位小数,最多保留6位小数
- (NSString *)dw_priceString;

/// 自定义类型
/// @param style 类型
- (NSString *)dw_StringWithStyle:(NSNumberFormatterStyle)style;

/// 带货币符号
/// @param localeIdentifier 地区 (¥:zh_CN, $:en_US)
- (NSString *)dw_currencyStringWithLocaleIdentifier:(NSString *)localeIdentifier;

@end

NS_ASSUME_NONNULL_END
