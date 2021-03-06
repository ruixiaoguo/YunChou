//
//  YCBonusCalendarHeaderView.h
//  YunChou
//
//  Created by yy on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCBonusCalendarHeaderView : UIView

//是否展示日历详情
@property (nonatomic , copy)void (^isShowCalenderBlock)(BOOL isShow , CGFloat height);
//日历高度变化
@property (nonatomic , copy)void (^calendarHeightChangedBlock)(CGFloat height);

-(void)changeCalendarType:(BOOL)isMonth;

-(void)removeSome;

@end

NS_ASSUME_NONNULL_END
