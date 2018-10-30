//
//  NSDate+YCCalendar.h
//  caltextsssss
//
//  Created by yy on 2018/10/15.
//  Copyright © 2018年 yy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (YCCalendar)

- (NSInteger)dayNumOfCurrentMonth;

- (NSDate *)dateWithMonthBegainDate;

- (NSDate *)dateWithWeekBegainDate;

- (NSDate *)dateWithMonthBeginWith:(NSString *)dateStr;

- (NSDate *)dateWithWeekBeginDateWith:(NSString *)dateStr;

- (BOOL)isSameDayToDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
