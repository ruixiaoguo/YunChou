//
//  YCWeekendView.m
//  caltextsssss
//
//  Created by yy on 2018/10/12.
//  Copyright © 2018年 yy. All rights reserved.
//

#import "YCWeekendView.h"
#import "YCCalendarSupport.h"

@implementation YCWeekendView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews{
    NSArray *weekShow = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    CGFloat widths = (kDeviceWidth - leftSpace*2)/7;
    for (int i = 0; i < 7; i++)
    {
        UILabel *lb = [[UILabel alloc] init];
        lb.textColor = RGBACOLOR(180, 180, 180, 1);
        lb.font = yc_Font_PFMedium(17);
        lb.frame = CGRectMake(leftSpace + i * widths, 0, widths, self.frame.size.height);
        lb.text = weekShow[i];
        lb.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lb];
    }
    CGFloat ll = leftSpace + 5;
    UILabel *lins = [[UILabel alloc]initWithFrame:CGRectMake(ll, self.bounds.size.height - 0.8, kDeviceWidth - ll*2, 0.8)];
    lins.backgroundColor = RGBACOLOR(246, 246, 246, 1);
    [self addSubview:lins];
    
}

@end
