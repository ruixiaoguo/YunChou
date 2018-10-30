//
//  LoginViewModel.swift
//  YunChou
//
//  Created by grx on 2018/10/18.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import HandyJSON
import Moya
import SwiftProgressHUD

class LoginViewModel: NSObject {
    // 请求成功的回调
    typealias successCallback = () -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
}

// Mark:-请求数据
extension LoginViewModel {
    //MARK:=============账号密码登录
    func requestAccountLogin(loginName: String, loginPwd: String, success:@escaping successCallback) {
        
        if loginName.count==0 || loginPwd.count==0 {
            SwiftProgressHUD.showOnlyText("账号或密码不能为空!")
            return
        }
        YCLoginNetwork.request(target: .accountLogin(loginName: loginName, loginPwd: loginPwd), success: { (JSON) in
            
            if(JSON["msg"]["code"].rawString()=="000000"){
                //用户ID
                let userId = JSON["data"]["userId"].rawString()
                //用户名
                let loginName = JSON["data"]["loginName"].rawString()
                //手机号
                let phoneNum = JSON["data"]["phone"].rawString()
                UserDefaults.standard.set(userId, forKey: UserDefaultKeys().userId)
                UserDefaults.standard.set(loginName, forKey: UserDefaultKeys().userName)
                UserDefaults.standard.set(phoneNum, forKey: UserDefaultKeys().phoneNum)
                MMKV.default()?.setBool(true, forKey: "isLogin")
                success()
            }else{
                let message = JSON["msg"]["msg"].rawString()
                SwiftProgressHUD.showOnlyText(message!)
            }
        }) { (MoyaError) in
            SwiftProgressHUD.showOnlyText("服务器异常！")
        }
    }
    //MARK:=============短信验证码登录
    func requestSmsLogin(phone: String, vcode: String, success:@escaping successCallback) {
        if phone.count==0 || vcode.count==0 {
            SwiftProgressHUD.showOnlyText("手机号或验证码不能为空!")
            return
        }
        //验证手机号格式
        if (UtilityFunction.validatePhonoNum(photo: phone)==false) {
            SwiftProgressHUD.showOnlyText("手机号格式有误，请重新输入！")
            return
        }
        YCLoginNetwork.request(target: .smsLogin(phone: phone, vaCode: vcode), success: { (JSON) in
            
            if(JSON["msg"]["code"].rawString()=="000000"){
                //用户ID
                let userId = JSON["data"]["userId"].rawString()
                //用户名
                let loginName = JSON["data"]["loginName"].rawString()
                //手机号
                let phoneNum = JSON["data"]["phone"].rawString()
                UserDefaults.standard.set(userId, forKey: UserDefaultKeys().userId)
                UserDefaults.standard.set(loginName, forKey: UserDefaultKeys().userName)
                UserDefaults.standard.set(phoneNum, forKey: UserDefaultKeys().phoneNum)
                MMKV.default()?.setBool(true, forKey: "isLogin")
                success()
            }else{
                let message = JSON["msg"]["msg"].rawString()
                SwiftProgressHUD.showOnlyText(message!)
            }
        }) { (MoyaError) in
            SwiftProgressHUD.showOnlyText("服务器异常！")
        }
    }
    //MARK:=============发送短信验证码
    func requestSendSmsVcode(phone: String, success:@escaping successCallback) {
        if phone.count==0 {
            SwiftProgressHUD.showOnlyText("手机号不能为空!")
            return
        }
        //验证手机号格式
        if (UtilityFunction.validatePhonoNum(photo: phone)==false) {
            SwiftProgressHUD.showOnlyText("手机号格式有误，请重新输入！")
            return
        }
        YCLoginNetwork.request(target: .sendSmsVcode(phone: phone), success: { (JSON) in
            if(JSON["msg"]["code"].rawString()=="000000"){
                SwiftProgressHUD.showOnlyText("发送成功")
                success()
            }else{
                let message = JSON["msg"]["msg"].rawString()
                SwiftProgressHUD.showOnlyText(message!)
            }
        }) { (MoyaError) in
            SwiftProgressHUD.showOnlyText("服务器异常！")
        }
    }
}
