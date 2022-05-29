//
//  NSDate+Tool.m
//  AGCategories
//
//  Created by 刘剑锋 on 2022/5/28.
//

#import "NSDate+Tool.h"

@implementation NSDate (Tool)

//内部方法、也可以自己暴露
+ (NSDateFormatter *)setDateFormatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    //这条很重要，不加的话。手机设置选择外国可能就会返回中文
    [dateFormatter setLocale:[NSLocale currentLocale]];
    return dateFormatter;
}

+ (NSDateComponents *)components:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[self class] setDateFormatter:@"yyyy-MM-dd"];
    NSString *dateString = [NSDate agtimeIntervalToString:date.timeIntervalSince1970 dateFormatter:dateFormatter.dateFormat];
    NSDate *startDate = [dateFormatter dateFromString:dateString];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | kCFCalendarUnitWeekday | kCFCalendarUnitWeekdayOrdinal) fromDate:startDate];
    
    return components;
}

#pragma mark - 返回NSString部分
/// NSDate转格式显示
/// @param date 例如：[NSDate date]
/// @param formatter @"yyyy-MM-dd"
+ (NSString *)agdateToString:(NSDate *)date dateFormatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [[self class] setDateFormatter:formatter];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

/// 时间戳转格式显示
/// @param timeInterval 10位的时间戳
/// @param formatter @"yyyy-MM-dd"
+ (NSString *)agtimeIntervalToString:(NSTimeInterval)timeInterval dateFormatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[self class] setDateFormatter:formatter];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}
#pragma mark - 返回NSDate部分

+ (NSDate *)agdateWithDateString:(NSString *)dateString formatString:(NSString *)format {
    NSDateFormatter *dateFormatter = [[self class] setDateFormatter:format];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

+ (NSDate *)agdateWithPresentDate:(NSDate*)presentDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateComponents *adcomps = [[NSDateComponents alloc] init];

    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];

    return [calendar dateByAddingComponents:adcomps toDate:presentDate options:0];
}

+ (NSDate *)agdateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];

    [adcomps setYear:year];

    [adcomps setMonth:month];

    [adcomps setDay:day];
    
    return [calendar dateFromComponents:adcomps];
}
#pragma mark - 返回整型部分

+ (NSInteger)agdaysBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    NSDateComponents *startComponents = [NSDate components:startDate];
    NSDateComponents *endComponents = [NSDate components:endDate];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDateComponents:startComponents toDateComponents:endComponents options:NSCalendarWrapComponents];
    return components.day;
}

// 获取当前月共有多少天
+ (NSInteger)agtotaldaysInMonth:(NSDate *)date {
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    
    return daysInLastMonth.length;
}

// 日期判断
+ (BOOL)agisCurrentDay:(NSDate *)date {
    BOOL result = NO;
    
    NSString *dateString = [NSDate agdateToString:date dateFormatter:@"yyyy-MM-dd"];
    NSString *nowString = [NSDate agdateToString:[NSDate date] dateFormatter:@"yyyy-MM-dd"];
    
    if ([dateString isEqualToString:nowString]) {
        result = YES;
    }
    
    return result;
}


@end
