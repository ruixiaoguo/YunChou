//
//  YCCalenderManager.h
//  caltextsssss
//
//  Created by yy on 2018/10/15.
//  Copyright © 2018年 yy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCCalendarSupport.h"
#import "YCCalendarDayView.h"
#import "YCCalendarMonthView.h"


@interface YCCalendarManager : NSObject


@property (nonatomic, assign) YCCalendarDisplayType displayType;

@property (nonatomic, weak) id <YCCalendarViewDelegate>delegate;

@property (nonatomic, weak) id <YCCalendarViewDataSource>dataSource;

@property (nonatomic, weak) YCCalendarDayView *selectDayView;

@property (nonatomic, strong) NSDate *selectDate;

@property (nonatomic , strong)NSMutableArray *selectDateArr;

@property (nonatomic, weak) YCCalendarView *calendarView;

@property (nonatomic , copy)NSDate *lastSelectMonth;

+ (YCCalendarManager *)defaultManager;

+ (void)releaseManage;


@end


