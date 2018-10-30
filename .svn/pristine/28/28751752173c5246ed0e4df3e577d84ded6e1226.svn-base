
//
//  YCHomeParmetersModel.swift
//  YunChou
//
//  Created by yy on 2018/10/19.
//  Copyright © 2018年 grx. All rights reserved.
//


//  请求参数model

import UIKit

/*
 Home首页请求参数
 */
class YCHomeParmetersModel: YCBaseRequestModel {
    

}

/*
 首页title按钮参数
 */
class YCHomeTitlesParModel: YCBaseRequestModel {
    var type : String?
    required init(){}

}

/*
首页项目列表参数
*/
class YCHomeProjectParModel: YCBaseRequestModel {
    var currentPageNum : String?
    var pageSize : String = "12"
    var status : String = "0"
    var projectName : String?
    var projectTypes : String?
    var rightsTypes : String?
    var areaAddresses : String?
    var sortType : String = "publishDate"
    var sortDesc : String = "1"

    required init(){}
}

/*
 消息请求参数
 */
class YCMessageParModel: YCBaseRequestModel {
    var currentPageNum : String?
    var pageCount : String = "10"
    var timeStart : String = "2017-11-11 11:11:11"
    var timeEnd : String = NOWDATE(formatStr: "yyyy-MM-dd HH:mm:ss")
    var title : String?
    var del : String?   //删除标记，0正常，1移除
    var status : String?   //= "0"   //状态：0未看，1已看
    var type : String?
    
    
    required init(){}

}

/*
 搜索请求参数
 */
class YCSearchParModel: YCBaseRequestModel {
    var type : String?

}
