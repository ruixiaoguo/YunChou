//
//  NSDate+YCCalendar.m
//  caltextsssss
//
//  Created by yy on 2018/10/15.
//  Copyright © 2018年 yy. All rights reserved.
//

#import "NSDate+YCCalendar.h"

@implementation NSDate (YCCalendar)

- (NSInteger)dayNumOfCurrentMonth
{
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}


- (NSDate *)dateWithMonthBeginWith:(NSString *)dateStr{
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM"];
    NSDate *newDate=[format dateFromString:dateStr];
    double interval = 0;
    NSDate *beginDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:2];//设定周一为周首日
    [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:newDate];
    return beginDate;
}

- (NSDate *)dateWithWeekBeginDateWith:(NSString *)dateStr{
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM"];
    NSDate *newDate = [format dateFromString:dateStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth fromDate:newDate];
    NSInteger weekday = [dateComponents weekday];
    NSInteger firstDiff;
    if (weekday == 1)
    {
        firstDiff = -6;
    }
    else
    {
        firstDiff =  - weekday + 2;
    }
    NSInteger day = [dateComponents day];
    NSDateComponents *firstComponents = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
    [firstComponents setDay:day+firstDiff];
    NSDate *firstDay = [calendar dateFromComponents:firstComponents];
    
    return firstDay;
    
}


- (NSDate *)dateWithMonthBegainDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *firstDay;
    [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&firstDay interval:nil forDate:self];
    return firstDay;
}

- (NSDate *)dateWithWeekBegainDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSInteger weekday = [dateComponents weekday];
    NSInteger firstDiff;
    if (weekday == 1)
    {
        firstDiff = -6;
    }
    else
    {
        firstDiff =  - weekday + 2;
    }
    NSInteger day = [dateComponents day];
    NSDateComponents *firstComponents = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
    [firstComponents setDay:day+firstDiff];
    NSDate *firstDay = [calendar dateFromComponents:firstComponents];
    
    return firstDay;
}

- (BOOL)isSameDayToDate:(NSDate *)date
{
    if (!date){
        NSLog(@"不是个adate");
        return NO;
        
    }
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:self];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date];
    return (([comp1 day] == [comp2 day]) && ([comp1 month] == [comp2 month]) && ([comp1 year] == [comp2 year]));
}



@end
