
//
//  YCHomeDataModel.swift
//  YunChou
//
//  Created by yy on 2018/10/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import HandyJSON

class YCHomeDataModel: NSObject {

}

//首页title按钮
struct YCHomeTitleDataModel: HandyJSON {
    
    var value:String?
    var label:String?
    var type:String?
    var remarks:String?
    var id:String?
    var branch:String?
    var description:String?
    var sort:String?
    var icon:String?
}

//首页项目列表
struct YCHomeProjectListDataModel: HandyJSON {
    
    var id:String?
    var projectName:String?
    var areaAddress:String?
    var pcImageUrl:String?
    var appImageUrl:String?
    var projectSummary:String?
    var schedule:String?
    var remainingTime:String?
    var projectStatus:String?
    var companyName:String?
    var logo:String?
    var icon:String?
    var projectTypeName:String?
    var district:String?

}

//首页项目详情
struct YCHomeProjectDetailDataModel: HandyJSON {
    
    var id:String?
    var projectName:String?
    var areaAddress:String?
    var pcImageUrl:String?
    var appImageUrl:String?
    var projectSummary:String?
    var projectType:String?
    var schedule:String?
    var remainingTime:String?
    var totalAmount:String?
    var amount:String?
    var pcHeaderImages:String?
    var appHeaderImages:String?
    var projectDetail:String?
    var programmeDetail:String?
    var investmentAmount:String?
    var openList:[YCOpenListModel]?
    var privateList:[YCPriateListModel]?
    var projectStatus:String?
    var companyName:String?
    var logo:String?
    var icon:String?
    var projectTypeName:String?
    var contactsTel:String?
    var district:String?
}
//项目详情 投资人可见信息
struct YCPriateListModel: HandyJSON {
    var fileName:String?
    var fileUrl:String?

}
//项目详情 公开披露信息
struct YCOpenListModel: HandyJSON {
    var fileName:String?
    var fileUrl:String?
}
