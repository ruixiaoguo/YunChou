//
//  YCCalendarDayView.h
//  caltextsssss
//
//  Created by yy on 2018/10/12.
//  Copyright © 2018年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCCalendarDayView : UIControl

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, assign) BOOL haveEvent;

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, assign) NSInteger month;

@end

NS_ASSUME_NONNULL_END
