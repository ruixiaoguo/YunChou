//
//  YCSearchViewModel.swift
//  YunChou
//
//  Created by yy on 2018/10/22.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import HandyJSON
import Moya
import SwiftProgressHUD


class YCSearchViewModel: NSObject {
    //MARK  -  数据模型
    var addressList : [YCSearchTagDateModel]?
    //项目类型
    var projectTagsList : [YCSearchTagDateModel]?
    //权益类型
    var rightTagsList : [YCSearchTagDateModel]?

    // 请求成功的回调
    typealias successCallback = () -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
}

// Mark:-请求数据
extension YCSearchViewModel {
    //获取项目所在地列表

    func requestProjectAddressList(success:@escaping successCallback){
        
        YCSearchNetWork.request(target: .getAddressList, success: { (JSON) in
//            print("\(JSON)")
            
            if(JSON["msg"]["code"].rawString()=="000000"){
                
                if let recommendList = JSONDeserializer<YCSearchTagDateModel>.deserializeModelArrayFrom(json: JSON["data"].description) {
                    self.addressList = recommendList as? [YCSearchTagDateModel]
                }
                
                
                success()
            }else{
                let message = JSON["msg"]["msg"].rawString()
                SwiftProgressHUD.showOnlyText(message!)
            }
            
        }) { (MoyaError) in
            SwiftProgressHUD.showOnlyText("服务器异常！")
        }
    }
    
    //获取项目类型 或 权益类型
    func requestGetPorjectOrRightType(types : String ,success:@escaping successCallback){
        YCSearchNetWork.request(target: .getRightAndProjectType(types: types), success: { (JSON) in
//            print("\(JSON)")
            
            if(JSON["msg"]["code"].rawString()=="000000"){
                
                if let recommendList = JSONDeserializer<YCSearchTagDateModel>.deserializeModelArrayFrom(json: JSON["data"].description) {
                    if types.compare("project_type").rawValue == 1{
                        self.projectTagsList = recommendList as? [YCSearchTagDateModel]

                    }else{
                        self.rightTagsList = recommendList as? [YCSearchTagDateModel]

                    }
                }
                
                
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
