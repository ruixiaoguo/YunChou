//
//  YCCalendarView.h
//  caltextsssss
//
//  Created by yy on 2018/10/12.
//  Copyright © 2018年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCCalendarMonthView.h"
#import "YCWeekendView.h"
#import "YCCalendarSupport.h"
#import "YCCalendarManager.h"

#define CalendarDayView_HW_Ration 0.76

NS_ASSUME_NONNULL_BEGIN

@interface YCCalendarView : UIView


@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, assign, readonly) YCCalendarDisplayType displayType;

@property (nonatomic, weak) id <YCCalendarViewDataSource>dataSource;

@property (nonatomic, weak) id <YCCalendarViewDelegate>delegate;

@property (nonatomic, strong) NSDate *calendarSelectDate; //can be nil

-(void)changeDisplayType:(YCCalendarDisplayType)type animated:(BOOL)animated;

-(void)goToToday;

-(void)goToNext;

-(void)goTOLast;

-(void)reloadEvent;

@end

NS_ASSUME_NONNULL_END
