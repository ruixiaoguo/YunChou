
//
//  YCCalendarSupport.h
//  caltextsssss
//
//  Created by yy on 2018/10/15.
//  Copyright © 2018年 yy. All rights reserved.
//

#ifndef YCCalendarSupport_h
#define YCCalendarSupport_h


#import "NSDate+YCCategory.h"
#import "NSDate+YCCalendar.h"

typedef NS_ENUM(NSInteger, YCCalendarDisplayType)
{
    YCCalendarDisplayMonthType,
    YCCalendarDisplayWeekType
};


@class YCCalendarView,YCCalendarMonthView,YCCalendarDayView;
@protocol YCCalendarViewDataSource <NSObject>

- (void)calendarView:(YCCalendarView *)calendarView willShowMonthView:(YCCalendarMonthView *)monthView;

- (void)calendarView:(YCCalendarView *)calendarView dayViewHaveEvent:(YCCalendarDayView *)dayView;

@end

@protocol YCCalendarViewDelegate <NSObject>

- (void)calendarView:(YCCalendarView *)calendarView didSelectDayView:(YCCalendarDayView *)dayView;

@end


// **  屏幕尺寸  **//
#define kDeviceWidth    [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight   [UIScreen mainScreen].bounds.size.height
#define WEAKSELF typeof(self) __weak weakSelf = self;


#define leftSpace  12


//==============color=================//
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define Calendar_DayView_WeekColor RGBACOLOR(255,43,49,1)

#define Calendar_DayView_SelectColor RGBACOLOR(255,152,74,1)
#define Calendar_DayView_PointColor RGBACOLOR(163,163,163,1)
#define Calendar_DayView_TextColor RGBACOLOR(34,34,34,1)
#define Calendar_DayView_NOMonthTextColor RGBACOLOR(180,180,180,1)

#define Calendar_MonthView_BackgroundColor [UIColor whiteColor]
#define IS_IPHONEX    ([[UIScreen mainScreen] bounds].size.height >= 812.0)
#define topStateNavHeight (IS_IPHONEX ? 88 : 64)

#define tabbarSafeBottomHeight (IS_IPHONEX ? 34 : 0)
// **  颜色  **//

//===============Font=================//
#define CalendarFont(size) [UIFont systemFontOfSize:size]

#define Calendar_DayView_TextFont CalendarFont(14)

#define Calendar_WeekendView_TextFont CalendarFont(15)

#define yc_Font_PFMedium(v)     ([UIFont fontWithName:@"PingFangSC-Medium" size:v]?[UIFont fontWithName:@"PingFangSC-Medium" size:v]:[UIFont systemFontOfSize:v])
#define yc_Font_PFSemibold(v)   ([UIFont fontWithName:@"PingFangSC-Semibold" size:v]?[UIFont fontWithName:@"PingFangSC-Semibold" size:v]:[UIFont systemFontOfSize:v])
#define yc_Font_PFSCRegular(v)  ([UIFont fontWithName:@"PingFangSC-Regular" size:v]?[UIFont fontWithName:@"PingFangSC-Regular" size:v]:[UIFont systemFontOfSize:v])
//===============const=============//
#define CalendarScrollTime 0.2


#endif /* YCCalendarSupport_h */
