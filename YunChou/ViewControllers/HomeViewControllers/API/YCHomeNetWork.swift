
//
//  YCHomeNetWork.swift
//  YunChou
//
//  Created by yy on 2018/10/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

//MARK:=========定义一个枚举，存放我们的网络请求k接口
enum homeApiManager{
    //获取首页title按钮数据
    case getHomeTitle
    //根据title获取项目列表
    case getHomeProjectList(parModel: YCHomeProjectParModel)
    //获取项目详情
    case getHomeProjectDetail(pid : String)
    
}

//MARK:=========设置不同接口的请求路径
extension homeApiManager:TargetType{
    var path : String {
        return SERVERAPI

//        switch self {
//        case .getHomeTitle:
//        return SERVERAPI
//        case .getHomeProjectList(parModel: _):
//            return "/WEBP0002"
//        }
    }
    
    //MARK:=========配置不同接口参数
    var task: Task {
        switch self {
        case .getHomeTitle: // 带有参数,注意前面的let
            let parModel  = YCHomeTitlesParModel()
            parModel.type = "project_type"
            parModel.methodCode = "basics/BAS80001"
            let params = parModel.toJSON()
            print("===\(String(describing: params))")
            return .requestParameters(parameters: params!,
                                      encoding: URLEncoding.default)
            
        case let .getHomeProjectList(parModel):
            parModel.methodCode = "product/WEBP0002"
            let params = parModel.toJSON()
            print("===\(String(describing: params))")
            return .requestParameters(parameters: params!,
                                      encoding: URLEncoding.default)
            
        case let .getHomeProjectDetail(pid):
            let params = ["id":pid,"methodCode":"product/WEBP0003"]
            return .requestParameters(parameters: ["id":pid,"methodCode":"product/WEBP0003"], encoding: URLEncoding.default)
            
            
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
struct  YCHomeNetWork{
    // 请求成功的回调
    typealias successCallback = (_ result: JSON) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
    // 单例
    static let provider = MoyaProvider<homeApiManager>()
    // 发送网络请求
    static func request(
        target: homeApiManager,
        success: @escaping successCallback,
        failure: @escaping failureCallback
        ) {
        YCLoadingView.show()
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
