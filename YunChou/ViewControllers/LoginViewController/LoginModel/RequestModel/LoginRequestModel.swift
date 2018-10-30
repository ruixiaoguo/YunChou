//
//  LoginRequestModel.swift
//  YunChou
//
//  Created by grx on 2018/10/18.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class LoginRequestModel: YCBaseRequestModel {
      var loginName:String?;         //账号
      var loginPwd:String?;          //密码
      var phone:String?;             //电话
      var vaCode:String?;            //验证码
      required init(){}
}
