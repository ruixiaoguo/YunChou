//
//  payHeadView.swift
//  YunChou
//
//  Created by grx on 2018/10/17.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class PayHeadView: UIView {

    let payMoneyBgView = UIView()
    let payMoneyLable = UILabel()

    let selectDianZView = PaySelectView()
    let selectAliPayZView = PaySelectView()
    let selectWeChatZView = PaySelectView()

    var selectPayCallBlock:((_ style:Int)-> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    func initUi() {
        //应付金额
        self.addSubview(payMoneyBgView)
        payMoneyBgView.backgroundColor = YCColorWhite
        payMoneyBgView.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(55)
        })
        let payMoneyTitleLable = UILabel()
        payMoneyTitleLable.text = "应付金额"
        payMoneyTitleLable.textColor = YCColorTitleBlack
        payMoneyTitleLable.font = YC_FONT_PFSC_Medium(14)
        payMoneyBgView.addSubview(payMoneyTitleLable)
        payMoneyTitleLable.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(15)
            make.height.equalTo(55)
        })
        payMoneyLable.text = "¥300.00"
        payMoneyLable.textColor = YCColorBlack
        payMoneyLable.textAlignment = NSTextAlignment.right
        payMoneyLable.font = YC_FONT_PFSC_Medium(14)
        payMoneyBgView.addSubview(payMoneyLable)
        payMoneyLable.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.right.equalTo(-15)
            make.height.equalTo(55)
        })
        //电子钱包
        self.addSubview(selectDianZView)
        selectDianZView.paySelTitleView.text = "电子钱包"
        selectDianZView.paySelImageView.image = UIImage(named: "Diazi")
        selectDianZView.tag = 10
        selectDianZView.paySelButton.isSelected = true
        selectDianZView.snp.makeConstraints({ (make) in
            make.top.equalTo(payMoneyBgView.snp.bottom).offset(10)
            make.left.right.equalTo(0)
            make.height.equalTo(52)
        })
        selectDianZView.paySelButton.isUserInteractionEnabled = false
        selectDianZView.addTarget(self, action: #selector(selectDianZClick(_ :)), for: .touchUpInside)
        
        //其他支付方式
        let ortherPayTitleLable = UILabel()
        ortherPayTitleLable.text = "其他支付方式"
        ortherPayTitleLable.textColor = YCColorLightBlack
        ortherPayTitleLable.font = YC_FONT_PFSC_Medium(14)
        self.addSubview(ortherPayTitleLable)
        ortherPayTitleLable.snp.makeConstraints({ (make) in
            make.top.equalTo(selectDianZView.snp.bottom).offset(0)
            make.left.equalTo(15)
            make.height.equalTo(52)
        })
        //支付宝
        self.addSubview(selectAliPayZView)
        selectAliPayZView.paySelTitleView.text = "支付宝支付"
        selectAliPayZView.paySelImageView.image = UIImage(named: "ZhiFB")
        selectAliPayZView.tag = 11
        selectAliPayZView.paySelButton.isUserInteractionEnabled = false
        selectAliPayZView.snp.makeConstraints({ (make) in
            make.top.equalTo(ortherPayTitleLable.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.height.equalTo(52)
        })
        selectAliPayZView.addTarget(self, action: #selector(selectDianZClick(_ :)), for: .touchUpInside)
        
        //微信
        self.addSubview(selectWeChatZView)
        selectWeChatZView.paySelTitleView.text = "微信支付"
        selectWeChatZView.paySelImageView.image = UIImage(named: "WeChat")
        selectWeChatZView.tag = 12
        selectWeChatZView.paySelButton.isUserInteractionEnabled = false
        selectWeChatZView.snp.makeConstraints({ (make) in
            make.top.equalTo(selectAliPayZView.snp.bottom).offset(1)
            make.left.right.equalTo(0)
            make.height.equalTo(52)
        })
        selectWeChatZView.addTarget(self, action: #selector(selectDianZClick(_ :)), for: .touchUpInside)
    }
    
    //MARK:========选择支付方式
    @objc func selectDianZClick(_ button:UIButton){
        selectDianZView.paySelButton.isSelected = false
        selectAliPayZView.paySelButton.isSelected = false
        selectWeChatZView.paySelButton.isSelected = false
        if button.tag==10 {
            selectDianZView.paySelButton.isSelected = true
            selectPayCallBlock!(0)
        }else if button.tag==11{
            selectAliPayZView.paySelButton.isSelected = true
            selectPayCallBlock!(1)
        }else if button.tag==12{
            selectWeChatZView.paySelButton.isSelected = true
            selectPayCallBlock!(2)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class PayBottomView: UIView {
    
    let realMoney = UILabel()
    let payButton = UIButton()
    var PayCallBlock:(()-> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        let realMoneyTitle = UILabel()
        realMoneyTitle.text = "实付金额："
        realMoneyTitle.textColor = YCColorBlack
        realMoneyTitle.font = YC_FONT_PFSC_Semibold(15)
        self.addSubview(realMoneyTitle)
        realMoneyTitle.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(15)
            make.height.equalTo(49)
        })
        self.addSubview(realMoney)
        realMoney.text = "¥300.00"
        realMoney.textColor = gof_ColorWithHex(0xDD1111)
        realMoney.font = YC_FONT_PFSC_Semibold(15)
        self.addSubview(realMoney)
        realMoney.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(realMoneyTitle.snp.right).offset(0)
            make.height.equalTo(49)
        })
        
        self.addSubview(payButton)
        payButton.setTitle("支付", for: .normal)
        payButton.setTitleColor(YCColorWhite, for: .normal)
        payButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(payButton)
        payButton.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(0)
            make.width.equalTo(131)
            make.height.equalTo(49)
        }
        payButton.addTarget(self, action:#selector(payButtonClick(_:)), for:.touchUpInside)
        payButton.setColors(superView: payButton)
    }
    
    @objc func payButtonClick(_ button:UIButton){
        PayCallBlock!()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
