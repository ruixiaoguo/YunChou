//
//  YCCalendarLayout.h
//  caltextsssss
//
//  Created by yy on 2018/10/12.
//  Copyright © 2018年 yy. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "YCCalendarIndexPath.h"

NS_ASSUME_NONNULL_BEGIN

@interface YCCalendarLayout : NSObject

@property (nonatomic, assign) CGFloat lineSpace;//default 1

@property (nonatomic, assign) CGFloat interimSpace; // default 1

//default width = (monthView.width - line * 6) / 7  height = (monthView.height - interimspace * 6) / 7
@property (nonatomic, assign) CGSize itemSize;

@property (nonatomic, weak) YCCalendarIndexPath *monthView;

- (CGRect)dayViewFrameAtIndexPath:(YCCalendarIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
