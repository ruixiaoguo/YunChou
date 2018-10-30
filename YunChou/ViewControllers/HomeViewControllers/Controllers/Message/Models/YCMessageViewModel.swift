//
//  YCMessageViewModel.swift
//  YunChou
//
//  Created by yy on 2018/10/19.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import HandyJSON
import Moya
import SwiftProgressHUD

class YCMessageViewModel: NSObject {
    //MARK  -  数据模型
    var messageList : [YCMessageDateModel]?   //各类消息列表
    var messageSummaryList :YCMessageSummaryDateModel?
    var pages : String?  //总共多少条数据
    
    // 请求成功的回调
    typealias successCallback = () -> Void
    // 请求失败的回调
    typealias failureCallback = () -> Void
    // 请求错误的回调
    typealias errorCallback = (_ error: MoyaError) -> Void

}

// Mark:-请求数据
extension YCMessageViewModel {
    //获取消息总汇
    func requestMessageSummaryList(success:@escaping successCallback){
    
    YCMessageNetWork.request(target: .getMessageSummaryList, success: { (JSON) in
    print("\(JSON)")
    
    if(JSON["msg"]["code"].rawString()=="000000"){
    
//    if let recommendList = JSONDeserializer<YCMessageSummaryDateModel>.deserializeModelArrayFrom(json: JSON["data"].description) {
//        self.messageSummaryList = recommendList as? [YCMessageSummaryDateModel]
//    }
      self.messageSummaryList = JSONDeserializer<YCMessageSummaryDateModel>.deserializeFrom(dict: JSON["data"].dictionaryValue)
        
//        self.messageSummaryList = JSON["data"].dictionaryValue as NSDictionary
    
    
    success()
    }else{
    let message = JSON["msg"]["msg"].rawString()
    SwiftProgressHUD.showOnlyText(message!)
    }
    
    }) { (MoyaError) in
    SwiftProgressHUD.showOnlyText("服务器异常！")
    }
    }
    
    
    
    
    //获取消息列表
    func requestMessageList(parModel: YCMessageParModel,
                            isLoad : Bool,
                            tableview : UITableView,
                            success:@escaping successCallback ,
                            failure:@escaping failureCallback ,
                            error:@escaping errorCallback){
        
        YCMessageNetWork.request(target: .getMessageList(parModel: parModel), success: { (JSON) in
            print("\(JSON)")
            
            tableview.endRefresh()

            if(JSON["msg"]["code"].rawString()=="000000"){
                
                self.pages = JSON["page"]["pages"].rawString()

                if let recommendList = JSONDeserializer<YCMessageDateModel>.deserializeModelArrayFrom(json: JSON["data"]["info"].description) {

                    //上拉加载
                    if isLoad{
                        self.messageList = self.messageList! + (recommendList as? [YCMessageDateModel])!
                    }else{
                        self.messageList = recommendList as? [YCMessageDateModel]
                    }
                    
                }
                
                if "\(self.pages)" == parModel.currentPageNum{
                    //暂无更多数据
                    tableview.YCFoot.endRefreshingWithNoMoreData()
                }
                if self.messageList?.count == 0{
                    tableview.YCFoot.isHidden = true
                }

                success()
                
            }else{
                if JSON["msg"]["code"].rawString()=="999999" {
                     tableview.YCFoot.isHidden = true
                }
                let message = JSON["msg"]["msg"].rawString()
                SwiftProgressHUD.showOnlyText(message!)
                failure()

            }
            
            tableview.ly_endLoading()

        }) { (MoyaError) in
            
            tableview.endRefresh()
            tableview.ly_endLoading()

            SwiftProgressHUD.showOnlyText("服务器异常！")
            error(MoyaError)
        }
    }
    

}
