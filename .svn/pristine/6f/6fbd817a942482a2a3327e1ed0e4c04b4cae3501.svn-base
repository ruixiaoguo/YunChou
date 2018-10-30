
//
//  YCBonusCalenderViewController.m
//  YunChou
//
//  Created by yy on 2018/10/12.
//  Copyright © 2018年 grx. All rights reserved.
//

#import "YCBonusCalenderViewController.h"

#import "NSDate+YCCalendar.h"
#import "NSDate+YCCategory.h"
#import "YCCalendarManager.h"
#import "YCBonusCalendarHeaderView.h"
#import "YCBonusCalendarTableViewCell.h"
#import "YCCalendarSupport.h"

@interface YCBonusCalenderViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL calendarType;
}

@property (nonatomic , strong)NSArray *dataArr;

@property (nonatomic , strong)YCBonusCalendarHeaderView *headerVC;

@property (nonatomic , strong)UITableView *tableVC;

@property (nonatomic , strong)UIButton *typeBtn;


@end

@implementation YCBonusCalenderViewController

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [_headerVC removeSome];
    [_headerVC removeFromSuperview];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [_headerVC removeSome];
//    [_headerVC removeFromSuperview];
}




- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"分红日历";
    self.view.layer.masksToBounds = YES;

//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
//
//    self.navigationItem.leftBarButtonItem = backItem;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 30, 30);
    
//    [backButton setTitle:@"back" forState:UIControlStateNormal];
    
    [backButton setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
  
    
    _dataArr = @[
                 @[
                     @{@"title":@"丽郎黄山度假村项目",@"content":@[@{@"num":@"股权方案一",@"money":@"1000"},@{@"num":@"股权方案二",@"money":@"500"}]},
                     
                     @{@"title":@"丽郎黄山度假村项目",@"content":@[@{@"num":@"股权方案一",@"money":@"1000"},@{@"num":@"股权方案一",@"money":@"1000"},@{@"num":@"股权方案二",@"money":@"500"}]}
                     ],
                 @[@{@"title":@"丽郎黄山度假村项目",@"content":@[@{@"num":@"股权方案一",@"money":@"1000"}]}],
                 @[@{@"title":@"丽郎黄山度假村项目",@"content":@[@{@"num":@"股权方案一",@"money":@"1000"},@{@"num":@"股权方案二",@"money":@"500"}]},
                   @{@"title":@"丽郎黄山度假村项目",@"content":@[@{@"num":@"股权方案一",@"money":@"1000"},@{@"num":@"股权方案二",@"money":@"500"}]},
                   @{@"title":@"丽郎黄山度假村项目",@"content":@[@{@"num":@"股权方案一",@"money":@"1000"},@{@"num":@"股权方案二",@"money":@"500"}]}
                   ]
                 ];
    
    
    [self.view addSubview:self.headerVC];
    [self.view addSubview:self.tableVC];
    [self.view addSubview:self.typeBtn];
    [self someBlock];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)someBlock{
    WEAKSELF
    _headerVC.isShowCalenderBlock = ^(BOOL isShow, CGFloat height) {
        //是否展开日历
        if (isShow) {
            weakSelf.typeBtn.alpha = 1;
            [UIView animateWithDuration:0.5 animations:^{
                weakSelf.headerVC.frame = CGRectMake(0, topStateNavHeight, kDeviceWidth, 55+height);
                weakSelf.tableVC.frame = CGRectMake(0, weakSelf.headerVC.frame.size.height + topStateNavHeight, kDeviceWidth, kDeviceHeight - topStateNavHeight - weakSelf.headerVC.frame.size.height);
                weakSelf.typeBtn.frame = CGRectMake(kDeviceWidth - 30, weakSelf.headerVC.frame.size.height + topStateNavHeight, 25, 25);
            }];
            
        }else{
            weakSelf.typeBtn.alpha = 0;
            [UIView animateWithDuration:0.5 animations:^{
                weakSelf.headerVC.frame = CGRectMake(0, topStateNavHeight, kDeviceWidth, 55);
                weakSelf.tableVC.frame = CGRectMake(0, weakSelf.headerVC.frame.size.height + topStateNavHeight, kDeviceWidth, kDeviceHeight - topStateNavHeight - weakSelf.headerVC.frame.size.height);
                weakSelf.typeBtn.frame = CGRectMake(kDeviceWidth - 30, weakSelf.headerVC.frame.size.height + topStateNavHeight, 25, 25);
            }];
        }
    };
    
    _headerVC.calendarHeightChangedBlock = ^(CGFloat height) {
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.headerVC.frame = CGRectMake(0, topStateNavHeight, kDeviceWidth, 55 + height);
            weakSelf.tableVC.frame = CGRectMake(0, weakSelf.headerVC.frame.size.height + topStateNavHeight, kDeviceWidth, kDeviceHeight - topStateNavHeight - weakSelf.headerVC.frame.size.height);
            weakSelf.typeBtn.frame = CGRectMake(kDeviceWidth - 30, weakSelf.headerVC.frame.size.height + topStateNavHeight, 25, 25);
        }];
    };
    
}

-(void)typeBtnHandel:(UIButton*)sender{
    sender.selected = !sender.selected;
    calendarType = !calendarType;
    [_headerVC changeCalendarType:calendarType];
}

-(YCBonusCalendarHeaderView *)headerVC{
    if (!_headerVC) {
        _headerVC = [[YCBonusCalendarHeaderView alloc]initWithFrame:CGRectMake(0, topStateNavHeight, kDeviceWidth, 55)];
    }
    return _headerVC;
}

-(UITableView *)tableVC{
    if (!_tableVC) {
        _tableVC = [[UITableView alloc]initWithFrame:CGRectMake(0, _headerVC.frame.size.height + topStateNavHeight, kDeviceWidth, kDeviceHeight - topStateNavHeight - _headerVC.frame.size.height) style:UITableViewStyleGrouped];
        _tableVC.delegate = self;
        _tableVC.dataSource = self;
        _tableVC.backgroundColor = RGBACOLOR(242, 244, 246, 1);
        _tableVC.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _tableVC.estimatedRowHeight = 0;
            _tableVC.estimatedSectionFooterHeight = 0;
            _tableVC.estimatedSectionHeaderHeight = 0;
            _tableVC.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [_tableVC registerClass:[YCBonusCalendarTableViewCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return _tableVC;
}

-(UIButton *)typeBtn{
    if (!_typeBtn) {
        _typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _typeBtn.frame = CGRectMake(kDeviceWidth - 30, _headerVC.frame.size.height + topStateNavHeight, 25, 25);
        _typeBtn.alpha = 0;
        [_typeBtn setImage:[UIImage imageNamed:@"yc_bonus_type"] forState:UIControlStateNormal];
        _typeBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_typeBtn addTarget:self action:@selector(typeBtnHandel:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _typeBtn;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = [NSArray arrayWithArray:_dataArr[section]];
    return arr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = [NSArray arrayWithArray:_dataArr[indexPath.section]];
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:arr[indexPath.row]];
    NSArray *con = [NSArray arrayWithArray:[dic objectForKey:@"content"]];
    CGFloat d = (22+12)*con.count;
    if (indexPath.row == arr.count - 1) {
        return d + 94;
    }else{
        return d + 94 + 10;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 57;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == _dataArr.count - 1) {
        return 20;
    }
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vc = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 57)];
    vc.backgroundColor = RGBACOLOR(242, 244, 246, 1);
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, kDeviceWidth-40, 57)];
    title.text = @"2018年9月12 星期五";
    title.textColor = RGBACOLOR(180, 180, 180, 1);
    title.font = yc_Font_PFMedium(17);
    [vc addSubview:title];
    
    return vc;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YCBonusCalendarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[YCBonusCalendarTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.dataDic = _dataArr[indexPath.section][indexPath.row];
    return cell;
}


@end
