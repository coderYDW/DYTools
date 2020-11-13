//
//  NSString+Extension.m
//  QHZC
//
//  Created by HP on 16/10/23.
//  Copyright © 2016年 QHJF. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/**
 根据日期字符串获取当前日期的月日
 
 @param dateStr 完整的日期字符串
 
 @return 月日
 */
+ (NSString *)dateStringFromDateString:(NSString *)dateStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateStr];
    
    [formatter setDateFormat:@"MM-dd"];
    
    return [formatter stringFromDate:date];
}


/**
 根据日期字符串获取当前月日、时分

 @param dateStr 完整的日期字符串
 @return 月日、时分
 */
+ (NSString *)dateWithoutYearStringFromDateString:(NSString *)dateStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateStr];
    
    [formatter setDateFormat:@"MM-dd HH:mm"];
    
    return [formatter stringFromDate:date];
    
}

/**
 根据日期字符串获取当前月日、时分

 @param dateStr 完整的日期字符串
 @return 月日、时分
 */
+ (NSString *)dateWithMonthDayHourStringFromDateString:(NSString *)dateStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateStr];
    
    [formatter setDateFormat:@"MM月dd日 HH:mm"];
    
    return [formatter stringFromDate:date];
    
}

/**
 根据日期字符串获取当前日期是周几
 
 @param dateStr 完整的日期字符串
 
 @return 星期
 */
+ (NSString *)weekStringFromDateString:(NSString *)dateStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateStr];
    
    [formatter setDateFormat:@"EE"];
    
    return [formatter stringFromDate:date];
}

/**
 根据日期字符串获取当前日期的小时分钟
 
 @param dateStr 完整的日期字符串
 
 @return 小时分钟
 */
+ (NSString *)timeStringFromDateString:(NSString *)dateStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateStr];
    [formatter setDateFormat:@"HH:mm"];
    
    return [formatter stringFromDate:date];
}

+ (NSString *)timeHourStringFromDateString:(NSString *)dateStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:@"HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateStr];
    [formatter setDateFormat:@"HH"];
    
    return [formatter stringFromDate:date];
}

+ (NSString *)timeMinStringFromDateString:(NSString *)dateStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:@"HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateStr];
    [formatter setDateFormat:@"mm"];
    
    return [formatter stringFromDate:date];
}

+ (NSString *)timeHourMinStringFromDateString:(NSString *)dateStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:@"HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateStr];
    [formatter setDateFormat:@"HH:mm"];
    
    return [formatter stringFromDate:date];
}

+ (NSString *)weakAndTimeFromDateString:(NSString *)dateStr {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateStr];
    [formatter setDateFormat:@"EE HH:mm"];
    
    return [formatter stringFromDate:date];
}

/** 根据完整日期计算日期间隔天数*/
+ (NSString *)currentDaysWithRentDate:(NSString *)rentdate ReturnDate:(NSString *)returndate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *getDay = [formatter dateFromString:rentdate];
    NSDate *returnDay = [formatter dateFromString:returndate];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *firstDay = [formatter dateFromString:[formatter stringFromDate:getDay]];
    
    NSDate *secondDay = [formatter dateFromString:[formatter stringFromDate:returnDay]];
    
    NSCalendar *userCalendar = [NSCalendar currentCalendar];
    
    unsigned int unitFlags = NSCalendarUnitDay;
    
    NSDateComponents *compontents = [userCalendar components:unitFlags fromDate:firstDay toDate:secondDay options:NSCalendarWrapComponents];
    
    //两个日期之间相距多少天 int类型的
    NSInteger day = [compontents day] ;
    
    if (day == 0) {
        
        day = day + 1;
    }
    return [NSString stringWithFormat:@"%zd",day];
}

/** 根据完整日期计算日期间隔天数*/
+ (int)currentDaysWithStartWorkDate:(NSString *)startWorkDate EndWorkDate:(NSString *)endWorkDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *getDay = [formatter dateFromString:startWorkDate];
    NSDate *returnDay = [formatter dateFromString:endWorkDate];
    
//    [formatter setDateFormat:@"yyyy-MM-dd"];
//    
//    NSDate *firstDay = [formatter dateFromString:[formatter stringFromDate:getDay]];
//    
//    NSDate *secondDay = [formatter dateFromString:[formatter stringFromDate:returnDay]];
    
    NSCalendar *userCalendar = [NSCalendar currentCalendar];
    
    unsigned int unitFlags = NSCalendarUnitDay;
    
    NSDateComponents *compontents = [userCalendar components:unitFlags fromDate:getDay toDate:returnDay options:NSCalendarWrapComponents];
    
    //两个日期之间相距多少天 int类型的
    NSInteger day = [compontents day] ;
    
    return (int)day + 1;
}

/**
 比较两个日期大小

 @param getCarDay    完整时间格式
 @param returnCarDay 完整时间格式

 @return BOOL值
 */
+ (BOOL )compareGetCarDay:(NSString *)getCarDay returnCarDay:(NSString *)returnCarDay {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *getCarDate = [formatter dateFromString:getCarDay];
    NSDate *returnCarDate = [formatter dateFromString:returnCarDay];
    
    NSComparisonResult result = [getCarDate compare:returnCarDate];
    if (result == NSOrderedDescending || result == NSOrderedSame) {
        
        NSLog(@"getCarDay > returnCarDay");
        return NO;
    }
    else if (result == NSOrderedAscending){
        NSLog(@"getCarDay < returnCarDay");
        return YES;
    }
    
    return YES;
}


/// 判断日期大小 YES 为大于等于 NO为小于
/// @param format
/// @param dateOne
/// @param dateTwo
+ (BOOL )compareDateWithFormat:(NSString *)format DateOne:(NSString *)dateOne DateTwo:(NSString *)dateTwo {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:format];
    
    NSDate *getCarDate = [formatter dateFromString:dateOne];
    NSDate *returnCarDate = [formatter dateFromString:dateOne];
    
    NSComparisonResult result = [getCarDate compare:returnCarDate];
    if (result == NSOrderedDescending || result == NSOrderedSame) {
        
        NSLog(@"getCarDay > returnCarDay");
        return YES;
    }
    else if (result == NSOrderedAscending){
        NSLog(@"getCarDay < returnCarDay");
        return NO;
    }
    
    return YES;
}


// 获取当前周的周一和周日的时间
+ (NSDate *)getTishWeekSundayDate
{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:nowDate];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
//    NSLog(@"%zd----%zd",weekDay,day);
    
    // 计算当前日期和本周的星期一和星期天相差天数
    long firstDiff,lastDiff;
    //    weekDay = 1;
    if (weekDay == 1)
    {
        firstDiff = -6;
        lastDiff = 0;
    }
    else
    {
        firstDiff = [calendar firstWeekday] - weekDay + 1;
        lastDiff = 8 - weekDay;
    }
//    NSLog(@"firstDiff: %ld   lastDiff: %ld",firstDiff,lastDiff);
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    NSDateComponents *firstDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay  fromDate:nowDate];
    [firstDayComp setDay:day + firstDiff];
    NSDate *firstDayOfWeek = [calendar dateFromComponents:firstDayComp];
    
    NSDateComponents *lastDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay   fromDate:nowDate];
    [lastDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek = [calendar dateFromComponents:lastDayComp];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM月dd日"];
    NSString *Monday = [formatter stringFromDate:firstDayOfWeek];
    NSString *Sunday = [formatter stringFromDate:lastDayOfWeek];
    
    NSLog(@"%@=======%@",Monday,Sunday);
    
//    NSString *dateStr = [NSString stringWithFormat:@"%@-%@",Monday,Sunday];
    return lastDayOfWeek;
    
}


+ (NSString *)yearStringFromDateString:(NSString *)dateString {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateString];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    return [formatter stringFromDate:date];
}

/**
 根据日期字符串获取当前日期的年月日小时分钟
 
 @param dateStr 完整的日期字符串 yyyy-MM-dd HH:mm:ss
 
 @return 年月日小时分钟
 */
+ (NSString *)yearMonthDayTimeStringFromDateString:(NSString *)dateStr {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateStr];
    
    [formatter setDateFormat:@"yyyy-MM-dd   HH:mm"];
    
    return [formatter stringFromDate:date];
}

+ (NSString *)dateFormat:(NSString *)format dateString:(NSString *)dateString returnFormat:(NSString *)retrunFomart {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    
    [formatter setDateFormat:format];
    
    NSDate *date = [formatter dateFromString:dateString];
    
    [formatter setDateFormat:retrunFomart];
    
    NSString *returnDateString = [formatter stringFromDate:date];
    
    if (!returnDateString) {
        returnDateString = @"";
    }
    
    return returnDateString;
}

//分钟 ---> 小时
+ (NSString *)convertStrToTime:(NSString *)timeStr
{
    
    int hour = 0;
    int minute = timeStr.intValue;
    
    NSString *str = @"";
    
    if (minute > 60) {
        hour = minute / 60;
        minute = minute % 60;
        if (minute == 0) {
            str = [NSString stringWithFormat:@"%d小时",hour];
        } else {
            str = [NSString stringWithFormat:@"%d小时%d分钟",hour,minute];
        }
        
    } else if (minute == 60) {
        str = @"1小时";
    } else {
        str = [NSString stringWithFormat:@"%d分钟",minute];
    }
    
    return str;
}

-(CGFloat)sizeCalculateTextFont:(UIFont *)textFont BoundingRecSize:(CGSize)boundingRecSize widthOrHeight:(BOOL)isWidth;
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = textFont;
    CGSize size =  [self boundingRectWithSize:boundingRecSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    if (isWidth)
    {
        return size.width;
    }
    else
    {
        return size.height;
    }
}

+ (NSString*)getDateStringWithDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *currentTimeString;
    if(!date)
    {
        NSDate *datenow = [NSDate date];
        currentTimeString = [formatter stringFromDate:datenow];
    }
    else
    {
        currentTimeString = [formatter stringFromDate:date];

    }
    
    return currentTimeString;
}

+ (NSString*)getFullDateStringWithDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *currentTimeString;
    if(!date)
    {
        NSDate *datenow = [NSDate date];
        currentTimeString = [formatter stringFromDate:datenow];
    }
    else
    {
        currentTimeString = [formatter stringFromDate:date];
        
    }
    
    return currentTimeString;
}

+ (BOOL)isAheadOfReturenTime:(NSString *)returnTime {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *nowDate = [NSDate date];
    NSDate *returnCarDate = [formatter dateFromString:returnTime];
    
    NSComparisonResult result = [nowDate compare:returnCarDate];
    if (result == NSOrderedAscending) {
        
        return YES;
    }
    return NO;
}

- (NSString *)filterSpace
{
    //过滤字符串前后的空格
    NSString *temStr = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    //过滤中间空格
    temStr = [temStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return temStr;
    
}

- (NSString *)getInitialPYLetter
{
    
    if (self)
    {
        //转成了可变字符串
        NSMutableString *str = [NSMutableString stringWithString:self];
        //先转换为带声调的拼音
        CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
        //再转换为不带声调的拼音
        CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
        //转化为大写拼音
        NSString *pinYin = [str capitalizedString];
        //获取并返回首字母
        return [pinYin substringToIndex:1];
    }
    else
    {
        return @"";
    }
 
}


+ (NSInteger)intervalSecondsWithSmallDate:(NSDate*)smallDate bigDate:(NSDate*)bigDate
{
    
    NSCalendar *calendar =[NSCalendar currentCalendar];

    NSDateComponents *dateComp= [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitWeekday | NSCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitSecond fromDate:smallDate toDate:bigDate options:0];
    
    NSInteger months = [dateComp month];
    NSInteger days = [dateComp day];
    NSInteger hours = [dateComp hour];
    NSInteger minutes = [dateComp minute];
    NSInteger seconds = [dateComp second];
    
    NSInteger second = months*30*24*3600 + days*24*3600 + hours*3600 + minutes*60 + seconds;

    return second;
}

+ (NSString *)returnEmptyStringIsNullData:(NSString *)targetStr
{
    if (!targetStr)
    {
        return @"";
    }
    else
    {
        return targetStr;
    }
}

- (NSString *)returnEmptyStrIfNullDate
{
//    if([self isNotEmpty] || self.length > 0)
//    {
//        return self;
//    }
//    else
//    {
//        return @"";
//    }
    
    if(!self)
    {
        return @"";
    }
    else
    {
        return self;
    }
    
}

- (NSString *)returnStrIfNullDate:(NSString *)returnStr
{
    if(self && self.length > 0)
    {
        return self;
    }
    else
    {
        return returnStr;
    }
}

+ (NSString *)handleSpaceAndEnterElementWithString:(NSString *)sourceStr
{
    NSString *realSre = [sourceStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *realSre1 = [realSre stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    NSString *realSre2 = [realSre1 stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *realSre3 = [realSre2 stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *realSre4 = [realSre3 stringByReplacingOccurrencesOfString:@"(" withString:@""];
    NSString *realSre5 = [realSre4 stringByReplacingOccurrencesOfString:@")" withString:@""];
    NSArray *array = [realSre5 componentsSeparatedByString:@","];
    return [array objectAtIndex:0];
    
}

+ (NSMutableAttributedString *)richTextByHtmlStyleText:(NSString *)text Font:(CGFloat)font
{
    NSString *message = text;
    NSDictionary *option = @{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType};
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithData:[message dataUsingEncoding:NSUnicodeStringEncoding] options:option documentAttributes:nil error:nil];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(0, attrStr.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:10];
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attrStr.length)];
    
    return attrStr;
}

- (NSString *)stringIsEmpty
{
    if (self)
    {
        return self;
    }
    else
    {
        return @"";
    }
}

@end
