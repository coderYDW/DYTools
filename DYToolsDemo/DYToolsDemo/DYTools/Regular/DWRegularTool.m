//
//  DWRegularTool.m
//  DYToolsDemo
//
//  Created by Apple on 2020/11/12.
//  Copyright © 2020 DovYoung. All rights reserved.
//


#import "DWRegularTool.h"

@implementation DWRegularTool

#pragma mark - 匹配固定电话号码
+ (NSString *)matchTelephoneNumber:(NSString *)number {
    NSString *pattern = @"^(\\d{3,4}-)\\d{7,8}$";
    __block NSString *result;
    [DWRegularTool matchString:number withPattern:pattern resultBlock:^(NSString *res) {
        result = res;
    }];
    return result;
}

#pragma mark - 匹配手机号码
+ (NSString *)matchMobilephoneNumber:(NSString *)number {
    NSString *pattern = @"^(0|86)?1([358][0-9]|7[678]|4[57])\\d{8}$";
    __block NSString *result;
    [DWRegularTool matchString:number withPattern:pattern resultBlock:^(NSString *res) {
        result = res;
    }];
    return result;
}

#pragma mark - 匹配3-15位的中文或英文(用户名)
+ (NSString *)matchUsername:(NSString *)username {
    NSString *pattern = @"^[a-zA-Z一-龥]{3,15}$";
    __block NSString *result;
    [DWRegularTool matchString:username withPattern:pattern resultBlock:^(NSString *res) {
        result = res;
    }];
    return result;
}

#pragma mark - 匹配6-18位的数字和字母组合(密码)
+ (NSString *)matchPassword:(NSString *)password {
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}$";
    __block NSString *result;
    [DWRegularTool matchString: password withPattern: pattern resultBlock:^(NSString *res) {
        result = res;
    }];
    return result;
}

#pragma mark - 匹配邮箱帐号
+ (NSString *)matchEmail:(NSString *)email {
    NSString *pattern =
    @"^[a-z0-9]+([\\._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+\\.){1,63}[a-z0-9]+$";
    __block NSString *result;
    [DWRegularTool matchString:email withPattern:pattern resultBlock:^(NSString *res) {
        result = res;
    }];
    return result;
}

#pragma mark - 匹配身份证号码
+ (NSString *)matchUserIdCard:(NSString *)idCard {
    NSString *pattern =
    @"(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)";
    __block NSString *result;
    [DWRegularTool matchString:idCard withPattern:pattern resultBlock:^(NSString *res) {
        result = res;
    }];
    return result;
}

#pragma mark - 匹配URL字符串
+ (NSString *)matchURLStr:(NSString *)urlStr {
    NSString *pattern = @"^[0-9A-Za-z]{1,50}$";
    __block NSString *result;
    [DWRegularTool matchString:urlStr withPattern: pattern resultBlock:^(NSString *res) {
        result = res;
    }];
    return result;
}

#pragma mark - 匹配¥:价格字符串
+ (BOOL)matchPriceStr:(NSString *)priceStr {
    NSError *error = nil;
    NSString *pattern = @"¥?(\\d+(?:\\.\\d+)?)";
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options: 1 << 0 error: &error];
    if (!error) {
        NSArray<NSTextCheckingResult *> *result = [regular matchesInString:priceStr options:NSMatchingWithoutAnchoringBounds range:NSMakeRange(0, priceStr.length)];
        if (result) {
            for (NSTextCheckingResult *checkingRes in result) {
                if (checkingRes.range.location == NSNotFound) {
                    continue;
                }
                NSLog(@"%@",[priceStr substringWithRange:checkingRes.range]);
                //NSLog(@"%@",[priceStr substringWithRange:[res rangeAtIndex::1]]);
            }
        }
        return YES;
    }
    NSLog(@"匹配失败,Error: %@",error);
    return NO;
}


/*!
 *  正则匹配
 *
 *  @param str     匹配的字符串
 *  @param pattern 匹配规则
 *
 *  @return 返回匹配结果
 */
+ (BOOL)matchString:(NSString *)str withPattern:(NSString *)pattern resultBlock:(resultBlock)block {
    NSError *error = nil;
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    if (!error) {
        NSTextCheckingResult *result = [regular firstMatchInString:str options:0 range:NSMakeRange(0, str.length)];
        if (result) {
            NSLog(@"匹配成功");
            block([str substringWithRange:result.range]);
            return YES;
        } else {
            NSLog(@"匹配失败");
            return NO;
        }
    }
    NSLog(@"匹配失败,Error: %@",error);
    return NO;
}

//----------------------------------------------------------------------
#pragma mark - 邮箱校验
+(BOOL)checkForEmail:(NSString *)email{
    
    NSString *regEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self baseCheckForRegEx:regEx data:email];
}

#pragma mark - 验证手机号
+(BOOL)checkForMobilePhoneNo:(NSString *)mobilePhone{
    
    NSString *regEx = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    return [self baseCheckForRegEx:regEx data:mobilePhone];
}
#pragma mark - 验证电话号
+(BOOL)checkForPhoneNo:(NSString *)phone{
    NSString *regEx = @"^(\\d{3,4}-)\\d{7,8}$";
    return [self baseCheckForRegEx:regEx data:phone];
}

#pragma mark - 身份证号验证
+ (BOOL)checkForIdCard:(NSString *)idCard{
    
    NSString *regEx = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    return [self baseCheckForRegEx:regEx data:idCard];
}
#pragma mark - 密码校验
+(BOOL)checkForPasswordWithShortest:(NSInteger)shortest longest:(NSInteger)longest password:(NSString *)pwd{
    NSString *regEx =[NSString stringWithFormat:@"^[a-zA-Z0-9]{%ld,%ld}+$", shortest, longest];
    return [self baseCheckForRegEx:regEx data:pwd];
}



#pragma mark - 由数字和26个英文字母组成的字符串
+ (BOOL) checkForNumberAndCase:(NSString *)data{
    NSString *regEx = @"^[A-Za-z0-9]+$";
    return [self baseCheckForRegEx:regEx data:data];
}

#pragma mark - 小写字母
+(BOOL)checkForLowerCase:(NSString *)data{
    NSString *regEx = @"^[a-z]+$";
    return [self baseCheckForRegEx:regEx data:data];
}

#pragma mark - 大写字母
+(BOOL)checkForUpperCase:(NSString *)data{
    NSString *regEx = @"^[A-Z]+$";
    return [self baseCheckForRegEx:regEx data:data];
}
#pragma mark - 26位英文字母
+(BOOL)checkForLowerAndUpperCase:(NSString *)data{
    NSString *regEx = @"^[A-Za-z]+$";
    return [self baseCheckForRegEx:regEx data:data];
}

#pragma mark - 特殊字符
+ (BOOL) checkForSpecialChar:(NSString *)data{
    NSString *regEx = @"[^%&',;=?$\x22]+";
    return [self baseCheckForRegEx:regEx data:data];
}

#pragma mark - 只能输入数字
+ (BOOL) checkForNumber:(NSString *)number{
    NSString *regEx = @"^[0-9]*$";
    return [self baseCheckForRegEx:regEx data:number];
}

#pragma mark - 校验只能输入n位的数字
+ (BOOL) checkForNumberWithLength:(NSString *)length number:(NSString *)number{
    NSString *regEx = [NSString stringWithFormat:@"^\\d{%@}$", length];
    return [self baseCheckForRegEx:regEx data:number];
}


#pragma mark - 私有方法
/**
 *  基本的验证方法
 *
 *  @param regEx 校验格式
 *  @param data  要校验的数据
 *
 *  @return YES:成功 NO:失败
 */
+(BOOL)baseCheckForRegEx:(NSString *)regEx data:(NSString *)data{
    
    NSPredicate *card = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    
    if (([card evaluateWithObject:data])) {
        return YES;
    }
    return NO;
}




@end
