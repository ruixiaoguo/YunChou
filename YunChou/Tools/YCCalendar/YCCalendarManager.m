
//
//  YCCalenderManager.m
//  caltextsssss
//
//  Created by yy on 2018/10/15.
//  Copyright © 2018年 yy. All rights reserved.
//

#import "YCCalendarManager.h"

@implementation YCCalendarManager

static dispatch_once_t onceToken;
static YCCalendarManager *manager;

+ (YCCalendarManager *)defaultManager
{
    
    dispatch_once(&onceToken, ^{
        manager = [[YCCalendarManager alloc] init];
        manager.selectDateArr = [NSMutableArray array];
    });
    return manager;
}

+ (void)releaseManage
{
    manager = nil;
    onceToken = 0;
}



@end
