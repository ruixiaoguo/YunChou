

//
//  YCEmptyView.m
//  YunChou
//
//  Created by yy on 2018/10/23.
//  Copyright © 2018年 grx. All rights reserved.
//

#import "YCEmptyView.h"
#import "YCCalendarSupport.h"

@implementation YCEmptyView

+ (instancetype)diyEmptyView{
    
    return [YCEmptyView emptyViewWithImageStr:@"yc_emptyView"
                                       titleStr:@"暂无数据"
                                      detailStr:@""];
}

+ (instancetype)diyEmptyActionViewWithTarget:(id)target action:(SEL)action{
    return [YCEmptyView emptyActionViewWithImageStr:@"yc_emptyView"
                                             titleStr:@"无网络连接"
                                            detailStr:@""
                                          btnTitleStr:@"重新加载"
                                               target:target
                                               action:action];
}

- (void)prepare{
    [super prepare];
    
    //    self.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    
    self.autoShowEmptyView = NO;
    self.contentViewOffset = -80;
    self.titleLabTextColor = RGBACOLOR(45,45,45,1);
    self.titleLabFont = [UIFont systemFontOfSize:18];
    self.detailLabTextColor = RGBACOLOR(80,80,80,1);
}


@end
