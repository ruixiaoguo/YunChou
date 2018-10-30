//
//  YCBaseRequestModel.swift
//  YunChou
//
//  Created by grx on 2018/10/18.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import HandyJSON

class YCBaseRequestModel: HandyJSON {
    var branch:String = "1001"         //平台
    var userId : String = USERID()     //userID
    var methodCode:String?        //平台
    required init(){}
}
