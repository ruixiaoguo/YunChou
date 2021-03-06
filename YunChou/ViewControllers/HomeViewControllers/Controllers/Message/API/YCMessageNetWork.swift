//
//  YCMessageNetWork.swift
//  YunChou
//
//  Created by yy on 2018/10/19.
//  Copyright © 2018年 grx. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

//MARK:=========定义一个枚举，存放我们的网络请求k接口
enum messageApiManager {
    
    //status 状态：0未看，1已看
    //type 类型： 1站内信 2项目 3账户
    case getMessageList(parModel: YCMessageParModel) //获取消息列表
    case getMessageSummaryList //获取消息总汇

}

extension messageApiManager:TargetType{
    //MARK:=========设置不同接口的请求路径
    var path: String {
        
        return SERVERAPI

//        switch self {
//        case .getMessageList(parModel: _):
//            return "/UMES000007"
//        case .getMessageSummaryList:
//            return "/UMES000008"
//        }
    }
    //MARK:=========配置不同接口参数
    var task: Task {
        switch self {
        case let .getMessageList(parModel): // 带有参数,注意前面的let
            parModel.methodCode = "basics/UMES000007"
            let requestParam = parModel.toJSON()
            print("===\(String(describing: requestParam))")
            return .requestParameters(parameters: requestParam!,
                                      encoding: URLEncoding.default)
        
        case .getMessageSummaryList:
            let parModel  = YCBaseRequestModel()
            parModel.methodCode = "basics/UMES000008"
            let paramet = parModel.toJSON()
            
            return .requestParameters(parameters: paramet!, encoding: URLEncoding.default)
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
struct  YCMessageNetWork{
    // 请求成功的回调
    typealias successCallback = (_ result: JSON) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
    // 单例
    static let provider = MoyaProvider<messageApiManager>()
    // 发送网络请求
    static func request(
        target: messageApiManager,
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
