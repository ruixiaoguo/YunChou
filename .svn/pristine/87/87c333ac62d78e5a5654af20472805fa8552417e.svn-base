//
//  WaitOrderInfoView.swift
//  YunChou
//
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class WaitOrderInfoView: UIView {

    let orderImage = UIImageView()
    let orderName = UILabel()
    let stockCaseLable = UILabel()
    let payMoneyLable = UILabel()
    let subNumLable = UILabel()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUi() {
        //订单图片
        orderImage.layer.cornerRadius = 5
        orderImage.layer.masksToBounds = true
        orderImage.image = UIImage(named: "bgImage")
        self.addSubview(orderImage)
        orderImage.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        //名称
        orderName.font = YC_FONT_PFSC_Regular(14)
        orderName.textColor = YCColorBlack
        orderName.numberOfLines = 0
        orderName.text = "丽朗酒店-黄山丽朗度假村丽朗酒店-黄山丽朗度假村"
        self.addSubview(orderName)
        orderName.snp.makeConstraints({ (make) in
            make.top.equalTo(orderImage)
            make.left.equalTo(orderImage.snp.right).offset(15)
            make.right.equalTo(-32)
        })
        //股权方案
        stockCaseLable.text = "股权方案1"
        stockCaseLable.font = YC_FONT_PFSC_Regular(14)
        stockCaseLable.textColor = YCColorStanBlue
        self.addSubview(stockCaseLable)
        stockCaseLable.snp.makeConstraints({ (make) in
            make.left.equalTo(orderImage.snp.right).offset(15)
            make.top.equalTo(orderName.snp.bottom).offset(kWidth(R: 10))
        })
        //实付款
        payMoneyLable.text = "￥600.98"
        payMoneyLable.font = YC_FONT_PFSC_Medium(16)
        payMoneyLable.textColor = YCColorRed
        self.addSubview(payMoneyLable)
        payMoneyLable.snp.makeConstraints({ (make) in
            make.right.equalTo(-15)
            make.top.equalTo(stockCaseLable.snp.bottom).offset(kWidth(R: 7))
        })
        let payLable = UILabel()
        payLable.text = "实付款："
        payLable.font = YC_FONT_PFSC_Regular(12)
        payLable.textColor = YCColorBlack
        self.addSubview(payLable)
        payLable.snp.makeConstraints({ (make) in
            make.right.equalTo(payMoneyLable.snp.left).offset(-2)
            make.top.equalTo(stockCaseLable.snp.bottom).offset(kWidth(R: 10))
        })
        //预约数量
        subNumLable.text = "预约：5份"
        subNumLable.font = YC_FONT_PFSC_Regular(12)
        subNumLable.textColor = YCColorBlack
        self.addSubview(subNumLable)
        subNumLable.snp.makeConstraints({ (make) in
            make.right.equalTo(payLable.snp.left).offset(-10)
            make.top.equalTo(stockCaseLable.snp.bottom).offset(kWidth(R: 10))
        })
    }

}
