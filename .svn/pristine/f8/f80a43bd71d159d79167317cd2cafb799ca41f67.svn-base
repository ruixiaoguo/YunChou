
//
//  YCBonusCalendarTableViewCell.m
//  YunChou
//
//  Created by yy on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

#import "YCBonusCalendarTableViewCell.h"
#import "YCCalendarSupport.h"

@interface YCBonusCalendarTableViewCell()

@property (nonatomic , strong)UIView *backVC;
@property (nonatomic , strong)UILabel *poinLB;
@property (nonatomic , strong)UILabel *titleLB;
@property (nonatomic , strong)UIView *moneyBC;
@property (nonatomic , strong)UILabel *linlb;
@property (nonatomic , strong)UILabel *moneyLB;


@end



@implementation YCBonusCalendarTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RGBACOLOR(242, 244, 246, 2);
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews{
    [self addSubview:self.backVC];
    [_backVC addSubview:self.poinLB];
    [_backVC addSubview:self.titleLB];
    [_backVC addSubview:self.moneyBC];
    [_backVC addSubview:self.linlb];
    [_backVC addSubview:self.moneyLB];
}

-(void)setDataDic:(NSDictionary *)dataDic{
    _titleLB.text = [NSString stringWithFormat:@"%@",[dataDic objectForKey:@"title"]];
    
    NSArray *arr = [NSArray arrayWithArray:dataDic[@"content"]];
    _backVC.frame = CGRectMake(12, 0, kDeviceWidth-24, 94+(22+12)*arr.count);
    _moneyBC.frame = CGRectMake(0, CGRectGetMaxY(_titleLB.frame) + 12, kDeviceWidth, (22+12)*arr.count);
    
    
    //    _moneyBC.backgroundColor = [UIColor yellowColor];
    for (UIView *subView in _moneyBC.subviews) {
        //避免重用
        [subView removeFromSuperview];
    }
    
    for (int i = 0; i<arr.count; i++) {
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:arr[i]];
        UILabel *tit = [[UILabel alloc]initWithFrame:CGRectMake(30,  (22+12)*i, 120, 22)];
        tit.font = yc_Font_PFMedium(15);
        tit.textColor = RGBACOLOR(116, 116, 116, 1);
        tit.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"num"]];
        [_moneyBC addSubview:tit];
        
        UILabel *mon = [[UILabel alloc]initWithFrame:CGRectMake(kDeviceWidth/2 - 40, (22+12)*i, kDeviceWidth/2, 22)];
        mon.font = yc_Font_PFMedium(15);
        mon.textColor = RGBACOLOR(116, 116, 116, 1);
        mon.text = [NSString stringWithFormat:@"分红：%@",[dic objectForKey:@"money"]];
        mon.textAlignment = NSTextAlignmentRight;
        [_moneyBC addSubview:mon];
        
    }
    
    _linlb.frame =  CGRectMake(30, CGRectGetMaxY(_moneyBC.frame) + 3, kDeviceWidth - 30, 1);
    _moneyLB.frame = CGRectMake(0, CGRectGetMaxY(_linlb.frame)  , kDeviceWidth - 40, 44);
    _moneyLB.text = @"分红合计：￥700:99";
    _moneyLB.textAlignment = NSTextAlignmentRight;
    
}


-(UIView *)backVC{
    if (!_backVC) {
        _backVC = [[UIView alloc]initWithFrame:CGRectMake(12, 0, kDeviceWidth-24, 94 + 34)];
        _backVC.backgroundColor = [UIColor whiteColor];
        _backVC.layer.cornerRadius = 6;
        _backVC.layer.masksToBounds = YES;
    }
    return _backVC;
}

-(UILabel *)poinLB{
    if (!_poinLB) {
        _poinLB = [[UILabel alloc]initWithFrame:CGRectMake(15, 22, 7, 7)];
        _poinLB.backgroundColor = [UIColor purpleColor];
        _poinLB.layer.cornerRadius = 7/2;
        _poinLB.layer.masksToBounds = YES;
    }
    return _poinLB;
}

-(UILabel *)titleLB{
    if (!_titleLB) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectMake(32, 15, kDeviceWidth - 32, 22)];
        _titleLB.font = yc_Font_PFMedium(15);
        _titleLB.textColor = RGBACOLOR(45, 45, 45, 1);
    }
    return _titleLB;
}

-(UIView *)moneyBC{
    if (!_moneyBC) {
        _moneyBC = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLB.frame) + 12, kDeviceWidth, 22)];
        _moneyBC.backgroundColor = [UIColor whiteColor];
    }
    return _moneyBC;
}

-(UILabel *)linlb{
    if (!_linlb) {
        _linlb = [[UILabel alloc]initWithFrame:CGRectMake(30, self.frame.size.height - 45, kDeviceWidth - 30, 1)];
        _linlb.backgroundColor = RGBACOLOR(240 , 240, 240, 1);
        //        _linlb.backgroundColor = [UIColor redColor];
    }
    return _linlb;
}

-(UILabel *)moneyLB{
    if (!_moneyLB) {
        _moneyLB = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 44  , kDeviceWidth - 30, 44)];
        _moneyLB.font = yc_Font_PFMedium(15);
        _moneyLB.textColor = RGBACOLOR(45, 45, 45, 1);
    }
    return _moneyLB;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
