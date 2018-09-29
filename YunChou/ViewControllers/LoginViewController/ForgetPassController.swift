//
//  ForgetPassController.swift
//  YunChou
//
//  Created by grx on 2018/9/28.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class ForgetPassController: BaseController {
    let bgView = UIView()
    let smsLoginView = UIView()
    let smsView = SMSCodeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "忘记密码"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.creaUI()
        self.creatSmsViewUI()
        self.creatPassWordUI()
    }
    
    //MARK:==========创建视图
    func creaUI(){
        bgView.backgroundColor = YCColorWhite
        self.view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(NaviBarHeight+15)
            make.left.equalTo(0)
            make.right.equalTo(-0)
            make.height.equalTo(120)
        }
        let imageArray:Array = ["login_phone","login_sms"]
        //MARK:=======图片
        for i in 0..<imageArray.count {
            let headImage = UIImageView()
            headImage.image = UIImage(named: imageArray[i])
            bgView.addSubview(headImage)
            headImage.tag = i+100
            headImage.snp.makeConstraints { (make) in
                make.top.equalTo(20+i*55)
                make.left.equalTo(30)
                make.width.equalTo(20)
                make.height.equalTo(25)
            }
        }
        let lineView = UIView()
        bgView.addSubview(lineView)
        lineView.backgroundColor = YCColorLoginLine
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(60)
            make.left.equalTo(75)
            make.right.equalTo(0)
            make.height.equalTo(1)
        }
    }
    //MARK==========短信验证码登录
    func creatSmsViewUI() {
        bgView.addSubview(smsLoginView)
        smsLoginView.isHidden = false
        smsLoginView.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(75)
            make.right.equalTo(0)
            make.height.equalTo(120)
        }
        
        let titleArray:Array = ["手机号","请输入验证码"]
        for i in 0..<titleArray.count {
            let textField = UITextField()
            smsLoginView.addSubview(textField)
            textField.placeholder = titleArray[i]
            textField.font = YC_FONT_PFSC_Medium(14)
            textField.textColor = YCColorBlack
            textField.clearButtonMode = .whileEditing
            textField.tag = i+10
            textField.snp.makeConstraints { (make) in
                make.top.equalTo(i*55)
                make.left.equalTo(0)
                make.right.equalTo(-15)
                make.height.equalTo(40)
            }
            if(textField.tag==11){
                textField.snp.updateConstraints { (make) in
                    make.right.equalTo(-120)
                }
            }
        }
        let lineView = UIView()
        smsLoginView.addSubview(lineView)
        lineView.backgroundColor = YCColorLoginLine
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(63)
            make.right.equalTo(-115)
            make.width.equalTo(1)
            make.height.equalTo(30)
        }
        smsLoginView.addSubview(smsView)
        smsView.backgroundColor = YCColorWhite
        smsView.snp.makeConstraints { (make) in
            make.top.equalTo(55)
            make.left.equalTo(lineView.snp.right).offset(0)
            make.right.equalTo(0)
            make.height.equalTo(40)
        }
        smsView.sendCodeBlock = {() in
            //验证码倒计时
            self.smsView.countDown(timeOut: 60)
        }
    }
    
    func creatPassWordUI() {
        let setPassLable = UILabel()
        setPassLable.text = "请设置登录密码"
        setPassLable.font = YC_FONT_PFSC_Medium(14)
        setPassLable.textColor = YCColorLightBlack
        self.view.addSubview(setPassLable)
        setPassLable.snp.makeConstraints { (make) in
            make.left.right.equalTo(15)
            make.top.equalTo(bgView.snp.bottom).offset(13)
        }
        let PassBgView = UIView()
        PassBgView.backgroundColor = YCColorWhite
        self.view.addSubview(PassBgView)
        PassBgView.snp.makeConstraints { (make) in
            make.top.equalTo(setPassLable.snp.bottom).offset(13)
            make.left.right.equalTo(0)
            make.height.equalTo(53)
        }
        let passImage = UIImageView()
        passImage.image = UIImage(named: "login_pass")
        PassBgView.addSubview(passImage)
        passImage.snp.makeConstraints { (make) in
            make.top.equalTo(16)
            make.left.equalTo(30)
            make.width.equalTo(16)
            make.height.equalTo(20)
        }
        let passField = UITextField()
        PassBgView.addSubview(passField)
        passField.placeholder = "输入新密码"
        passField.font = YC_FONT_PFSC_Medium(14)
        passField.textColor = YCColorBlack
        passField.clearButtonMode = .whileEditing
        passField.snp.makeConstraints { (make) in
            make.top.equalTo(1)
            make.left.equalTo(passImage.snp.right).offset(17)
            make.right.equalTo(-15)
            make.height.equalTo(53)
        }
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }

}
