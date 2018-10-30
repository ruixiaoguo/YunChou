//
//  YCCalendarLayout.m
//  caltextsssss
//
//  Created by yy on 2018/10/12.
//  Copyright © 2018年 yy. All rights reserved.
//

#import "YCCalendarLayout.h"
#import "YCCalendarManager.h"

@implementation YCCalendarLayout

- (instancetype)init
{
    if (self = [super init])
    {
        self.lineSpace = 0;
        self.interimSpace = -3;
    }
    return self;
}

- (CGRect)dayViewFrameAtIndexPath:(YCCalendarIndexPath *)indexPath
{
    if ([YCCalendarManager defaultManager].displayType == YCCalendarDisplayMonthType)
    {
        return CGRectMake(indexPath.row * (self.itemSize.width + self.interimSpace) + 8, indexPath.line * (self.itemSize.height + self.lineSpace), self.itemSize.width, self.itemSize.height);
    }
    else
    {
        return CGRectMake(indexPath.row * (self.itemSize.width + self.interimSpace) + 8, 0, self.itemSize.width, self.itemSize.height);
    }
}

@end
