//
//  YCLoginNetWork.swift
//  YunChou
//
//  Created by grx on 2018/10/17.
//  Copyright © 2018年 grx. All rights reserved.
//

import Foundation
import Moya

//MARK:=========Modify 定义一个枚举，存放我们的网络请求
enum loginApiManager {
    case login(name: String, passWord: String)
    case logout
    case upload(bodyData: Data, isShow:Bool)
}

extension loginApiManager:TargetType{
    var baseURL: URL {
        switch self {
        case .upload(bodyData: _, isShow: _):
            return URL(string: "https://www.pmphmall.com")!
        default:
            return URL(string: YCBASEURL)!
        }
    }
    //MARK:=========Modify请求路径
    var path: String {
        switch self {
        case .logout:
            return "/get"
        case .login(name: _, passWord: _):
            return "/accountService/login"
        case .upload(bodyData: _, isShow: _):
            return "/accountService/login"
        }
    }
    //MARK:=========Modify 各个接口的请求方式，get或post
    var method: Moya.Method {
        switch self {
        case .logout:
            return .get
        case .login:
            return .post
        case .upload:
            return .post
        }
    }
    //MARK:=========Modify 请求是否携带参数，如果需要参数，就做如demo2和demo3的设置
    var task: Task {
        switch self {
        case .logout:
            return .requestPlain // 无参数
        case let .login(name,passWord): // 带有参数,注意前面的let
            return .requestParameters(parameters: ["name" : name, "passWord":passWord], encoding: URLEncoding.default)
        case let .upload(bodyData,isShow): // 带有参数,注意前面的let
            return .requestParameters(parameters: ["bodyData" : bodyData,"isShow" : isShow], encoding: URLEncoding.default)
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
    
    // 请求头
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    var show: Bool { //是否显示转圈提示
        switch self {
        case .upload(bodyData: _,let isShow):
            return isShow
        default:
            return false
        }
    }
}

// 网络请求结构体
struct YCLoginNetwork {
    // 请求成功的回调
    typealias successCallback = (_ result: Any) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
    // 单例
    static let provider = MoyaProvider<loginApiManager>()
    // 发送网络请求
    static func request(
        target: loginApiManager,
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
