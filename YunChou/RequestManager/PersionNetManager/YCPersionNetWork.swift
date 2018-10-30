//
//  YCPersionNetWork.swift
//  YunChou
//
//  Created by grx on 2018/10/19.
//  Copyright © 2018年 grx. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

//MARK:=========定义一个枚举，存放我们的网络请求k接口
enum persionApiManager {
    case gaintUserInfo(userId: String)  //获取会员信息
}

extension persionApiManager:TargetType{
    //MARK:=========设置不同接口的请求路径
    var path: String {
        switch self {
        case .gaintUserInfo(userId: _):
            return "/USER1017"
        }
    }
    //MARK:=========配置不同接口参数
    var task: Task {
        switch self {
        case let .gaintUserInfo(userId): // 带有参数,注意前面的let
            let requestModel = LoginRequestModel()
            requestModel.userId = userId
            let requestParam = requestModel.toJSON()
            print("===\(String(describing: requestParam))")
            return .requestParameters(parameters: requestParam!,
                                      encoding: URLEncoding.default)
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
struct YCPersionNetwork {
    // 请求成功的回调
    typealias successCallback = (_ result: JSON) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
    // 单例
    static let provider = MoyaProvider<persionApiManager>()
    // 发送网络请求
    static func request(
        target: persionApiManager,
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


