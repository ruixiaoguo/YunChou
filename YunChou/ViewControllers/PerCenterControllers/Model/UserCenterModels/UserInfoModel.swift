//
//  UserInfoModel.swift
//  YunChou
//
//  Created by grx on 2018/10/19.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import HandyJSON

class UserInfoModel: HandyJSON {
    var userId:String?;
    var loginName:String?;//用户名
    var nickName:String?;//昵称
    var userImg:String?;//头像
    var phone:String?;//手机号
    var email:String?;//邮箱
    var weixin:String?;//微信
    var credits:String?;//积分
    var account:String?;//账户
    var cashAmount:String?;//可用金额
    var cashCouponNum:String?;//代金券数量
    var birthday:String?;//生日
    var realName:String?;//真实姓名
    var sex:String?;//性别 0-女,1-男
    var certNo:String?;//证件号码
    var certImg1:String?;//证件照片1
    var certImg2:String?;//证件照片2
    var certImg3:String?;//证件照片3
    var isName:String?;//是否认证：0未认证，1待审核，2审核未通过，3通过
    var isPayPwd:String?;//支付密码状态0未设定，1，有支付密码
    var isPwd:String?;//是否有登录密码 0无1有
    required init(){}
}
