//
//  TCMoyaNetWork.swift
//  YunChou
//
//  Created by grx on 2018/9/21.
//  Copyright © 2018年 grx. All rights reserved.
//

import Foundation
import Moya

extension ApiManager:TargetType{
    var baseURL: URL {
        return URL.init(string: "https://httpbin.org")!
    }
    //请求路径
    var path: String {
        switch self {
        case .demo1:
            return "/get"
        case .demo2(name: _):
            return "/post"
        }
    }
    // 各个接口的请求方式，get或post
    var method: Moya.Method {
        switch self {
        case .demo1:
            return .get
        case .demo2:
            return .post
        }
    }
    
    // 请求头
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    // 请求是否携带参数，如果需要参数，就做如demo2和demo3的设置
    var task: Task {
        switch self {
        case .demo1:
            return .requestPlain // 无参数
        case let .demo2(name): // 带有参数,注意前面的let
            return .requestParameters(parameters: ["name" : name], encoding: URLEncoding.default)
        }
    }
    
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var validate: Bool {
        return false
    }
}

// 网络请求结构体
struct WHNetwork {
    
    // 请求成功的回调
    typealias successCallback = (_ result: Any) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
    
    // 单例
    static let provider = MoyaProvider<ApiManager>()
    
    // 发送网络请求
    static func request(
        target: ApiManager,
        success: @escaping successCallback,
        failure: @escaping failureCallback
        ) {
        
        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    try success(moyaResponse.mapJSON()) // 测试用JSON数据
                } catch {
                    failure(MoyaError.jsonMapping(moyaResponse))
                }
            case let .failure(error):
                failure(error)
            }
        }
    }
}

// 1 定义一个枚举，存放我们的网络请求
enum ApiManager {
    case demo1
    case demo2(name: String)
}
