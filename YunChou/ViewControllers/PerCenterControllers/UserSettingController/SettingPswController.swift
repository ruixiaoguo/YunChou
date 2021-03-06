//
//  SettingPswController.swift
//  YunChou
//
//  Created by grx on 2018/10/8.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import SwiftProgressHUD

class SettingPswController: BaseController {
    
    let modifyPassView = UIView()
    let setPassView = UIView()
    let line = UIView()
    let nowPhone = UILabel()
    let nowSnSPhone = UITextField()
    let smsView = SMSCodeView()
    var saveSuccessBlock:(()->Void)?
    var isPwd = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "设置密码"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.initModifyPassView()
        self.initSetPassView()
        self.initSubButton()
    }
    
    func initModifyPassView()  {
        self.view.addSubview(modifyPassView)
        modifyPassView.backgroundColor = YCColorWhite
        modifyPassView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(NaviBarHeight)
            make.height.equalTo(100)
        }
        //判断修改密码/设置密码
        if(isPwd=="0"){
            modifyPassView.isHidden = true
            modifyPassView.snp.updateConstraints { (make) in
                make.height.equalTo(0)
                }
        }
        
        let headImage = UIImageView()
        headImage.image = UIImage(named: "set_phone")
        modifyPassView.addSubview(headImage)
        headImage.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(30)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        //标题
        let titleLable = UILabel()
        modifyPassView.addSubview(titleLable)
        titleLable.text = "当前电话"
        titleLable.textColor = YCColorTitleBlack
        titleLable.font = YC_FONT_PFSC_Medium(14)
        titleLable.snp.makeConstraints { (make) in
            make.top.equalTo(4)
            make.left.equalTo(headImage.snp.right).offset(25)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        //手机号
        modifyPassView.addSubview(nowPhone)
        nowPhone.text = PHONEMUM()
        nowPhone.textColor = YCColorTitleBlack
        nowPhone.textAlignment = NSTextAlignment.right
        nowPhone.font = YC_FONT_PFSC_Medium(14)
        nowPhone.snp.makeConstraints { (make) in
            make.top.equalTo(4)
            make.right.equalTo(-25)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        //分割线
        let line1 = UIView()
        line1.backgroundColor = YCColorLight
        modifyPassView.addSubview(line1)
        line1.snp.makeConstraints({ (make) in
            make.top.equalTo(50)
            make.left.equalTo(70)
            make.right.equalTo(-0)
            make.height.equalTo(1)
        })
        modifyPassView.addSubview(nowSnSPhone)
        nowSnSPhone.placeholder = "请输入验证码"
        nowSnSPhone.clearButtonMode = .never
        nowSnSPhone.font = YC_FONT_PFSC_Medium(14)
        nowSnSPhone.setModifyClearButton()
        nowSnSPhone.snp.makeConstraints { (make) in
            make.top.equalTo(line1.snp.bottom).offset(0)
            make.left.equalTo(headImage.snp.right).offset(25)
            make.right.equalTo(-120)
            make.height.equalTo(50)
        }
        modifyPassView.addSubview(smsView)
        smsView.backgroundColor = YCColorWhite
        smsView.smsButton.layer.borderWidth = 1
        smsView.smsButton.layer.borderColor = YCColorBlue.cgColor
        smsView.smsButton.backgroundColor = gof_ColorWithHex(0xEDF6FF)
        smsView.smsButton.layer.cornerRadius = 3
        smsView.smsButton.setTitleColor(YCColorBlue, for: .normal)
        smsView.snp.makeConstraints { (make) in
            make.top.equalTo(60)
            make.right.equalTo(-25)
            make.width.equalTo(85)
            make.height.equalTo(30)
        }
        smsView.smsButton.snp.updateConstraints { (make) in
            make.height.equalTo(30)
        }
        smsView.sendCodeBlock = {() in
            self.viewModel.requestSendSmsVcode(phone: PHONEMUM(), success: {
                //验证码倒计时
                self.smsView.countDown(timeOut: 60)
            })
        }
    }
    
    lazy var viewModel: LoginViewModel = {
        return LoginViewModel()
    }()
    
    func initSetPassView() {
        self.view.addSubview(setPassView)
        setPassView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(modifyPassView.snp.bottom).offset(10)
            make.height.equalTo(160)
        }
        //标题
        let titleLable = UILabel()
        titleLable.textColor = YCColorLightBlack
        titleLable.font = YC_FONT_PFSC_Medium(13)
        titleLable.text = "设置登录密码后，您可以使用手机号+密码登录，请牢记！"
        setPassView.addSubview(titleLable)
        titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(5)
        }
        let bgView = UIView()
        setPassView.addSubview(bgView)
        bgView.backgroundColor = YCColorWhite
        bgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(titleLable.snp.bottom).offset(15)
            make.height.equalTo(100)
        }
        let imageArray:Array = ["set_pass","set_pass"]
        let placeArray:Array = ["请输入新密码","请确认密码 (6-18位数字或字母)"]

        //MARK:=======图标
        for i in 0..<imageArray.count {
            let headImage = UIImageView()
            headImage.image = UIImage(named: imageArray[i])
            bgView.addSubview(headImage)
            headImage.snp.makeConstraints { (make) in
                make.top.equalTo(18+i*45)
                make.left.equalTo(30)
                make.width.equalTo(20)
                make.height.equalTo(20)
            }
            let textFeild = UITextField()
            bgView.addSubview(textFeild)
            textFeild.placeholder = placeArray[i]
            textFeild.clearButtonMode = .never
            textFeild.font = YC_FONT_PFSC_Medium(14)
            textFeild.setModifyClearButton()
            textFeild.isSecureTextEntry = true
            textFeild.tag = i+10
            textFeild.snp.makeConstraints { (make) in
                make.top.equalTo(5+i*45)
                make.left.equalTo(75)
                make.right.equalTo(-50)
                make.height.equalTo(50)
            }
        }
        //分割线
        line.backgroundColor = YCColorLight
        bgView.addSubview(line)
        line.snp.makeConstraints({ (make) in
            make.top.equalTo(50)
            make.left.equalTo(70)
            make.right.equalTo(-0)
            make.height.equalTo(1)
        })
    }
    
    //添加提交按钮
    func initSubButton() {
        let footView = MyFootButtonView()
        self.view.addSubview(footView)
        footView.backgroundColor = YCColorLight
        footView.sureOverBtn.setTitle("提交", for: .normal)
        footView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20-SafeBottomMargin)
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(60)
        }
        footView.sureOverBtn.snp.updateConstraints { (make) in
            make.right.equalTo(-25)
            make.left.equalTo(25)
        }
        footView.sureOvercallBlock = {() in
            let newPassWord:UITextField = self.view.viewWithTag(10) as! UITextField
            let rePassWord:UITextField = self.view.viewWithTag(11) as! UITextField
            if(self.isPwd=="0"){
                if (newPassWord.text?.count==0||rePassWord.text?.count==0) {
                    SwiftProgressHUD.showOnlyText("密码不能为空!")
                    return
                }
                if (newPassWord.text != rePassWord.text) {
                    SwiftProgressHUD.showOnlyText("密码输入不一致，请重新输入!")
                    return
                }
                //MARK:===================设置新密码
                YCUserCenterNetwork.request(target: .setNewPassWord(userId: USERID(), loginPwd: newPassWord.text!), success: { (JSON) in
                    print("=========\(JSON)")
                    if(JSON["msg"]["code"].rawString()=="000000"){
                        //更新本地存储
                        UserInfoManager.shared.infoModel.isPwd = "1"
                        SwiftProgressHUD.showOnlyText("设置成功")
                        self.saveSuccessBlock!()
                        self.navigationController!.popViewController(animated: true)
                    }else{
                        let message = JSON["msg"]["msg"].rawString()
                        SwiftProgressHUD.showOnlyText(message!)
                    }
                }, failure: { (MoyaError) in
                    
                })
            }else{
                if (self.nowSnSPhone.text!.count==0) {
                    SwiftProgressHUD.showOnlyText("短信验证码不能为空!")
                    return
                }
                if (newPassWord.text?.count==0||rePassWord.text?.count==0) {
                    SwiftProgressHUD.showOnlyText("密码不能为空!")
                    return
                }
                if (newPassWord.text != rePassWord.text) {
                    SwiftProgressHUD.showOnlyText("密码输入不一致，请重新输入!")
                    return
                }
                //修改密码
                YCUserCenterNetwork.request(target: .modifyPassWord(phone: PHONEMUM(), loginPwd: newPassWord.text!, vaCode: self.nowSnSPhone.text!), success: { (JSON) in
                    print("=========\(JSON)")
                    if(JSON["msg"]["code"].rawString()=="000000"){
                        SwiftProgressHUD.showOnlyText("修改成功")
                        self.saveSuccessBlock!()
                        self.navigationController!.popViewController(animated: true)
                    }else{
                        let message = JSON["msg"]["msg"].rawString()
                        SwiftProgressHUD.showOnlyText(message!)
                    }
                }, failure: { (MoyaError) in
                    
                })
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for i in 0..<2 {
            let textField:UITextField = self.view.viewWithTag(i+10) as! UITextField
            textField.resignFirstResponder()
        }
        nowSnSPhone.resignFirstResponder()
    }

    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }

}
