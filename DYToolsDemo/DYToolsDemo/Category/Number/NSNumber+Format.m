//
//  NSNumber+Format.m
//  YDWDemo
//
//  Created by Yangdongwu on 2020/11/20.
//  Copyright © 2020 ydw. All rights reserved.
//

#import "NSNumber+Format.h"

@implementation NSNumber (Format)

- (NSString *)dw_decimalString {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    numberFormatter.usesGroupingSeparator = NO;
    numberFormatter.maximumFractionDigits = 6;
    NSString *formattedString = [numberFormatter stringFromNumber:self];
    return formattedString;
}

- (NSString *)dw_priceString {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    numberFormatter.usesGroupingSeparator = NO;
    numberFormatter.minimumFractionDigits = 2;
    numberFormatter.maximumFractionDigits = 6;
    NSString *formattedString = [numberFormatter stringFromNumber:self];
    return formattedString;
}

- (NSString *)dw_currencyStringWithLocaleIdentifier:(NSString *)localeIdentifier {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    numberFormatter.usesGroupingSeparator = NO;
    numberFormatter.minimumFractionDigits = 2;
    numberFormatter.maximumFractionDigits = 6;
    //numberFormatter.currencyGroupingSeparator = @"";
    //numberFormatter.currencySymbol = @"";
    numberFormatter.locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
    NSString *formattedString = [numberFormatter stringFromNumber:self];
    return formattedString;
}

- (NSString *)dw_StringWithStyle:(NSNumberFormatterStyle)style {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = style;
    numberFormatter.usesGroupingSeparator = NO;
    numberFormatter.maximumFractionDigits = 6;
    numberFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    NSString *formattedString = [numberFormatter stringFromNumber:self];
    return formattedString;
}

@end
