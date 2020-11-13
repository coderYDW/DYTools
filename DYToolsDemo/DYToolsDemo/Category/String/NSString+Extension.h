//
//  NSString+Extension.h
//  QHZC
//
//  Created by HP on 16/10/23.
//  Copyright © 2016年 QHJF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)


/**
 根据日期字符串获取当前日期的月日
 
 @param dateStr 完整的日期字符串 yyyy-MM-dd HH:mm:ss
 
 @return 月日
 */
+ (NSString *)dateStringFromDateString:(NSString *)dateStr;


/**
 根据日期字符串获取当前日期的月日、时分

 @param dateStr 完整的日期字符串 yyyy-MM-dd HH:mm:ss

 @return 月日、时分
 */
+ (NSString *)dateWithoutYearStringFromDateString:(NSString *)dateStr;

/**
 根据日期字符串获取当前日期是周几
 
 @param dateStr 完整的日期字符串 yyyy-MM-dd HH:mm:ss
 
 @return 星期
 */
+ (NSString *)weekStringFromDateString:(NSString *)dateStr;

/**
 根据日期字符串获取当前日期的小时分钟
 
 @param dateStr 完整的日期字符串 yyyy-MM-dd HH:mm:ss
 
 @return 小时分钟
 */
+ (NSString *)timeStringFromDateString:(NSString *)dateStr;

/** 根据完整日期计算日期间隔天数 yyyy-MM-dd HH:mm:ss */
+ (NSString *)currentDaysWithRentDate:(NSString *)rentdate ReturnDate:(NSString *)returndate;

/** 根据完整日期计算日期间隔天数 yyyy-MM-dd */
+ (int)currentDaysWithStartWorkDate:(NSString *)startWorkDate EndWorkDate:(NSString *)endWorkDate;


/**
 根据完整日期获取 星期和时间

 @param dateStr 完整时间格式

 @return 星期和时间
 */
+ (NSString *)weakAndTimeFromDateString:(NSString *)dateStr;

/**
 比较两个日期大小
 
 @param getCarDay    完整时间格式
 @param returnCarDay 完整时间格式
 
 @return BOOL值
 */
+ (BOOL )compareGetCarDay:(NSString *)getCarDay returnCarDay:(NSString *)returnCarDay;



/**
比较两个日期大小 判断日期大小 YES 为大于等于 NO为小于
*/
+ (BOOL )compareDateWithFormat:(NSString *)format DateOne:(NSString *)dateOne DateTwo:(NSString *)dateTwo;

/**
 获取当前星期的星期日日期

 @return  当前星期的星期日日期
 */
+ (NSDate *)getTishWeekSundayDate;

+ (NSString *)yearStringFromDateString:(NSString *)dateString;

/**
 根据日期字符串获取当前日期的年月日小时分钟
 
 @param dateStr 完整的日期字符串 yyyy-MM-dd HH:mm:ss
 
 @return 年月日小时分钟
 */
+ (NSString *)yearMonthDayTimeStringFromDateString:(NSString *)dateStr;

+ (NSString *)dateFormat:(NSString *)format dateString:(NSString *)dateString returnFormat:(NSString *)retrunFomart;

//分钟 ---> 小时
+ (NSString *)convertStrToTime:(NSString *)timeStr;



/**
 根据文字内容计算宽、高的方法
 
 @param text 需要计算的文字
 @param textFont 字号大小
 @param boundingRecSize 限定范围
 @param isWidth YES为返回宽，NO为返回高
 @return 宽、高值
 */
-(CGFloat)sizeCalculateTextFont:(UIFont *)textFont BoundingRecSize:(CGSize)boundingRecSize widthOrHeight:(BOOL)isWidth;




/**
 获取日期字符串

 @param date 日期（如果传入nil则输出当前日期字符串）
 @return 字符串
 */
+ (NSString*)getDateStringWithDate:(NSDate*)date;


+ (NSString *)dateWithMonthDayHourStringFromDateString:(NSString *)dateStr;

+ (NSString *)timeHourStringFromDateString:(NSString *)dateStr;

+ (NSString *)timeMinStringFromDateString:(NSString *)dateStr;

+ (NSString *)timeHourMinStringFromDateString:(NSString *)dateStr;

/**
 获取日期字符串（yyyy-MM-dd HH:mm:ss）

 @param date 日期（如果传入nil则输出当前日期字符串）
 @return 字符串
 */
+ (NSString*)getFullDateStringWithDate:(NSDate*)date;


+ (BOOL)isAheadOfReturenTime:(NSString *)returnTime;

/**
 过滤空格

 @return 返回过滤的字符串
 */
- (NSString *)filterSpace;


/**
 获取拼音首字母

 @return 返回拼音首字母
 */
- (NSString *)getInitialPYLetter;

+ (NSInteger)intervalSecondsWithSmallDate:(NSDate*)smallDate bigDate:(NSDate*)bigDate;

- (NSString *)returnEmptyStrIfNullDate;

- (NSString *)returnStrIfNullDate:(NSString *)returnStr;

+ (NSString *)returnEmptyStringIsNullData:(NSString *)targetStr;

+ (NSString *)handleSpaceAndEnterElementWithString:(NSString *)sourceStr;

+ (NSMutableAttributedString *)richTextByHtmlStyleText:(NSString *)text Font:(CGFloat)font;

- (NSString *)stringIsEmpty;


@end
