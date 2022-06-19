//
//  NSDate+Tool.h
//  AGCategories
//
//  Created by 刘剑锋 on 2022/5/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Tool)

/// NSDate转格式显示
/// @param date 例如：[NSDate date]
/// @param formatter @"yyyy-MM-dd"
+ (NSString *)ag_dateToString:(NSDate *)date dateFormatter:(NSString *)formatter;

/// 时间戳转格式显示
/// @param timeInterval 10位的时间戳
/// @param formatter @"yyyy-MM-dd"
+ (NSString *)ag_timeIntervalToString:(NSTimeInterval)timeInterval dateFormatter:(NSString *)formatter;

#pragma mark - 返回NSDate部分

/// 根据显示时间的字符串返回NSDate
/// @param timeString 例如：1980-01-01
/// @param format @"yyyy-MM-dd"
+ (NSDate *)ag_dateWithDateString:(NSString *)timeString formatString:(NSString *)format;


/// 在已有NSDate的情况下，加减具体数字的年月日，获取未来或者过去的NSDate
/// @param presentDate presentDate description
/// @param year year 小于0为过去，大于0则为未来
/// @param month month description
/// @param day day description
+ (NSDate *)ag_dateWithPresentDate:(NSDate*)presentDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/// 根据具体的年月日获取NSDate
/// @param year year description
/// @param month month description
/// @param day day description
+ (NSDate *)ag_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

#pragma mark - 返回整型部分
/// 根据前后NSDate，获取中间差了多少天
/// @param startDate 开始时间
/// @param endDate 结束时间
+ (NSInteger)ag_daysBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

/// 获取传入Date对应的月份有多少天
/// @param date date
+ (NSInteger)ag_totaldaysInMonth:(NSDate *)date;

// 是否和当前同一天
+ (BOOL)ag_isCurrentDay:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
