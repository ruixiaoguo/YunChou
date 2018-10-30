//
//  SubPayInfoView.swift
//  YunChou
//
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class SubPayInfoView: UIView {

    let subMoney = UILabel()//预约金额
    let shouldPayMoney = UILabel()//应支付定金
    let orderTimeLable = UILabel()//下单时间
    var surTimeLable = GGClockView()//剩余时间
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUi() {
        let titleArray:Array = ["预约金额：","应支付定金：","下单时间：","支付剩余时间："]
        for i in 0..<titleArray.count {
            let titleLable = UILabel()
            self.addSubview(titleLable)
            titleLable.text = titleArray[i]
            titleLable.font = YC_FONT_PFSC_Medium(14)
            titleLable.textColor = YCColorTitleBlack
            titleLable.snp.makeConstraints { (make) in
                make.left.equalTo(15)
                make.top.equalTo(12+i*33)
                make.width.equalTo(100)
            }
        }
        //内容
        self.addSubview(subMoney)
        subMoney.text = "20000.00元"
        subMoney.font = YC_FONT_PFSC_Medium(14)
        subMoney.textColor = YCColorTitleBlack
        subMoney.snp.makeConstraints { (make) in
            make.left.equalTo(130)
            make.top.equalTo(12)
            make.right.equalTo(-15)
        }
        self.addSubview(shouldPayMoney)
        shouldPayMoney.text = "300.00元"
        shouldPayMoney.font = YC_FONT_PFSC_Medium(14)
        shouldPayMoney.textColor = YCColorTitleBlack
        shouldPayMoney.snp.makeConstraints { (make) in
            make.left.equalTo(130)
            make.top.equalTo(12+33)
            make.right.equalTo(-15)
        }
        self.addSubview(orderTimeLable)
        orderTimeLable.text = "2018-08-12 11:23:56"
        orderTimeLable.font = YC_FONT_PFSC_Medium(14)
        orderTimeLable.textColor = YCColorTitleBlack
        orderTimeLable.snp.makeConstraints { (make) in
            make.left.equalTo(130)
            make.top.equalTo(12+33*2)
            make.right.equalTo(-15)
        }
        //倒计时
        surTimeLable = GGClockView.init(timeBackgroundColor: YCColorWhite, timeTextColor: YCColorTitleBlack, colonColor: YCColorTitleBlack, font: YC_FONT_PFSC_Medium(15))
        surTimeLable.contentMode = GGClockViewContentMode.left;
        self.addSubview(surTimeLable)
        surTimeLable.snp.makeConstraints({ (make) in
            make.left.equalTo(130)
            make.top.equalTo(12+33*3)
            make.width.equalTo(60)
            make.height.equalTo(18)
        })
        surTimeLable.time = 1000;
        surTimeLable.start()
    }
    
}