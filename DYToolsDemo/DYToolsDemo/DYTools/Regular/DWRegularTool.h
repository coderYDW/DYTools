//
//  DWRegularTool.h
//  DYToolsDemo
//
//  Created by Apple on 2020/11/12.
//  Copyright © 2020 DovYoung. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^resultBlock)(NSString *res);

@interface DWRegularTool: NSObject

/*!
 *  匹配固定电话号码
 *
 *  @param number 需要匹配的固话号码
 *
 *  @return 返回匹配结果
 */
+ (NSString *)matchTelephoneNumber:(NSString *)number;

/*!
 *  匹配手机号码
 *
 *  @param number 需要匹配的手机号码
 *
 *  @return 返回匹配结果
 */
+ (NSString *)matchMobilephoneNumber:(NSString *)number;

/*!
 *  匹配3-15位的中文或英文(用户名)
 *
 *  @param username 需要匹配的字符串
 *
 *  @return 返回匹配结果
 */
+ (NSString *)matchUsername:(NSString *)username;

/*!
 *  匹配6-18位的数字和字母组合(密码)
 *
 *  @param password 需要匹配的字符串
 *
 *  @return 返回匹配结果
 */
+ (NSString *)matchPassword:(NSString *)password;

/*!
 *  匹配邮箱帐号
 *
 *  @param email 需要匹配的邮箱帐号
 *
 *  @return 返回匹配结果
 */
+ (NSString *)matchEmail:(NSString *)email;

/*!
 *  匹配身份证号码
 *
 *  @param idCard 需要匹配的身份证号码
 *
 *  @return 返回匹配结果
 */
+ (NSString *)matchUserIdCard:(NSString *)idCard;

/*!
 *  匹配URL字符串
 *
 *  @param urlStr 需要匹配的URL字符串
 *
 *  @return 返回匹配结果
 */
+ (NSString *)matchURLStr:(NSString *)urlStr;

/*!
 *  匹配¥:价格字符串
 *
 *  @param priceStr 包含价格的字符串
 *
 *  @return 返回匹配结果
 */
+ (BOOL)matchPriceStr:(NSString *)priceStr;



//---------------------------------------------------------------


/**
 *  邮箱验证
 *
 *  @param email 邮箱
 *
 *  @return YES:正确  NO:失败
 */
+ (BOOL) checkForEmail:(NSString *)email;

/**
 *  手机号验证
 *
 *  @param phone 手机号
 *
 *  @return YES:正确  NO:失败
 */
+(BOOL)checkForMobilePhoneNo:(NSString *)mobilePhone;

/**
 *  电话号验证
 *
 *  @param phone 电话号
 *
 *  @return 结果
 */
+(BOOL)checkForPhoneNo:(NSString *)phone;

/**
 *  身份证号验证(15位 或 18位)
 *
 *  @param idCard 身份证号
 *
 *  @return YES:正确  NO:失败
 */
+(BOOL)checkForIdCard:(NSString *)idCard;

/**
 *  密码验证
 *
 *  @param shortest 最短长度
 *  @param longest  最长长度
 *  @param pwd      密码
 *
 *  @return 结果
 */
+(BOOL)checkForPasswordWithShortest:(NSString *)shortest longest:(NSString *)longest password:(NSString *)pwd;


/**
 *  由数字和26个英文字母组成的字符串
 *
 *  @param idCard 数据
 *
 *  @return 结果
 */
+ (BOOL) checkForNumberAndCase:(NSString *)data;


/**
 *  校验只能输入26位小写字母
 *
 *  @param 数据
 *
 *  @return 结果
 */
+ (BOOL) checkForLowerCase:(NSString *)data;

/**
 *  校验只能输入26位大写字母
 *
 *  @param data 数据
 *
 *  @return 结果
 */
+ (BOOL) checkForUpperCase:(NSString *)data;

/**
 *  校验只能输入由26个小写英文字母组成的字符串
 *
 *  @param data 字符串
 *
 *  @return 结果
 */
+ (BOOL) checkForLowerAndUpperCase:(NSString *)data;

/**
 *  是否含有特殊字符(%&’,;=?$\等)
 *
 *  @param data 数据
 *
 *  @return 结果
 */
+ (BOOL) checkForSpecialChar:(NSString *)data;


/**
 *  校验只能输入数字
 *
 *  @param number 数字
 *
 *  @return 结果
 */
+ (BOOL) checkForNumber:(NSString *)number;

/**
 *  校验只能输入n位的数字
 *
 *  @param length n位
 *  @param number 数字
 *
 *  @return 结果
 */
+ (BOOL) checkForNumberWithLength:(NSString *)length number:(NSString *)number;




@end
