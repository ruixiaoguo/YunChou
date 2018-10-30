//
//  YCNewsParmetersModel.swift
//  YunChou
//
//  Created by yy on 2018/10/24.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import HandyJSON

class YCNewsParmetersModel: HandyJSON {
    var currentPageNum : String?
    var pageCount : String = "10"
    
    required init(){}

}

//轮播图
class YCNewsBannerParModel: HandyJSON {
    var currentPageNum : String?
    var pageCount : String = "10"
    var methodCode : String?

    required init(){}

}
//新闻列表 及 详情
class YCNewsListParModel: HandyJSON {
    var currentPageNum : String?
    var pageCount : String = "2"
    var type : String = "0"
    var startTime : String = "2017-11-11 11:11:11"
    var endTime : String = NOWDATE(formatStr: "yyyy-MM-dd HH:mm:ss")

    var methodCode : String?
    required init(){}

}
