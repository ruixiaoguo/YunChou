//
//  YCHomeViewModel.swift
//  YunChou
//
//  Created by yy on 2018/10/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import HandyJSON
import Moya
import SwiftProgressHUD

class YCHomeViewModel: NSObject {
    //MARK  -  数据模型
     var titlesList : [YCHomeTitleDataModel]?   //title
     var projectList : [YCHomeProjectListDataModel]?//项目列表
     var pages : String?  //总共多少条数据
    
    var detailModel : YCHomeProjectDetailDataModel? //项目详情Model

    
    // 请求成功的回调
    typealias successCallback = () -> Void
    // 请求失败的回调
    typealias failureCallback = () -> Void
    // 请求错误的回调
    typealias errorCallback = (_ error: MoyaError) -> Void
}
// Mark:-请求数据
extension YCHomeViewModel {
    //获取title
    func requestHomeTtileList(success:@escaping successCallback){
        YCHomeNetWork.request(target: .getHomeTitle, success: {(JSON) in
        
            if(JSON["msg"]["code"].rawString()=="000000"){
                
                if let recommendList = JSONDeserializer<YCHomeTitleDataModel>.deserializeModelArrayFrom(json: JSON["data"].description) {
                    
                    self.titlesList = recommendList as? [YCHomeTitleDataModel]
                }
                
                success()
                
            }else{
             
                let message = JSON["msg"]["msg"].rawString()
                SwiftProgressHUD.showOnlyText(message!)
//                failure()
            }
            
        }, failure: { (MoyaError) in
      
            SwiftProgressHUD.showOnlyText("服务器异常！")
//            error(MoyaError)
            
        })
        
    }
    //获取项目列表
    func requestHomeProjectList(parModel:YCHomeProjectParModel,
                                isLoad:Bool,
                                tableview:UITableView,
                                success:@escaping successCallback,
                                failure:@escaping failureCallback,
                                error:@escaping errorCallback){
        
        YCHomeNetWork.request(target: .getHomeProjectList(parModel: parModel), success: {(JSON) in
            tableview.endRefresh()

            if(JSON["msg"]["code"].rawString()=="000000"){
                
                self.pages = JSON["data"]["page"]["pages"].rawString()
                
                if let recommendList = JSONDeserializer<YCHomeProjectListDataModel>.deserializeModelArrayFrom(json: JSON["data"]["info"].description) {
                    
                    //上拉加载
                    if isLoad{
                        self.projectList = self.projectList! + (recommendList as? [YCHomeProjectListDataModel])!
                    }else{
                        self.projectList = recommendList as? [YCHomeProjectListDataModel]
                    }
                    
                }
                
                let current : String = parModel.currentPageNum!
                let all : String = self.pages!
                if all.compare(current).rawValue == 0{
                    //暂无更多数据
                    tableview.YCFoot.endRefreshingWithNoMoreData()
                }
                if self.projectList?.count == 0{
                    tableview.YCFoot.isHidden = true
                }

                success()

            }else{
                self.projectList?.removeAll()
                
                let model = YCHomeProjectListDataModel()
                
                
                if JSON["msg"]["code"].rawString()=="999999" {
                    tableview.YCFoot.isHidden = true
                }
                let message = JSON["msg"]["msg"].rawString()
                SwiftProgressHUD.showOnlyText(message!)
                failure()
            }
            tableview.ly_endLoading()

        }, failure: {(MoyaError) in
            tableview.endRefresh()
            tableview.ly_endLoading()
            
            SwiftProgressHUD.showOnlyText("服务器异常！")
            error(MoyaError)
        })
        
    }
    
    
    //获取项目详情
    func requestHomePrjectDetail(pid:String,
                                 success:@escaping successCallback,
                                 failure:@escaping failureCallback,
                                 error:@escaping errorCallback){
        
        YCHomeNetWork.request(target: .getHomeProjectDetail(pid: pid), success: {(JSON) in
            print(JSON)
            
            if(JSON["msg"]["code"].rawString()=="000000"){
                
                if let mapObject = JSONDeserializer<YCHomeProjectDetailDataModel>.deserializeFrom(json: JSON["data"].description){
                    self.detailModel = mapObject
                }
                success()
                
            }else{
                let message = JSON["msg"]["msg"].rawString()
                SwiftProgressHUD.showOnlyText(message!)
                failure()
                
            }
            
        }, failure: {(MoyaError) in
            SwiftProgressHUD.showOnlyText("服务器异常！")
            error(MoyaError)
        })
        
    }
    
    
}