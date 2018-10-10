//
//  persionAccountView.swift
//  YunChou
//
//  Created by grx on 2018/9/25.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class persionAccountView: UIView {

    var checkAccountMoneyBlock:((_ money:String)->Void)?
    var checkJFBlock:((_ jf:String)->Void)?
    var checkCouponBlock:((_ coupon:String)->Void)?

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
        let bgViewImage = UIImageView()
        bgViewImage.image = UIImage(named: "Rectangle")
        bgViewImage.layer.cornerRadius = 5
        bgViewImage.layer.masksToBounds = true
        bgViewImage.isUserInteractionEnabled = true
        self.addSubview(bgViewImage)
        bgViewImage.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        })
        //添加手势
        let geust = UITapGestureRecognizer(target: self, action: #selector(checkAccountMoney))
        bgViewImage.addGestureRecognizer(geust)
        
        self.layer.cornerRadius = 5
        //账户标题
        titleLable.text = "账户余额"
        titleLable.font = YC_FONT_PFSC_Medium(14)
        titleLable.textColor = gof_ColorWithHex(0xB9DAFF)
        bgViewImage.addSubview(titleLable)
        titleLable.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.left.equalTo(15)
            make.height.equalTo(40)
        })
        //查看按钮
        bgViewImage.addSubview(seeButton)
        seeButton .setImage(UIImage(named:"see"), for: .normal)
        seeButton.snp.makeConstraints({ (make) in
            make.top.equalTo(22)
            make.left.equalTo(titleLable.snp.right).offset(8)
            make.width.equalTo(15)
            make.height.equalTo(15)
        })
        //账户金额
        moneyLable.text = "22341.67"
        moneyLable.font = YC_FONT_PFSC_Semibold(28)
        moneyLable.textColor = gof_ColorWithHex(0xFFFFFF)
        bgViewImage.addSubview(moneyLable)
        moneyLable.snp.makeConstraints({ (make) in
            make.top.equalTo(titleLable.snp.bottom).offset(-5)
            make.left.equalTo(15)
            make.height.equalTo(40)
        })
        //积分标题
        JfTitleLable.text = "我的积分："
        JfTitleLable.font = YC_FONT_PFSC_Medium(14)
        JfTitleLable.textColor = gof_ColorWithHex(0xB9DAFF)
        bgViewImage.addSubview(JfTitleLable)
        JfTitleLable.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyLable.snp.bottom).offset(-5)
            make.left.equalTo(15)
            make.height.equalTo(40)
        })
        //积分
        JfLable.text = "100"
        JfLable.font = YC_FONT_PFSC_Medium(14)
        JfLable.textColor = gof_ColorWithHex(0xB9DAFF)
        bgViewImage.addSubview(JfLable)
        JfLable.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyLable.snp.bottom).offset(-5)
            make.left.equalTo(JfTitleLable.snp.right).offset(0)
            make.height.equalTo(40)
        })
        
        //代金券标题
        CouponTitleLable.text = "代金券："
        CouponTitleLable.font = YC_FONT_PFSC_Medium(14)
        CouponTitleLable.textColor = gof_ColorWithHex(0xB9DAFF)
        bgViewImage.addSubview(CouponTitleLable)
        CouponTitleLable.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyLable.snp.bottom).offset(-5)
            make.left.equalTo(JfLable.snp.right).offset(22)
            make.height.equalTo(40)
        })
        //代金券
        CouponLable.text = "10"
        CouponLable.font = YC_FONT_PFSC_Medium(14)
        CouponLable.textColor = gof_ColorWithHex(0xB9DAFF)
        bgViewImage.addSubview(CouponLable)
        CouponLable.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyLable.snp.bottom).offset(-5)
            make.left.equalTo(CouponTitleLable.snp.right).offset(0)
            make.height.equalTo(40)
        })
        //绑定积分
        bgViewImage.addSubview(bangdiButton)
        bangdiButton .setImage(UIImage(named:"bang"), for: .normal)
        bangdiButton.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(0)
            make.width.equalTo(120)
            make.height.equalTo(40)
        })
        //查看我的积分
        let checkJfBtn = UIButton()
        self.addSubview(checkJfBtn)
        checkJfBtn.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyLable.snp.bottom).offset(-5)
            make.left.equalTo(15)
            make.right.equalTo(CouponTitleLable.snp.left).offset(-0)
            make.height.equalTo(40)
        })
        checkJfBtn.addTarget(self, action: #selector(checkJfBtnClick), for: .touchUpInside)
        //查看我的代金券
        let checkCouponBtn = UIButton()
        self.addSubview(checkCouponBtn)
        checkCouponBtn.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyLable.snp.bottom).offset(-5)
            make.left.equalTo(checkJfBtn.snp.right).offset(0)
            make.width.equalTo(100)
            make.height.equalTo(40)
        })
        checkCouponBtn.addTarget(self, action: #selector(checkCouponBtnClick), for: .touchUpInside)
    }
    
    //MARK:==========查看账户余额
    @objc func checkAccountMoney(sender:UITapGestureRecognizer) {
        checkAccountMoneyBlock!(moneyLable.text!)
    }
    
    //MARK:==========查看我的积分
    @objc func checkJfBtnClick(sender:UITapGestureRecognizer) {
        checkJFBlock!(JfLable.text!)
    }
    
    //MARK:==========查看代金券
    @objc func checkCouponBtnClick(sender:UITapGestureRecognizer) {
        checkCouponBlock!(CouponLable.text!)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
