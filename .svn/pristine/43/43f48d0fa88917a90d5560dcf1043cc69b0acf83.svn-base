
//
//  YCSearchNetWork.swift
//  YunChou
//
//  Created by yy on 2018/10/22.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

//MARK:=========定义一个枚举，存放我们的网络请求k接口
enum searchApiManager {

    case getAddressList //获取所在地列表
    case getRightAndProjectType(types:String) //获取项目类型 和 权益类型

    
//    case 
    
}
extension searchApiManager:TargetType{
    //MARK:=========设置不同接口的请求路径
    var path: String {
        
        return SERVERAPI

//        switch self {
//        case .getAddressList:
//            return "/DIST80002"
//        case .getRightAndProjectType(types : _):
//            return "/BAS80001"
//        }
        
    }
    //MARK:=========配置不同接口参数
    var task: Task {
        switch self {
        case .getAddressList: // 带有参数,注意前面的let
            return .requestParameters(parameters: ["methodCode":"basics/DIST80002"],
                                      encoding: URLEncoding.default)
            
        case let .getRightAndProjectType(types):
            let requestModel = YCSearchParModel()
            requestModel.methodCode = "basics/BAS80001"
            requestModel.type = types
            let requestParam = requestModel.toJSON()
            return .requestParameters(parameters: requestParam!, encoding: URLEncoding.default)
        
        }
    }
    
    var baseURL: URL {
        return URL(string: YCBASEURL)!
    }
    //MARK:=========设置不同接口的请求方式，get或post
    var method: Moya.Method {
        return .post
    }
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    var validate: Bool {
        return false
    }
    var headers: [String : String]? {
        return nil
    }
}

// 网络请求结构体
struct  YCSearchNetWork{
    // 请求成功的回调
    typealias successCallback = (_ result: JSON) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
    // 单例
    static let provider = MoyaProvider<searchApiManager>()
    // 发送网络请求
    static func request(
        target: searchApiManager,
        success: @escaping successCallback,
        failure: @escaping failureCallback
        ) {
//        YCLoadingView.show()
        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    
                    try success(JSON(moyaResponse.mapJSON())) // JSON字符串
                } catch {
                    failure(MoyaError.jsonMapping(moyaResponse))
                }
                YCLoadingView.hide()
            case let .failure(error):
                YCLoadingView.hide()
                failure(error)
            }
        }
    }
}
