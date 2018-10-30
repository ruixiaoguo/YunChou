//
//  YCCalendarMonthView.h
//  caltextsssss
//
//  Created by yy on 2018/10/12.
//  Copyright © 2018年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCCalendarLayout.h"
#import "YCCalendarDayView.h"


NS_ASSUME_NONNULL_BEGIN

@interface YCCalendarMonthView : UIView

@property (nonatomic, readonly, strong) NSArray <YCCalendarDayView *>*allDayView;
@property (readonly, nonatomic) UILongPressGestureRecognizer *swipeToChooseGesture;

@property (nonatomic, readonly, strong) YCCalendarLayout *layout;
- (instancetype)initWithCalendarLayout:(YCCalendarLayout *)layout;

- (void)changeDisplayTypeWithAnimate:(BOOL)animate;

@property (nonatomic, assign) NSInteger weekLine;

@property (nonatomic, strong) NSDate *beaginDate;
- (void)reload;
- (void)reloadWithBegainDate:(NSDate *)date;

- (YCCalendarDayView *)dayViewWithIndexPath:(YCCalendarIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
