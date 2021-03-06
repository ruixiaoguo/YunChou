

//
//  YCBonusCalendarHeaderView.m
//  YunChou
//
//  Created by yy on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

#import "YCBonusCalendarHeaderView.h"

#import "YCCalendarView.h"
#import "NSDate+YCCalendar.h"
#import "NSDate+YCCategory.h"
#import "YCCalendarManager.h"

@interface  YCBonusCalendarHeaderView() <YCCalendarViewDataSource,YCCalendarViewDelegate>

@property (nonatomic , assign) BOOL isShow;

@property (nonatomic, copy) NSString *currentMonth;

@property (nonatomic , assign) CGFloat heights;

@property (nonatomic , strong)UIView *toolVC;
@property (nonatomic , strong)UIButton *leftYearBtn;

@property (nonatomic , strong)UIButton *rightBtn;


@property (nonatomic , strong)UIButton *lastBtn;
@property (nonatomic , strong)UILabel *titleLB;
@property (nonatomic , strong)UIButton *nextBtn;


@property (nonatomic, strong) YCCalendarView *calendarView;


@end

@implementation YCBonusCalendarHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createSubViews];
    }
    return self;
}
-(void)removeSome{
    [_calendarView removeFromSuperview];
    _calendarView = nil;
    [YCCalendarManager releaseManage];
}

-(void)createSubViews{
    
    _heights = kDeviceWidth/7 * CalendarDayView_HW_Ration * 7 + 20;
    _currentMonth = [[NSDate date] YC_stringWithFormate:@"yyyy-MM"];
    
    [self addSubview:self.toolVC];
    
    [_toolVC addSubview:self.leftYearBtn];
    [_toolVC addSubview:self.rightBtn];
    
    
    [_toolVC addSubview:self.titleLB];
    [_toolVC addSubview:self.lastBtn];
    [_toolVC addSubview:self.nextBtn];
    _lastBtn.hidden = YES;
    _titleLB.hidden = YES;
    _nextBtn.hidden = YES;
    
    
    
    CGFloat itemWH = kDeviceWidth / 7;
    self.calendarView = [[YCCalendarView alloc] initWithFrame:CGRectMake(0, 55, kDeviceWidth, itemWH * CalendarDayView_HW_Ration * 7 + 30)];
    self.calendarView.dataSource = self;
    self.calendarView.delegate = self;
    [self addSubview:self.calendarView];
    
}

-(void)changeCalendarType:(BOOL)isMonth{
    CGFloat itemWH = kDeviceWidth / 7;
    
    
    YCCalendarDisplayType type = YCCalendarDisplayMonthType;
    
    if (isMonth) {
        type = YCCalendarDisplayWeekType;
    }else{
        type = YCCalendarDisplayMonthType;
    }
    
    [self.calendarView changeDisplayType:type animated:YES];
    CGRect frame = self.calendarView.frame;
    if (type == YCCalendarDisplayWeekType)
    {
        frame.size.height = itemWH + 48;
    }else{
        frame.size.height = itemWH * CalendarDayView_HW_Ration * 7 + 20;
    }
    _heights = frame.size.height;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.calendarView.frame = frame;
    }];
    if (self.calendarHeightChangedBlock) {
        _calendarHeightChangedBlock(frame.size.height);
    }
    
}

-(void)leftYearBtnHandel{
    //左侧年份按钮
}

-(void)rightBtnHandel:(UIButton *)sender{
    //右侧类型按钮
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        //显示
        _lastBtn.hidden = NO;
        _titleLB.hidden = NO;
        _nextBtn.hidden = NO;
        _leftYearBtn.hidden = YES;
        
    }else{
        //隐藏
        _lastBtn.hidden = YES;
        _titleLB.hidden = YES;
        _nextBtn.hidden = YES;
        _leftYearBtn.hidden = NO;
    }
    if (self.isShowCalenderBlock) {
        _isShowCalenderBlock(sender.selected , _heights);
    }
}



-(void)lastBtnHandel{
    //上月或上周
    [self.calendarView goTOLast];
}
-(void)nextBtnHandel{
    //下月或下周
    [self.calendarView goToNext];
}



- (void)calendarView:(YCCalendarView *)calendarView willShowMonthView:(YCCalendarMonthView *)monthView
{
    self.currentMonth = [NSString stringWithFormat:@"%@",[monthView.beaginDate YC_stringWithFormate:@"yyyy-MM"]];
    self.titleLB.text = [NSString stringWithFormat:@"%@",[monthView.beaginDate YC_stringWithFormate:@"yyyy年MM月"]];
    [YCCalendarManager defaultManager].lastSelectMonth = monthView.beaginDate;
}

- (void)calendarView:(YCCalendarView *)calendarView dayViewHaveEvent:(YCCalendarDayView *)dayView
{
    //    dayView.haveEvent = dayView.date.day % 3 == 0;
}

- (void)calendarView:(YCCalendarView *)calendarView didSelectDayView:(YCCalendarDayView *)dayView
{
//    [[YCCalendarManager defaultManager].selectDateArr addObject:dayView.date];
    [_leftYearBtn setTitle:[dayView.date YC_stringWithFormate:@"yyyy年"] forState:UIControlStateNormal];
    
    NSLog(@"select %@",[dayView.date YC_stringWithFormate:@"yyyy-MM-dd"]);
}




-(UIView *)toolVC{
    if (!_toolVC) {
        _toolVC = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 55)];
        _toolVC.backgroundColor = RGBACOLOR(72, 153, 240, 1);
    }
    return _toolVC;
}


-(UIButton *)leftYearBtn{
    if (!_leftYearBtn) {
        _leftYearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftYearBtn.frame = CGRectMake(15, 0, 80, 55);
//        _leftYearBtn.backgroundColor = [UIColor yellowColor];
        [_leftYearBtn setTitle:@"全部" forState:UIControlStateNormal];
        [_leftYearBtn setImage:[UIImage imageNamed:@"yc_right_row"] forState:UIControlStateNormal];
        _leftYearBtn.titleLabel.font = yc_Font_PFSemibold(17);
        [_leftYearBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -25, 0, -15)];
        [_leftYearBtn setImageEdgeInsets:UIEdgeInsetsMake(20, 80-15, 20, 0)];
        _leftYearBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

        //        [_leftYearBtn setTitle:[[NSDate date] YC_stringWithFormate:@"yyyy"] forState:UIControlStateNormal];
        [_leftYearBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_leftYearBtn addTarget:self action:@selector(leftYearBtnHandel) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftYearBtn;
}


-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(kDeviceWidth - 25, 0, 25, 25);
        _rightBtn.center = CGPointMake(kDeviceWidth - 25 , _toolVC.center.y);
        [_rightBtn setImage:[UIImage imageNamed:@"yc_bonus_calendar"] forState:UIControlStateNormal];
        [_rightBtn setImage:[UIImage imageNamed:@"yc_bonus_time"] forState:UIControlStateSelected];

        _rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(rightBtnHandel:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _rightBtn;
}

-(UILabel *)titleLB{
    if (!_titleLB) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectMake((kDeviceWidth-100)/2, 0, 100, 55)];
        _titleLB.font = yc_Font_PFSemibold(17);
        _titleLB.textColor = [UIColor whiteColor];
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.text = [[NSDate date] YC_stringWithFormate:@"yyyy年MM月"];
    }
    return _titleLB;
}


-(UIButton *)lastBtn{
    if (!_lastBtn) {
        _lastBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _lastBtn.frame = CGRectMake(CGRectGetMaxX(_titleLB.frame) - 100 - 15 - 20, 20, 15, 15);
        [_lastBtn setImage:[UIImage imageNamed:@"yc_left_row"] forState:UIControlStateNormal];
        [_lastBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_lastBtn addTarget:self action:@selector(lastBtnHandel) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _lastBtn;
}

-(UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.frame = CGRectMake(CGRectGetMaxX(_titleLB.frame) + 20, 20, 15, 15);
        [_nextBtn setImage:[UIImage imageNamed:@"yc_right_row"] forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(nextBtnHandel) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _nextBtn;
}


@end
