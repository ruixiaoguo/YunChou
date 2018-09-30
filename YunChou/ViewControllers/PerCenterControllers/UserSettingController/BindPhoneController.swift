//
//  BindPhoneController.swift
//  YunChou
//
//  Created by grx on 2018/9/30.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class BindPhoneController: BaseController {
    let bgView = UIView()
    let smsTextFeild = UITextField()
    let smsView = SMSCodeView()
    let newPhoneTextFeild = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "更换手机号"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.view.addSubview(bgView)
        bgView.backgroundColor = YCColorWhite
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(NaviBarHeight+10)
            make.left.right.equalTo(0)
            make.height.equalTo(52*3)
        }
        self.creatUI()
    }
    
    func creatUI() {
        
        //:MARK==============当前手机
        let phoneTitle = UILabel()
        phoneTitle.text = "当前手机号"
        phoneTitle.font = YC_FONT_PFSC_Medium(14)
        phoneTitle.textColor = YCColorTitleBlack
        bgView.addSubview(phoneTitle)
        phoneTitle.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(20)
            make.height.equalTo(52)
        }
        let phoneLable = UILabel()
        phoneLable.text = "15810662320"
        phoneLable.font = YC_FONT_PFSC_Medium(14)
        phoneLable.textColor = YCColorTitleBlack
        phoneLable.textAlignment = NSTextAlignment.right
        bgView.addSubview(phoneLable)
        phoneLable.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(-20)
            make.height.equalTo(52)
        }
        for i in 0..<2 {
            let lineView = UIView()
            lineView.backgroundColor = YCColorLight
            bgView.addSubview(lineView)
            lineView.snp.makeConstraints({ (make) in
                make.left.equalTo(0)
                make.right.equalTo(0)
                make.top.equalTo(52+i*52)
                make.height.equalTo(1)
            })
        }
        
        //:MARK==============短信验证码
        smsTextFeild.placeholder = "短信验证码"
        smsTextFeild.font = YC_FONT_PFSC_Medium(14)
        smsTextFeild.textColor = YCColorTitleBlack
        smsTextFeild.clearButtonMode = .never
        smsTextFeild.setModifyClearButton()
        bgView.addSubview(smsTextFeild)
        smsTextFeild.snp.makeConstraints { (make) in
            make.top.equalTo(phoneLable.snp.bottom).offset(0)
            make.left.equalTo(20)
            make.right.equalTo(-130)
            make.height.equalTo(52)
        }
        let lineView = UIView()
        bgView.addSubview(lineView)
        lineView.backgroundColor = YCColorLoginLine
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(60)
            make.right.equalTo(-115)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        bgView.addSubview(smsView)
        smsView.backgroundColor = YCColorWhite
        smsView.smsButton.setTitleColor(YCColorBlue, for: .normal)
        smsView.snp.makeConstraints { (make) in
            make.top.equalTo(62)
            make.left.equalTo(lineView.snp.right).offset(0)
            make.right.equalTo(0)
            make.height.equalTo(40)
        }
        smsView.sendCodeBlock = {() in
            //验证码倒计时
            self.smsView.countDown(timeOut: 60)
        }
        //:MARK==============新手机号
        let newPhoneTitle = UILabel()
        newPhoneTitle.text = "新手机号"
        newPhoneTitle.font = YC_FONT_PFSC_Medium(14)
        newPhoneTitle.textColor = YCColorTitleBlack
        bgView.addSubview(newPhoneTitle)
        newPhoneTitle.snp.makeConstraints { (make) in
            make.top.equalTo(smsTextFeild.snp.bottom).offset(0)
            make.left.equalTo(20)
            make.height.equalTo(52)
        }
        newPhoneTextFeild.placeholder = "请输入新手机号"
        newPhoneTextFeild.font = YC_FONT_PFSC_Medium(14)
        newPhoneTextFeild.textColor = YCColorTitleBlack
        newPhoneTextFeild.clearButtonMode = .never
        newPhoneTextFeild.setModifyClearButton()
        bgView.addSubview(newPhoneTextFeild)
        newPhoneTextFeild.snp.makeConstraints { (make) in
            make.top.equalTo(smsTextFeild.snp.bottom).offset(0)
            make.left.equalTo(newPhoneTitle.snp.right).offset(15)
            make.right.equalTo(-20)
            make.height.equalTo(52)
        }
        self.initOverButton()
    }
    
    
    //更换手机号按钮
    func initOverButton() {
        let footView = MyFootButtonView()
        self.view.addSubview(footView)
        footView.backgroundColor = YCColorLight
        footView.sureOverBtn.setTitle("确定", for: .normal)
        footView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-(SafeBottomMargin+15))
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(60)
        }
        footView.sureOverBtn.snp.updateConstraints { (make) in
            make.height.equalTo(45)
        }
        footView.sureOverBtn.layer.cornerRadius = 45/2
        footView.sureOvercallBlock = {[unowned self]() in
            
        }
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
}
