//
//  persionAccountView.swift
//  YunChou
//
//  Created by grx on 2018/9/25.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class persionAccountView: UIView {

    let titleLable = UILabel() //账户余额
    let seeButton = UIButton() //查看按钮
    let moneyLable = UILabel() //账户金额
    let JfTitleLable = UILabel() //积分标题
    let JfLable = UILabel()      //我的积分
    let CouponTitleLable = UILabel() //代金券标题
    let CouponLable = UILabel()      //我的代金券
    let bangdiButton = UIButton()      //绑定积分

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUi()
    }
    
    func initUi() {
        self.setColors(superView: self)
        self.layer.cornerRadius = 5
        self.setShadow()
        //账户标题
        titleLable.text = "账户余额"
        titleLable.font = UIFont.systemFont(ofSize: 15)
        titleLable.textColor = YCColorWhite
        titleLable.alpha = 0.8
        self.addSubview(titleLable)
        titleLable.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.left.equalTo(15)
            make.height.equalTo(40)
        })
        //查看按钮
        self.addSubview(seeButton)
        seeButton .setImage(UIImage(named:"see"), for: .normal)
        seeButton.snp.makeConstraints({ (make) in
            make.top.equalTo(22)
            make.left.equalTo(titleLable.snp.right).offset(8)
            make.width.equalTo(30)
            make.height.equalTo(15)
        })
        //账户金额
        moneyLable.text = "22341.67"
        moneyLable.font = UIFont.systemFont(ofSize: 28)
        moneyLable.textColor = YCColorWhite
        self.addSubview(moneyLable)
        moneyLable.snp.makeConstraints({ (make) in
            make.top.equalTo(titleLable.snp.bottom).offset(-5)
            make.left.equalTo(15)
            make.height.equalTo(40)
        })
        //积分标题
        JfTitleLable.text = "我的积分："
        JfTitleLable.font = UIFont.systemFont(ofSize: 15)
        JfTitleLable.textColor = YCColorWhite
        JfTitleLable.alpha = 0.8
        self.addSubview(JfTitleLable)
        JfTitleLable.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyLable.snp.bottom).offset(-5)
            make.left.equalTo(15)
            make.height.equalTo(40)
        })
        //积分标题
        JfLable.text = "100"
        JfLable.font = UIFont.systemFont(ofSize: 15)
        JfLable.textColor = YCColorWhite
        JfLable.alpha = 0.8
        self.addSubview(JfLable)
        JfLable.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyLable.snp.bottom).offset(-5)
            make.left.equalTo(JfTitleLable.snp.right).offset(0)
            make.height.equalTo(40)
        })
        //代金券标题
        CouponTitleLable.text = "代金券："
        CouponTitleLable.font = UIFont.systemFont(ofSize: 15)
        CouponTitleLable.textColor = YCColorWhite
        CouponTitleLable.alpha = 0.8
        self.addSubview(CouponTitleLable)
        CouponTitleLable.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyLable.snp.bottom).offset(-5)
            make.left.equalTo(JfLable.snp.right).offset(22)
            make.height.equalTo(40)
        })
        //代金券
        CouponLable.text = "10"
        CouponLable.font = UIFont.systemFont(ofSize: 16)
        CouponLable.textColor = YCColorWhite
        CouponLable.alpha = 0.8
        self.addSubview(CouponLable)
        CouponLable.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyLable.snp.bottom).offset(-5)
            make.left.equalTo(CouponTitleLable.snp.right).offset(0)
            make.height.equalTo(40)
        })
        //绑定积分
        self.addSubview(bangdiButton)
        bangdiButton .setImage(UIImage(named:"bang"), for: .normal)
        bangdiButton.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(0)
            make.width.equalTo(120)
            make.height.equalTo(40)
        })
    }
    
    //MARK:======设置阴影
    func setShadow() {
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        //中阴影
        self.layer.shadowColor = YCColorBlack.cgColor
        self.layer.shadowOpacity = 0.5
        //不透明度
        self.layer.shadowRadius = 5.0
        //设置阴影所照射的范围
        self.layer.shadowOffset = CGSize.init(width: 0, height: 3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
